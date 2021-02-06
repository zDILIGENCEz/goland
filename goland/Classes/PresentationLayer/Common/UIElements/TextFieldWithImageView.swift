//
//  TextFieldWithImageView.swift
//  goland
//
//  Created by Kusyumov Nikita on 22.09.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

struct TextFieldWithImageConfigurableViewModel {
    var image: UIImage
    var placeholder: String
}

class TextFieldWithImageView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let textFieldCornerRadius: CGFloat = 5
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var imageView = UIImageView()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.bonMotStyle = .regular20(.goGrayText)
        
        return textField
    }()
    
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
        addSubviews()
        makeConstraints()
    }
    
    private func setupStyle() {
        backgroundColor = UIColor.white.withAlphaComponent(0.7)
        cornerRadius = appearance.textFieldCornerRadius
    }
    
    private func addSubviews() {
        addSubview(imageView)
        addSubview(textField)
    }
    
    private func makeConstraints() {
        imageView.snp.makeConstraints { make in
            make.size.equalTo(appearance.mSpace)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
                .offset(appearance.xsSpace)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing)
                .offset(appearance.mSpace)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
                .inset(appearance.mSpace)
        }
    }
    
}

extension TextFieldWithImageView: Configurable {
    
    func configure(with viewModel: TextFieldWithImageConfigurableViewModel) {
        imageView.image = viewModel.image
        textField.placeholder = viewModel.placeholder
    }
    
}
