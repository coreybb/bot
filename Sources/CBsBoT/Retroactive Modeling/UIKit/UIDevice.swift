//
//  UIDevice.swift
//  
//
//  Created by Corey Beebe on 6/14/22.
//

import UIKit


///  Returns a String value for the name of a given iPhone model consistent with Apple's naming.
public enum iPhoneModel: String, Codable, CaseIterable {
   
    case iPhone13 = "iPhone 13"
    case iPhone13Mini = "iPhone 13 mini"
    case iPhone13ProMax = "iPhone 13 Pro Max"
    case iPhone13Pro = "iPhone 13 Pro"
    case iPhone12 = "iPhone 12"
    case iPhone12Mini = "iPhone 12 mini"
    case iPhone12ProMax = "iPhone 12 Pro Max"
    case iPhone12Pro = "iPhone 12 Pro"
    case iPhoneSE_2ndGen = "iPhone SE 2nd gen"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11 = "iPhone 11"
    case iPhoneXR = "iPhone XR"
    case iPhoneXSMax = "iPhone XS Max"
    case iPhoneXS = "iPhone XS"
    case iPhoneX = "iPhone X"
    case iPhone8 = "iPhone 8"
    case iPhone8Plus = "iPhone 8 Plus"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhone7 = "iPhone 7"
    case iPhoneSE_1stGen = "iPhone SE 1st gen"
    case iPhone6sPlus = "iPhone 6s Plus"
    case iPhone6s = "iPhone 6s"
    case iPhone6Plus = "iPhone 6 Plus"
    case iPhone6 = "iPhone 6"
    case iPhone5C = "iPhone 5C"
    case iPhone5S = "iPhone 5S"
    case iPhone5 = "iPhone 5"
    case iPhone4S = "iPhone 4S"
    case iPhone4 = "iPhone 4"
    case iPhone3GS = "iPhone 3GS"
    case iPhone3G = "iPhone 3G"
    case iPhone_1stGen = "iPhone 1st generation"

    
    /// Returns a CGFloat value consistent with `UIScreen.main.nativeBounds.height` for a given device.
    public var screenHeight: CGFloat {
        
        switch self {
        case .iPhone13: return 2532
        case .iPhone13Mini: return 2340
        case .iPhone13ProMax: return 2778
        case .iPhone13Pro: return 2532
        case .iPhone12: return 2532
        case .iPhone12Mini: return 2340
        case .iPhone12ProMax: return 2778
        case .iPhone12Pro: return 2532
        case .iPhoneSE_2ndGen: return 1332
        case .iPhone11ProMax: return 2688
        case .iPhone11Pro: return 2436
        case .iPhone11: return 1792
        case .iPhoneXR: return 1792
        case .iPhoneXSMax: return 2688
        case .iPhoneXS: return 2436
        case .iPhoneX: return 2436
        case .iPhone8: return 1334
        case .iPhone8Plus: return 1920
        case .iPhone7Plus: return 2208
        case .iPhone7: return 1334
        case .iPhoneSE_1stGen: return 1136
        case .iPhone6sPlus: return 2208
        case .iPhone6s: return 1334
        case .iPhone6Plus: return 2208
        case .iPhone6: return 1334
        case .iPhone5C: return 1136
        case .iPhone5S: return 1136
        case .iPhone5: return 1136
        case .iPhone4S: return 960
        case .iPhone4: return 960
        case .iPhone3GS: return 480
        case .iPhone3G:  return 480
        case .iPhone_1stGen: return 480
        }
    }
}


public extension UIDevice {
    
    
    public var currentiPhoneModel: iPhoneModel {
        iPhoneModel.allCases.first { $0.screenHeight == UIScreen.main.nativeBounds.height }!
    }

    
    public var modelName: String {

        #if targetEnvironment(simulator)
            let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
            var systemInfo = utsname()
            uname(&systemInfo)
            let machineMirror = Mirror(reflecting: systemInfo.machine)
            let identifier = machineMirror.children.reduce("") {
                (identifier, element) in
                guard let value = element.value as? Int8,
                      value != 0 else { return identifier }
                return identifier + String(UnicodeScalar(UInt8(value)))
            }
        #endif

        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPod9,1":                                 return "iPod touch (7th generation)"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4S"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5C"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5S"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone12,1":                              return "iPhone 11"
        case "iPhone12,3":                              return "iPhone 11 Pro"
        case "iPhone12,5":                              return "iPhone 11 Pro Max"
        case "iPhone12,8":                              return "iPhone SE (2nd gen)"
        case "iPhone13,1":                              return "iPhone 12 mini"
        case "iPhone13,2":                              return "iPhone 12"
        case "iPhone13,3":                              return "iPhone 12 Pro"
        case "iPhone13,4":                              return "iPhone 12 Pro Max"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
        case "iPad8,11", "iPad8,12":                    return "iPad Pro (12.9-inch) (4th generation)"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        default:                                        return identifier
        }
    }
}
