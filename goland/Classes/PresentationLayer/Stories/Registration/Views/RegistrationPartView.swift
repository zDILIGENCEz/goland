//
//  RegistrationPartView.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class RegistrationPartView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let backgroundViewCornerRadius: CGFloat = 15
        let personViewCornerRadius: CGFloat = 35
        let personViewSize: CGFloat = 70
        let textFieldViewHeight: CGFloat = 54
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .regular30(.goGray)
        label.bonMotStyle?.alignment = .center
        label.styledText = Localizable.signInRegistrationText()
        return label
    }()
    
    lazy var personView: UIView = {
        let view = UIView()
        view.cornerRadius = appearance.personViewCornerRadius
        view.backgroundColor = UIColor.goSlime.withAlphaComponent(0.8)
        return view
    }()
    
    lazy var personImageView = UIImageView(image: Image.signInLogo())
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.cornerRadius = appearance.backgroundViewCornerRadius
        view.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        return view
    }()
    
    lazy var loginTextView: TextFieldWithImageView = {
        let textView = TextFieldWithImageView()
        textView.configure(with: TextFieldWithImageConfigurableViewModel(
            image: Image.person() ?? UIImage(),
            placeholder: Localizable.signInLoginPlaceholder()
        ))
        return textView
    }()
    
    lazy var passwordTextView: TextFieldWithImageView = {
        let textView = TextFieldWithImageView()
        textView.configure(with: TextFieldWithImageConfigurableViewModel(
            image: Image.password() ?? UIImage(),
            placeholder: Localizable.signInPasswordPlaceholder()
        ))
        return textView
    }()
    
    lazy var repeatPasswordTextView: TextFieldWithImageView = {
        let textView = TextFieldWithImageView()
        textView.configure(with: TextFieldWithImageConfigurableViewModel(
            image: Image.password() ?? UIImage(),
            placeholder: Localizable.signInRepeatPasswordPlaceholder()
        ))
        return textView
    }()
    
    lazy var registrationButton: CommonAuthorizationButton = {
        let button = CommonAuthorizationButton()
        button.configure(with: Localizable.signInRegistrButtonText())
        return button
    }()
    
    lazy var singInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = nil
        button.bonMotStyle = .regular14(.white)
        button.styledText = Localizable.signInAuthorisationText()
        return button
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = nil
        button.bonMotStyle = .regular14(.white)
        button.styledText = Localizable.signInForgotPasswordText()
        return button
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
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(registrationLabel)
        addSubview(backgroundView)
        backgroundView.addSubview(loginTextView)
        backgroundView.addSubview(passwordTextView)
        backgroundView.addSubview(repeatPasswordTextView)
        backgroundView.addSubview(registrationButton)
        //backgroundView.addSubview(singInButton)
        backgroundView.addSubview(forgotPasswordButton)
        
        addSubview(personView)
        personView.addSubview(personImageView)
    }
    
    private func makeConstraints() {
        registrationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
                .inset(appearance.sSpace)
        }
        
        personView.snp.makeConstraints { make in
            make.size.equalTo(appearance.personViewSize)
            make.top.equalTo(registrationLabel.snp.bottom)
                .offset(appearance.xsSpace)
            make.centerX.equalToSuperview()
        }
        
        personImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
                .inset(appearance.sSpace)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(personView.snp.centerY)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        loginTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
            make.height.equalTo(appearance.textFieldViewHeight)
            make.top.equalTo(personView.snp.bottom)
                .offset(appearance.mSpace)
        }
        
        passwordTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
            make.height.equalTo(appearance.textFieldViewHeight)
            make.top.equalTo(loginTextView.snp.bottom)
                .offset(appearance.mSpace)
        }
        
        repeatPasswordTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
            make.height.equalTo(appearance.textFieldViewHeight)
            make.top.equalTo(passwordTextView.snp.bottom)
                .offset(appearance.mSpace)
        }
        
        registrationButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
            make.height.equalTo(appearance.textFieldViewHeight)
            make.top.equalTo(repeatPasswordTextView.snp.bottom)
                .offset(appearance.mSpace)
        }
        
//        singInButton.snp.makeConstraints { make in
//            make.top.equalTo(registrationButton.snp.bottom)
//                .offset(appearance.xxsSpace)
//            make.bottom.equalToSuperview()
//                .inset(appearance.xxsSpace)
//            make.leading.equalToSuperview()
//                .offset(appearance.xxsSpace)
//            make.trailing.lessThanOrEqualTo(forgotPasswordButton.snp.leading)
//                .inset(appearance.xxsSpace)
//        }
        
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(registrationButton.snp.bottom)
                .offset(appearance.xxsSpace)
            make.bottom.equalToSuperview()
                .inset(appearance.xxsSpace)
            make.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
        }
    }
    
}
