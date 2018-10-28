//
//  Randomizable.swift
//  Randomizable
//
//  Created by Keegan Rush on 2017/09/29.
//  Copyright © 2017 thecodedself. All rights reserved.
//

import Foundation

public protocol Randomizable {
    associatedtype RandomElement
    static var random: RandomElement { get }
}

extension Int: Randomizable {
    public static var random: Int {
        return .random(in: .min ... .max)
    }
}

extension String: Randomizable {
    public static var random: String {
        return "\(Int.random)"
    }
}

extension UIImage: Randomizable {
    public static var random: UIImage {
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
    public static var random: UIColor {
        return UIColor(
            red: .random(in: 0.0 ... 1.0),
            green: .random(in: 0.0 ... 1.0),
            blue: .random(in: 0.0 ... 1.0),
            alpha: 1)
    }
}
