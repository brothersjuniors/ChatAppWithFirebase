//
//  UIColor.swift
//  ChatApp WithFirebase
//
//  Created by 近江伸一 on 2022/05/19.
//

import Foundation
import UIKit
extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)-> UIColor{
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
        
        
    }
    
}
