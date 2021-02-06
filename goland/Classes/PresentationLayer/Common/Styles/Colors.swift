//
//  Colors.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

extension UIColor {
    
//    static let orGrayText = UIColor(hexString: "#7B8CA1")
    static let goGrayText = UIColor(hexString: "#A3A2A2")
    static let goSlime = UIColor(hexString: "#8DE2C3")
    static let goGray = UIColor(hexString: "#E3E3E3")
    static let goBackground = UIColor(hexString: "#C4C4C4")
    static let goGrin = UIColor(hexString: "#219653")
    static let goGrayContacts = UIColor(hexString: "#7B8CA1")
    
    static let goGradient1Top = UIColor(hexString: "#16FFD5").withAlphaComponent(0.31)
    static let goGradient1Bottom = UIColor(hexString: "#42BD4E")
    static let goGradient2Top = UIColor(hexString: "#82C7B2")
    static let goGradient2Bottom = UIColor(hexString: "#0500FF")

    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        //swiftlint:disable identifier_name
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        //swiftlint:enable identifier_name
    }
}

