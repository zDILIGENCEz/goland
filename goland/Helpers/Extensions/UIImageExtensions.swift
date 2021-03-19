//
//  UIImageExtensions.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

extension UIImage {

    static func image(with color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorImage ?? UIImage()
    }
    
    func toString() -> String? {
        let data: Data? = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
    
    func height(with width: CGFloat, naturalSize: CGSize) -> CGFloat {
        let ratio = naturalSize.width / naturalSize.height
        let height = width / ratio
        return height
    }
    
}
