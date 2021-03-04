//
//  TextStyles.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import BonMot
import UIKit

extension StringStyle {

    static func regular30(_ color: UIColor) -> StringStyle {
        var style = StringStyle()
        let font = Fonts.sansationRegular(size: 30)
        style.font = font
        style.color = color
        return style
    }

    static func regular20(_ color: UIColor) -> StringStyle {
        var style = StringStyle()
        let font = Fonts.sansationRegular(size: 20)
        style.font = font
        style.color = color
        return style
    }
    
    static func regular14(_ color: UIColor) -> StringStyle {
        var style = StringStyle()
        let font = Fonts.sansationRegular(size: 14)
        style.font = font
        style.color = color
        return style
    }
    
    static func medium14(_ color: UIColor?) -> StringStyle {
        var style = StringStyle()
        let font = Fonts.montserratMedium(size: 14)
        style.font = font
        style.color = color
        return style
    }
    
    static func regular10(_ color: UIColor) -> StringStyle {
        var style = StringStyle()
        let font = Fonts.sansationRegular(size: 10)
        style.font = font
        style.color = color
        return style
    }
    
    static func regular9(_ color: UIColor) -> StringStyle {
        var style = StringStyle()
        let font = Fonts.sansationRegular(size: 9)
        style.font = font
        style.color = color
        return style
    }
    
    static func bold10(_ color: UIColor) -> StringStyle {
        var style = StringStyle()
        let font = Fonts.sansationBold(size: 10)
        style.font = font
        style.color = color
        return style
    }

    private static func lineHeightMultiple(spacing: CGFloat, font: UIFont) -> CGFloat {
        return spacing / font.lineHeight
    }

}

