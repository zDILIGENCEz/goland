//
//  MainAuctionPageViewController.swift
//  goland
//
//  Created by Kusyumov Nikita on 25.02.2021.
//  Copyright © 2021 n.kusyumov@mail.ru. All rights reserved.
//

import Foundation
import UIKit

class MainAuctionPageViewController: BaseViewController {
    
    // MARK: - Private properties
    
    private let mainAuctionPageView = MainAuctionPageView()
    private var mainAuctionPageViewModel = MainAuctionPageViewModel()
    
    // MARK: - Override properties
    
    override var customView: UIView {
        return mainAuctionPageView
    }
    
    override func viewDidLayoutSubviews() {
        mainAuctionPageView.leftGradient.frame = mainAuctionPageView.leftGradientView.bounds
        mainAuctionPageView.rightGradient.frame = mainAuctionPageView.rightGradientView.bounds
        mainAuctionPageView.leftGradientView.roundCorners([.topLeft, .bottomLeft], radius: 37)
        mainAuctionPageView.rightGradientView.roundCorners([.topRight, .bottomRight], radius: 37)
    }
    
    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupGradientBackground()
        setupModel()
        setupDefaultCathegoryCell()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCategoryCollectionView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Private methods
    private func setupDefaultCathegoryCell() {
        mainAuctionPageView.categoryListCollectionView.selectItem(
            at: IndexPath(row: 0, section: 0),
            animated: true,
            scrollPosition: []
        )
    }
    
    private func setupModel() {
        mainAuctionPageViewModel.categories.append(Category(id: "1", name: "Рекомендованные"))
        mainAuctionPageViewModel.categories.append(Category(id: "2", name: "Компьютеры"))
        mainAuctionPageViewModel.categories.append(Category(id: "3", name: "Часы"))
        mainAuctionPageViewModel.categories.append(Category(id: "4", name: "Планшеты"))
        mainAuctionPageViewModel.categories.append(Category(id: "5", name: "Телефоны"))
        mainAuctionPageViewModel.categories.append(Category(id: "6", name: "Современное искусство"))
    }
    
    private func setupCategoryCollectionView() {
        mainAuctionPageView.categoryListCollectionView.delegate = self
        mainAuctionPageView.categoryListCollectionView.dataSource = self
    }
    
    // MARK: - Action handlers
    
}

extension MainAuctionPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainAuctionPageViewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: AuctionCategoryCollectionCell.self, for: indexPath)
        cell.configure(with: mainAuctionPageViewModel.categories[indexPath.row].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AuctionCategoryCollectionCell else { return }
        cell.changeCellSelection()
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AuctionCategoryCollectionCell else { return }
        cell.changeCellSelection()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = mainAuctionPageViewModel.categories[indexPath.row].name
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : Fonts.montserratRegular(size: 14) as Any
        ])
        let size = CGSize(width: itemSize.width.rounded(), height: 37)
        return size
    }
    
}
