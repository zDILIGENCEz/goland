//
//  AboutView.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.11.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class AboutView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid { }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var aboutView = AboutLayerView()
    
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
        
    }
    
    private func makeConstraints() {
        
    }
    
}
