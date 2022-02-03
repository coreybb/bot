//
//  ConfettiView.swift
//  
//
//  Created by Corey Beebe on 2/3/22.
//

import UIKit
import CoreMotion
import CoreGraphics


///Manages ShapeViews on a certain designated UIView
class ConfettiLayer {
    
    let view:UIView
    var timer:Timer? = nil
    var motionManager = CMMotionManager()
    
    //UIDynamic animator and different behaviors
    var animator: UIDynamicAnimator
    var itemBehavior = UIDynamicItemBehavior()
    var collisions = UICollisionBehavior()
    
    
    // TODO: create a struct to represent the layer state
    // Initial layer state
    var baseVelocity = CGPoint(x: 0, y: 200.0)
    var calculatedVelocity: CGPoint
    var totalTilt = 1.0
    
    ///The depth that will be simulated by this layer
    var depth: Double
    
    
    /**
     Initializes a new confetti layer on a designated view.
     - Parameters:
     - view: The target view where the confetti will be added
     - depth: Simulates depth feeling using size and speed. Default = 1.0
     */
    init(view aView: UIView, depth aDepth: Double = 1.0) {
        
        view = aView
        animator = UIDynamicAnimator(referenceView: view)
        calculatedVelocity = baseVelocity
        depth = aDepth
        baseVelocity = CGPoint(x: baseVelocity.x / CGFloat(depth), y: baseVelocity.y / CGFloat(depth))
        
        if motionManager.isAccelerometerAvailable {
            motionManager.startAccelerometerUpdates()
        }
        
        setupBehaviors()
        setupTimerLoop()
    }
    
    
    ///Setting up the UIDynamic behaviors
    func setupBehaviors() {
        
        collisions.collisionMode = .boundaries
        resetBounderies()
        
        itemBehavior.allowsRotation = true
        itemBehavior.friction = 0.0
        itemBehavior.resistance = 0
        itemBehavior.elasticity = 0
        
        
        animator.addBehavior(itemBehavior)
        animator.addBehavior(collisions)
    }
    
    func resetBounderies() {
        
        collisions.removeAllBoundaries()
        collisions.addBoundary(withIdentifier: "left" as NSCopying, from: CGPoint(x: 0, y: 0), to: CGPoint(x: 0, y: self.view.bounds.size.height))
        collisions.addBoundary(withIdentifier: "right" as NSCopying, from: CGPoint(x: self.view.bounds.size.width, y: 0), to: CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height))
    }
    
    
    func setupTimerLoop() {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.onTimeTic), userInfo: nil, repeats: true)
    }
    
    
    func invalidateTimer() {
        
        timer?.invalidate()
    }
    
    @objc func onTimeTic()  {
        
        self.randomlyAddParticle()
        self.updateCurrentState(self.motionManager.accelerometerData)
    }
    
    
    func updateCurrentState(_ accelerometerData:CMAccelerometerData?)  {
        
        //Calculating the new velocity of the items according to the tilt of the device
        if let accelerometerData = accelerometerData {
            
            self.totalTilt = -accelerometerData.acceleration.y
            self.calculatedVelocity = CGPoint(x: self.baseVelocity.x + CGFloat(accelerometerData.acceleration.x * 200 / self.depth), y:  CGFloat(-accelerometerData.acceleration.y * 300 / self.depth))
        }
        
        self.itemBehavior.items.forEach{ item in
            
            //Changing the item's speed
            let velocity = self.itemBehavior.linearVelocity(for: item)
            let delta = CGPoint(x: self.calculatedVelocity.x - velocity.x, y: self.calculatedVelocity.y - velocity.y)
            
            self.itemBehavior.addLinearVelocity(delta, for: item)
            
            //Checking if if the item needs to be released
            if let view = item as? UIView {
                
                if view.frame.origin.y > self.view.frame.size.height {
                    
                    self.collisions.removeItem(item)
                    self.itemBehavior.removeItem(item)
                    view.removeFromSuperview()
                }
            }
        }
    }
    
    
    func randomlyAddParticle() {
        
        //Adds particles dependent upon the tilt of the device. A more tilted device reduces the chance of additional particles.
        let chance = Double(arc4random_uniform(UInt32(100)))
        
        if  chance < self.totalTilt * 80 {
            
            let randomX = Int(arc4random_uniform(UInt32(view.frame.width)))
            self.addParticle(at: CGPoint(x: randomX, y: -50))
        }
    }
    
    
    func addParticle(at point: CGPoint) {
        
        let shapeView = ShapeView(center: point, depth: self.depth)
        self.view.addSubview(shapeView)
        
        let percentage = Double(arc4random_uniform(UInt32(101))) / 100.0
        
        shapeView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * percentage))
        
        collisions.addItem(shapeView)
        itemBehavior.addItem(shapeView)
        itemBehavior.addLinearVelocity(calculatedVelocity, for: shapeView)
        
        let spin = Int(arc4random_uniform(UInt32(100)))
        
        if spin > 80 {
            
            itemBehavior.addAngularVelocity(CGFloat(Double.pi), for: shapeView)
        }
    }
}



open class ConfettiView: UIView {
    
    open var isAnimating = true
    
    // MARK: Declarations
    var confettiLayers = [ConfettiLayer]()
    
    override open var bounds: CGRect {
        
        didSet {
            
            confettiLayers.forEach { layer in layer.resetBounderies() }
        }
    }
    
    
    // MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addConfetti()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addConfetti()
    }
    
    
    // MARK: Confetti Methods
    private func addConfetti() {
        
        self.confettiLayers.append(ConfettiLayer(view: self))
        self.confettiLayers.append(ConfettiLayer(view: self, depth: 1.5))
        self.confettiLayers.append(ConfettiLayer(view: self, depth: 2))
    }
    
    
    // MARK: Touches
    override  open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { }
    override  open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) { }
    override  open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) { }
    
    
    // MARK: API Controls
    open func stopAnimating() {
        
        isAnimating = false
        confettiLayers.forEach { layer in layer.invalidateTimer() }
    }
    
    
    open func startAnimating() {
        
        guard isAnimating == false else { return }
        isAnimating = true
        confettiLayers.forEach { layer in layer.setupTimerLoop() }
    }
}


// MARK: ShapeType
enum ShapeType {
    
    var possibleColors:[UIColor] {
        
        get {
            
            return [#colorLiteral(red: 0, green: 0.4443781972, blue: 0.8679092526, alpha: 1),#colorLiteral(red: 0.5667363405, green: 0.8658216596, blue: 0.4901404977, alpha: 1),#colorLiteral(red: 1, green: 0.9203848839, blue: 0.331726253, alpha: 1),#colorLiteral(red: 0.9978461862, green: 0.3002898395, blue: 0.2846045196, alpha: 1),#colorLiteral(red: 0.7954284549, green: 0.3837707639, blue: 0.7679683566, alpha: 1)]
        }
    }
    
    case circle
    case triangle
    case square
    case squiggle
    
    
    /**
     Depends on the enum returns draw closure.
     - Returns: A draw closure that is adaptable to size and color.
     - The returned closure is intended to be called inside of draw rect.
     */
    
    func getDrawfunction() -> ((CGRect,UIColor)->()) {
        
        switch self {
            
        case .circle:
            
            return { rect, color in
                
                let path = UIBezierPath(ovalIn: rect)
                
                color.setFill()
                path.fill()
            }
            
        case .square:
            
            return { rect, color in
                
                let path = UIBezierPath(rect: rect)
                
                color.setFill()
                path.fill()
            }
            
        case .triangle:
            
            return { rect, color in
                
                let path = UIBezierPath()
                
                path.move(to: CGPoint(x: 0, y: rect.size.width))
                path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
                path.addLine(to: CGPoint(x: rect.size.width / 2, y: 0))
                path.addLine(to: CGPoint(x: 0, y: rect.size.width))
                color.setFill()
                path.fill()
            }
            
        case .squiggle:
            
            return {
                
                rect, color in
                
                let path = UIBezierPath()
                
                path.move(to: CGPoint(x: 5, y: 5))
                path.addCurve(to: CGPoint(x: rect.size.width - 5, y: rect.size.width - 5), controlPoint1: CGPoint(x: 0, y: rect.size.width), controlPoint2: CGPoint(x: rect.size.width, y: 0))
                path.lineWidth = 2.0
                color.setStroke()
                path.stroke()
            }
        }
    }
    
    
    func getRandomColor() -> UIColor {
        
        return possibleColors.randomElement()!
    }
    
    
    static func random()-> ShapeType {
        
        return [ShapeType.circle,ShapeType.square,.triangle,.squiggle].randomElement()!
    }
}



// MARK: ShapeView
/// UIView subclass which is initialized with a random Shape and color
class ShapeView: UIView {
    
    /// The shape that will be drawn in the view. This cannot change.
    let shapeType: ShapeType
    
    /// The color of the shape that will be drawn in the view. This cannot change
    let shapeColor: UIColor
    
    
    // MARK: Lifecycle
    override func draw(_ rect: CGRect) {
        
        let drawFunction = shapeType.getDrawfunction()
        drawFunction(rect, shapeColor)
    }
    
    
    override init(frame: CGRect) {
        
        shapeType = ShapeType.random()
        shapeColor = shapeType.getRandomColor()
        
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /**
     Initialize a new shape view with random shape and color
     
     Parameters
     - Center: The center position of the initiaized view
     - Depth: The wanted depth, this causes the shape to move faster and apear smaller to create the illusion of depth *Default Value is 1*
     */
    
    convenience init(center point:CGPoint, depth:Double = 1) {
        self.init(frame:CGRect(x: 0, y: 0, width: 20/depth, height: 20/depth))
        self.center = point
    }
}
