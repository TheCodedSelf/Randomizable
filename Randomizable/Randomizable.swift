//
//  Randomizable.swift
//  Randomizable
//
//  Created by Keegan Rush on 2017/09/29.
//  Copyright © 2017 thecodedself. All rights reserved.
//

import Foundation

protocol Randomizable {
    associatedtype RandomElement
    static var random: RandomElement { get }
}

extension Int: Randomizable {
    static var random: Int {
        return Int(arc4random_uniform(10000))
    }
}

extension String: Randomizable {
    static var random: String {
        return "\(Int.random)"
    }
}

extension UIImage: Randomizable {
    static var random: UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(UIColor.random.cgColor)
        context.fill(rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}

extension UIColor: Randomizable {
    static var random: UIColor {
        return UIColor(
            red: CGFloat(arc4random_uniform(100)) / 100,
            green: CGFloat(arc4random_uniform(100)) / 100,
            blue: CGFloat(arc4random_uniform(100)) / 100,
            alpha: 1)
    }
}
