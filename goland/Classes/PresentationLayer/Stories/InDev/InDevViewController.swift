//
//  InDevViewController.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class InDevViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let inDevView = InDevView()
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return inDevView
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupGradientBackground()
        setNeedsStatusBarAppearanceUpdate()
    }
    
}
