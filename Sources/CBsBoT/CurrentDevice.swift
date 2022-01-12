//
//  currentDevicep.swift
//  
//
//  Created by Corey Beebe on 1/9/22.
//


import UIKit


let currentDevice: ScreenSize = {
    
    if UIDevice().userInterfaceIdiom == .phone {
        
        switch UIScreen.main.nativeBounds.height {
            
        case 1136: return .iPhone4
        case 1334:  return .iPhone4_7
        case 1920, 2208: return .iPhone5_5
        case 2436: return .iPhoneX5_8
        case 2532: return .iPhone12Pro6_1
        case 2688: return .iPhoneX6_5
        case 1792: return .iPhoneX6_1
        case 2778: return .iPhone12ProMax6_7
        default:
            print("The current iPhone is unknown. It has a native bounds height of \(UIScreen.main.nativeBounds.height).")
            return ScreenSize.iPhone5_5
        }
        
    } else {
        
        switch UIScreen.main.nativeBounds.height {
            
        case 2048: return ScreenSize.iPad7_9Or9_7
        case 2224: return ScreenSize.iPad10_5
        case 2732: return ScreenSize.iPad12_9
        default:
            print("The current iPad is unknown. It has a native bounds height of \(UIScreen.main.nativeBounds.height).")
            return ScreenSize.iPad7_9Or9_7
        }
    }
}()
