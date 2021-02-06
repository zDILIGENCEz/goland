//
//  RegistrationView.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class RegistrationView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let registrationViewLeadingTrailingInset: CGFloat = 38
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var reistrationView = RegistrationPartView()
    
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
        
    }
    
    private func addSubviews() {
        addSubview(reistrationView)
    }
    
    private func makeConstraints() {
        reistrationView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
                .inset(appearance.registrationViewLeadingTrailingInset)
        }
    }
    
}
