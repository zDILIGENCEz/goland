//
//  AuthorizationViewController.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let authorizationView = AuthorizationView()
//    private let <#name#>ViewModel = <#Name#>ViewModel()
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return authorizationView
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupGradientBackground()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }
    
    // MARK: - Private methods
    
    private func setupTargets() {
        authorizationView.signInView.signInButton
            .addTarget(self, action: #selector(signInButtonDidTap), for: .touchUpInside)
        authorizationView.signInView.registrationButton
            .addTarget(self, action: #selector(registrationButtonDidTap), for: .touchUpInside)
        authorizationView.signInView.forgotPasswordButton
            .addTarget(self, action: #selector(forgotPasswordDidTap), for: .touchUpInside)
    }
    
    
    
    // MARK: - Action handlers
    
    @objc
    private func signInButtonDidTap(_ sender: UIButton) {
        RootRouter().setRootViewController(controller: BaseTabBarController(), animatedWithOptions: nil)
    }
    
    @objc
    private func registrationButtonDidTap(_ sender: UIButton) {
        let controller = RegistrationViewController()
        show(controller, sender: self)
    }
    
    @objc
    private func forgotPasswordDidTap(_ sender: UIButton) {
        let controller = InDevViewController()
        show(controller, sender: self)
    }
    
}
