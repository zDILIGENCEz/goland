//
//  BaseViewController.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit
import SwifterSwift

class BaseViewController: UIViewController {
    
    // MARK: - Internal properties
    
    private let baseView = BaseView()

    // MARK: - UI elements
    
    var customView: UIView {
        return UIView()
    }
    
    var prefersNavigationBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(prefersNavigationBarHidden, animated: animated)
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationItem(for: super.navigationItem)
    }
    
    override func loadView() {
        view = baseView
        view.backgroundColor = .goBackground
        baseView.makeDefaultConstraints(in: self)
        baseView.contentView.addSubview(customView)
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupGradientBackground() {
        let colorTop = UIColor.goGradient1Top.cgColor
        let colorBottom = UIColor.goGradient1Bottom.cgColor
        
        let gradientLayer = CAGradientLayer()

        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = view.bounds

        view.layer.insertSublayer(gradientLayer, at: 0)
        setupGradientBackground2()
    }
    
    private func setupGradientBackground2() {
        let colorTop = UIColor.goGradient2Top.cgColor
        let colorBottom = UIColor.goGradient2Bottom.cgColor
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds

        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc
    func dismissScreen() {
        dismiss(animated: true)
    }
    
    @objc
    func popViewControllerWithAnimate() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension BaseViewController {
    
    func configureNavigationItem(for navigationItem: UINavigationItem) {
        setupStyle()
    }
    
    func setupStyle() {
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.makeTransparent()
//        navigationController?.navigationBar.barTintColor = .white
//        navigationController?.navigationBar.shadowImage = UIImage.image(with: .white, size: CGSize(width: 1, height: 1))
    }
    
    func setupBlackNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
    }
    
}
