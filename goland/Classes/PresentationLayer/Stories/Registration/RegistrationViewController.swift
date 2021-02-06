//
//  RegistrationViewController.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let registrationView = RegistrationView()
//    private let registrationViewModel = RegistrationViewModel()
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return registrationView
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupGradientBackground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }
    
    // MARK: - Private methods
    
    private func setupTargets() {
        registrationView.reistrationView.registrationButton
            .addTarget(self, action: #selector(registrationButtonDidTapped), for: .touchUpInside)
        registrationView.reistrationView.forgotPasswordButton
            .addTarget(self, action: #selector(forgotPasswordButtonDidTapped), for: .touchUpInside)
    }
    
    // MARK: - Action handlers
    
    @objc
    private func registrationButtonDidTapped(_ sender: UIButton) {
        RootRouter().setRootViewController(controller: BaseTabBarController(), animatedWithOptions: nil)
    }
    
    @objc
    private func forgotPasswordButtonDidTapped(_ sender: UIButton) {
        let controller = InDevViewController()
        show(controller, sender: self)
    }

}
