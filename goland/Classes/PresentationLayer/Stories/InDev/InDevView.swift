//
//  InDevView.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class InDevView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid { }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var inDevLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = . regular20(.white)
        label.bonMotStyle?.alignment = .center
        label.styledText = Localizable.commonInDev()
        label.numberOfLines = 0
        return label
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
        addSubview(inDevLabel)
    }
    
    private func makeConstraints() {
        inDevLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
                .inset(appearance.xsSpace)
        }
    }
    
}
