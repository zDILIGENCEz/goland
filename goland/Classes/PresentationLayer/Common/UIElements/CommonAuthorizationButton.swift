//
//  CommonAuthorizationButton.swift
//  goland
//
//  Created by Kusyumov Nikita on 22.09.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class CommonAuthorizationButton: UIButton {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let buttonCornerRadius: CGFloat = 5
    }
    private let appearance = Appearance()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setupStyle()
    }
    
    private func setupStyle() {
        cornerRadius = appearance.buttonCornerRadius
        backgroundColor = .goSlime
        bonMotStyle = .regular20(.white)
    }
    
}

extension CommonAuthorizationButton: Configurable {
    
    func configure(with text: String) {
        self.styledText = text
    }
    
}
