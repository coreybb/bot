//
//  CardContentView.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//

import UIKit


class CardContentView: UIView {
    
    
    //---------------------------
    //  MARK: Private Properties
    //---------------------------
    private let interruption: Interruption
    private let delegate: InterruptionCardDelegate
    
    private lazy var labelsStackView: UIStackView = {
        
        let spacing: CGFloat = 36

        let labels: [UILabel] = [CardHeaderLabel(text: interruption.header.text), CardSecondaryLabel(text: interruption.body)]
        let stackView: UIStackView = UIStackView(arrangedSubviews: labels)
        stackView.axis = .vertical
        stackView.spacing = spacing
        return stackView
    }()


    private lazy var button: UIButton = {
        
        let button: HollowGradientPillButton = HollowGradientPillButton()
        let buttonText: String = interruption.callToAction ?? "OK"
        button.setTitle(buttonText, for: .normal)
        button.titleLabel?.font = MrEavesFont.regular.font(size: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleButtonPress), for: .touchUpInside)
        return button
    }()
    
    
    
    //---------------
    //  MARK: - Init
    //---------------
    init(interruption: Interruption, delegate: InterruptionCardDelegate) {
        self.interruption = interruption
        self.delegate = delegate
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    //-------------------------------
    //  MARK: - Superclass Overrides
    //-------------------------------
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupUI()
    }
    
    
    
    //----------------------
    //  MARK: - Private API
    //----------------------
    @objc private func handleButtonPress() {
        
        delegate.superviewShouldDismiss()
        guard let action: Closure = interruption.action else { return }
        action()
    }
    
    
    private func setupUI() {
        
        layoutParentStackView()
        layoutSendButton()
    }
    
    
    private func layoutParentStackView() {

        let topPadding: CGFloat = frame.height * 0.14
        let lateralPadding: CGFloat = frame.width * 0.08
        
        addSubview(labelsStackView)
        labelsStackView.anchor(top: topAnchor, leading: leadingAnchor,
                               bottom: nil, trailing: trailingAnchor,
                               padding: .init(top: topPadding, left: lateralPadding, bottom: 0, right: lateralPadding))
    }
    
    
    private func layoutSendButton() {
        
        addSubview(button)
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        button.widthAnchor.constraint(equalToConstant: 111).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}


