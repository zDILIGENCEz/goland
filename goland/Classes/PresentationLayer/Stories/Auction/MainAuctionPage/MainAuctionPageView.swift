//
//  MainAuctionPageView.swift
//  goland
//
//  Created by Kusyumov Nikita on 25.02.2021.
//  Copyright © 2021 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class MainAuctionPageView: UIView {
    
    // MARK: - Internal properties
    
    private struct Appearance: Grid {
        let categoryListCollectionViewCornerRadius: CGFloat = 20
        let categoryListCollectionViewHeight: CGFloat = 37
        let gradientViewWidth: CGFloat = 43
        let collectionViewCellHeight: CGFloat = 152
    }
    private let appearance = Appearance()
    
    // MARK: - UI elements
    
    lazy var categoryListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(
            top: .zero,
            left: appearance.gradientViewWidth - 20,
            bottom: .zero,
            right: appearance.gradientViewWidth - 20
        )
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(cellWithClass: AuctionCategoryCollectionCell.self)
        collectionView.cornerRadius = appearance.categoryListCollectionViewCornerRadius
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var leftGradientView = UIView()
    
    lazy var leftGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.white.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor,
        ]
        gradient.startPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        leftGradientView.layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
    
    lazy var rightGradientView = UIView()

    lazy var rightGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.white.withAlphaComponent(0).cgColor,
            UIColor.white.cgColor,
        ]
        gradient.startPoint = CGPoint(x: 0.1, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        rightGradientView.layer.insertSublayer(gradient, at: 0)
        return gradient
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(
            width: UIScreen.main.bounds.width / 2 - 1 ,
            height: appearance.collectionViewCellHeight
        )
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
        collectionView.register(cellWithClass: AuctionProductCell.self)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
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
        addSubview(categoryListCollectionView)
        addSubview(leftGradientView)
        addSubview(rightGradientView)
    }
    
    private func makeConstraints() {
        categoryListCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
                .offset(UIApplication.shared.statusBarFrame.height)
            make.leading.trailing.equalToSuperview()
                .inset(appearance.xxsSpace)
            make.height.equalTo(appearance.categoryListCollectionViewHeight)
        }
        
        leftGradientView.snp.makeConstraints { make in
            make.top.equalTo(categoryListCollectionView.snp.top)
            make.leading.equalTo(categoryListCollectionView.snp.leading)
            make.width.equalTo(appearance.gradientViewWidth)
            make.height.equalTo(categoryListCollectionView.snp.height)
            make.bottom.equalTo(categoryListCollectionView.snp.bottom)
        }

        rightGradientView.snp.makeConstraints { make in
            make.top.equalTo(categoryListCollectionView.snp.top)
            make.trailing.equalTo(categoryListCollectionView.snp.trailing)
            make.width.equalTo(appearance.gradientViewWidth)
            make.height.equalTo(categoryListCollectionView.snp.height)
            make.bottom.equalTo(categoryListCollectionView.snp.bottom)
        }
    }
    
}
