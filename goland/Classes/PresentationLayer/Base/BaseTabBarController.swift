//
//  BaseTabBarController.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.11.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyleTabBar()
        setupTabBarItems()
    }

    func setupStyleTabBar() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .goGrin
        tabBar.barTintColor = .white
        tabBar.backgroundImage = UIImage()
    }

    func openSmsNotificationController() {
        selectedIndex = 3
    }

    func setupTabBarItems() {
        let firstViewController = UINavigationController(rootViewController: /*AuctionViewController()*/ InDevViewController())
        firstViewController.tabBarItem = UITabBarItem(
            title: Localizable.tabBarAuctionTitle(),
            image: Image.tabBar.auctionIcon(),
            tag: 0
        )

        let secondViewController = UINavigationController(rootViewController: /*AboutViewController()*/ InDevViewController())
        secondViewController.tabBarItem = UITabBarItem(
            title: Localizable.tabBarAboutTitle(),
            image: Image.tabBar.aboutIcon(),
            tag: 1
        )

        let thirdViewController = UINavigationController(rootViewController: /*ProfileViewController()*/ InDevViewController())
        thirdViewController.tabBarItem = UITabBarItem(
            title: Localizable.tabBarProfileTitle(),
            image: Image.tabBar.profileIcon(),
            tag: 2
        )

        let tabBarList = [
            firstViewController,
            secondViewController,
            thirdViewController,
        ]

        viewControllers = tabBarList
    }

}
