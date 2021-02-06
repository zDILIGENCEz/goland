//
//  AuthorizationView.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let signInViewLeadingTrailingInset: CGFloat = 38
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var signInView = SignInView()
    
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
        //backgroundColor = .red
        
    }
    
    private func addSubviews() {
        addSubview(signInView)
    }
    
    private func makeConstraints() {
        signInView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview()
                .inset(appearance.signInViewLeadingTrailingInset)
        }
    }
    
}
