//
//  BaseScrollController.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import RxCocoa
import RxSwift
import ScrollViewController
import SnapKit
import SwifterSwift
import UIKit

class BaseScrollViewController: UIViewController {

    var disposeBag = DisposeBag()

    var customView: UIView {
        return UIView()
    }

    var prefersNavigationBarHidden: Bool {
        return false
    }

    private func embed(_ viewController: UIViewController) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewController.didMove(toParent: self)
    }

    let scrollViewController = ScrollViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseStyle()
        setupScrollViewController()
        hideKeyboardWhenTappedAround()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(prefersNavigationBarHidden, animated: animated)
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }

    private func setupBaseStyle() {
        view.backgroundColor = .white
        customView.backgroundColor = .white
    }

    func turnOnLargeTitle() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func turnOffLargeTitle() {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupScrollViewController() {
        embed(scrollViewController)
        scrollViewController.scrollView.alwaysBounceVertical = true
        scrollViewController.contentView = customView
    }

    func disableScroll() {
        scrollViewController.scrollView.isScrollEnabled = false
    }

    func hideVerticalScrollIndicator() {
        scrollViewController.scrollView.showsVerticalScrollIndicator = false
    }

    func makeStatusBar(with status: UIStatusBarStyle) {
        UIApplication.shared.statusBarStyle = status
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(false)
    }

}

extension BaseScrollViewController {

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard(_:))
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc
    func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        if let navigationController = self.navigationController {
            navigationController.view.endEditing(true)
        }
    }

    @objc
    func showMessageFeatureInDev() {
        Message.shared.showMessage(with: Localizable.commonInDev(), type: .simple)
    }

    @objc
    func popViewControllerWithAnimate() {
        navigationController?.popViewController(animated: true)
    }

    @objc
    func dismissScreen() {
        dismiss(animated: true)
    }

    func configureNavigationItem(for navigationItem: UINavigationItem) {
        setupStyle()
    }

    func hideScrollIndicator() {
        scrollViewController.scrollView.showsVerticalScrollIndicator = false
    }

    func setupStyle() {
        let textAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage.image(with: .white, size: CGSize(width: 1, height: 1))
        //navigationController?.navigationBar.tintColor = .orBurntSienna
    }
    
    func setupBlackNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
    }
}
