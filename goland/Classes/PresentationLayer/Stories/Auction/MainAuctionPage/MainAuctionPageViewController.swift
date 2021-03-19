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
        if !mainAuctionPageViewModel.selectionApplied {
            setupDefaultCathegoryCell()
            mainAuctionPageViewModel.selectionApplied = true
        }
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
    
    private func setupSlotCollectionView() {
        
    }
    
    private func setupModel() {
        mainAuctionPageViewModel.categories.append(Category(id: "1", name: "Рекомендованные"))
        mainAuctionPageViewModel.categories.append(Category(id: "2", name: "Компьютеры"))
        mainAuctionPageViewModel.categories.append(Category(id: "3", name: "Часы"))
        mainAuctionPageViewModel.categories.append(Category(id: "4", name: "Планшеты"))
        mainAuctionPageViewModel.categories.append(Category(id: "5", name: "Телефоны"))
        mainAuctionPageViewModel.categories.append(Category(id: "6", name: "Современное искусство"))
        
        mainAuctionPageViewModel.slotInfo.append(
            Slot(
                endDate: "03.05.2020",
                endTime: "17:34:12",
                imageUrl: UIImage(resource: Image.picture_1) ?? UIImage(),
                name: "Ноутбук Prestigio SmartBook 141 C3 14.1 (1366*768) Intel Atom Z8350",
                isClosed: true
            )
        )
        mainAuctionPageViewModel.slotInfo.append(
            Slot(
                endDate: "03.05.2020",
                endTime: "17:34:12",
                imageUrl: UIImage(resource: Image.picture_4) ?? UIImage(),
                name: "Ноутбук Prestigio SmartBook 141 C3 14.1 (1366*768) Intel Atom Z8350",
                isClosed: true
            )
        )
        mainAuctionPageViewModel.slotInfo.append(
            Slot(
                endDate: "03.05.2020",
                endTime: "17:34:12",
                imageUrl: UIImage(resource: Image.picture_3) ?? UIImage(),
                name: "Ноутбук Prestigio SmartBook 141 C3 14.1 (1366*768) Intel Atom Z8350",
                isClosed: true
            )
        )
        mainAuctionPageViewModel.slotInfo.append(
            Slot(
                endDate: "03.05.2020",
                endTime: "17:34:12",
                imageUrl: UIImage(resource: Image.picture_2) ?? UIImage(),
                name: "Ноутбук Prestigio SmartBook 141 C3 14.1 (1366*768) Intel Atom Z8350",
                isClosed: true
            )
        )
        mainAuctionPageViewModel.slotInfo.append(
            Slot(
                endDate: "03.05.2020",
                endTime: "17:34:12",
                imageUrl: UIImage(resource: Image.picture_5) ?? UIImage(),
                name: "Ноутбук Prestigio SmartBook 141 C3 14.1 (1366*768) Intel Atom Z8350",
                isClosed: true
            )
        )
        mainAuctionPageViewModel.slotInfo.append(
            Slot(
                endDate: "03.05.2020",
                endTime: "17:34:12",
                imageUrl: UIImage(resource: Image.picture_6) ?? UIImage(),
                name: "Ноутбук Prestigio SmartBook 141 C3 14.1 (1366*768) Intel Atom Z8350",
                isClosed: true
            )
        )
    }
    
    private func setupCategoryCollectionView() {
        mainAuctionPageView.categoryListCollectionView.delegate = self
        mainAuctionPageView.categoryListCollectionView.dataSource = self
        mainAuctionPageView.slotCollectionView.delegate = self
        mainAuctionPageView.slotCollectionView.dataSource = self
        if let layout = mainAuctionPageView.slotCollectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    // MARK: - Action handlers
    
}

extension MainAuctionPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        switch collectionView {
        case self.mainAuctionPageView.categoryListCollectionView: return mainAuctionPageViewModel.categories.count
        case self.mainAuctionPageView.slotCollectionView: return mainAuctionPageViewModel.slotInfo.count
        default:
            return 0
        }
//        guard let _ = collectionView as? AuctionCategoryCollectionCell else {
//            return mainAuctionPageViewModel.slotInfo.count
//        }
//        return mainAuctionPageViewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.mainAuctionPageView.categoryListCollectionView:
            let cell = collectionView.dequeueReusableCell(withClass: AuctionCategoryCollectionCell.self, for: indexPath)
            cell.configure(with: mainAuctionPageViewModel.categories[indexPath.row].name)
            return cell
        case self.mainAuctionPageView.slotCollectionView:
            let cell = collectionView.dequeueReusableCell(withClass: AuctionProductCell.self, for: indexPath)
            cell.configure(with: mainAuctionPageViewModel.slotInfo[indexPath.row])
            cell.redrawConstraints(
                with: mainAuctionPageViewModel.slotInfo[indexPath.row].imageUrl.height(with: collectionView.frame.size.width / 2, naturalSize: mainAuctionPageViewModel.slotInfo[indexPath.row].imageUrl.size),
                textHeight: mainAuctionPageViewModel.slotInfo[indexPath.row].name.height(withConstrainedWidth: (collectionView.frame.size.width / 2) - 21, font: Fonts.sansationBold(size: 11) ?? UIFont()))
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AuctionCategoryCollectionCell else { return }
        cell.changeCellSelection()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case self.mainAuctionPageView.categoryListCollectionView:
            let item = mainAuctionPageViewModel.categories[indexPath.row].name
            let itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : Fonts.montserratRegular(size: 14) as Any
            ])
            let size = CGSize(width: itemSize.width.rounded(), height: 37)
            return size
        case self.mainAuctionPageView.slotCollectionView:
            let slot = mainAuctionPageViewModel.slotInfo[indexPath.row]
            let numberOfColumns: CGFloat = 2
            let width = collectionView.frame.size.width
            let cellSpacing: CGFloat = 6
            let imageHeight = slot.imageUrl.height(with: width / 2, naturalSize: slot.imageUrl.size)
            let constantHeight: CGFloat = 113
            let textHeight: CGFloat = slot.name.height(withConstrainedWidth: (width / 2) - 21, font: Fonts.sansationBold(size: 10) ?? UIFont())
            return CGSize(
                width: (width / numberOfColumns) - cellSpacing,
                height: imageHeight + constantHeight + textHeight
            )
            //return CGSize(width: UIScreen.main.bounds.width / 2 - 1, height: 256)
        default:
            return CGSize()
        }
        
    }
    
}

extension MainAuctionPageViewController: PinterestLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let slot = mainAuctionPageViewModel.slotInfo[indexPath.row]
        let width = collectionView.frame.size.width
        let imageHeight = slot.imageUrl.height(with: width / 2, naturalSize: slot.imageUrl.size)
        let constantHeight: CGFloat = 113
        let textHeight: CGFloat = slot.name.height(withConstrainedWidth: (width / 2) - 21, font: Fonts.sansationBold(size: 10) ?? UIFont())
        return imageHeight + constantHeight + textHeight
    }
    
}
