//
//  AboutLayerView.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.11.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class AboutLayerView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let triangleViewHeight: CGFloat = 50
        let logoImageViewSize: CGFloat = 80
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var emptyView = UIView()
    
    lazy var triangleView = TriangleView()
    
    lazy var squareView = UIView()
    
    lazy var tableBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    lazy var logoImageView = UIImageView(image: Image.logo())
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.estimatedRowHeight = appearance.xxlSpace
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellWithClass: AboutCell.self)
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .white
        return tableView
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
        setupStyle()
        addSubviews()
        makeConstraints()
    }
    
    private func setupStyle() {
        
    }
    
    private func addSubviews() {
        addSubview(emptyView)
        emptyView.addSubview(triangleView)
        emptyView.addSubview(squareView)
        emptyView.addSubview(logoImageView)
        addSubview(tableBackgroundView)
        tableBackgroundView.addSubview(tableView)
    }
    
    private func makeConstraints() {
        emptyView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
        }
        
        triangleView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(appearance.triangleViewHeight)
        }
        
        squareView.snp.makeConstraints { make in
            make.top.equalTo(triangleView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(appearance.triangleViewHeight)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(appearance.logoImageViewSize)
        }
        
        tableBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(emptyView.snp.bottom)
                .offset(appearance.xxsSpace)
            make.leading.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
                .inset(appearance.xsSpace)
            make.leading.trailing.equalToSuperview()
            
        }
    }
    
}
