//
//  AuctionCategoryCollectionCell.swift
//  goland
//
//  Created by Kusyumov Nikita on 25.02.2021.
//  Copyright © 2021 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class AuctionCategoryCollectionCell: UICollectionViewCell {
    
    var isCellSelected: Bool = false

    // MARK: - Internal properties

    private struct Appearance: Grid {
        let lineViewHeight: CGFloat = 2
    }
    private let appearance = Appearance()

    // MARK: - UI elements

    lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .regular14(.black)
        label.bonMotStyle?.alignment = .center
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .goMainGreen
        view.isHidden = true
        return view
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
        addSubview(categoryNameLabel)
        addSubview(lineView)
    }

    private func makeConstraints() {
        categoryNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
                .offset(appearance.xsSpace)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(lineView.snp.top)
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(appearance.lineViewHeight)
            make.bottom.equalToSuperview()
                .inset(appearance.xxsSpace)
        }
    }

}

extension AuctionCategoryCollectionCell: Configurable {
    
    func configure(with text: String) {
        categoryNameLabel.styledText = text
        changeCellSelection()
    }
    
    func changeCellSelection(with isCellSelected: Bool) {
        categoryNameLabel.bonMotStyle = .regular14(isCellSelected ? .goMainGreen : .black)
        categoryNameLabel.bonMotStyle?.alignment = .center
        lineView.isHidden = !isCellSelected
    }
    
    func changeCellSelection() {
        categoryNameLabel.bonMotStyle = .regular14(isSelected ? .goMainGreen : .black)
        categoryNameLabel.bonMotStyle?.alignment = .center
        lineView.isHidden = !isSelected
    }
    
}
