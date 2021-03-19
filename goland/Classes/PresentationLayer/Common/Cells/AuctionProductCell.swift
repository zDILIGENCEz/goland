//
//  AuctionProductCell.swift
//  goland
//
//  Created by Kusyumov Nikita on 04.03.2021.
//  Copyright © 2021 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class AuctionProductCell: UICollectionViewCell {
    
    var isCellSelected: Bool = false

    // MARK: - Internal properties

    private struct Appearance: Grid {
        let endViewCornerRadius: CGFloat = 11
        let endViewBorderWidth: CGFloat = 1
        let endViewOffsets: CGFloat = 6
        let endViewHeight: CGFloat = 22
        let auctionImageViewOffset: CGFloat = 2
        let auctionImageViewSize: CGFloat = 18
    }
    private let appearance = Appearance()

    // MARK: - UI elements

    lazy var endView: UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        view.cornerRadius = appearance.endViewCornerRadius
        view.borderWidth = appearance.endViewBorderWidth
        view.borderColor = .goMainGreen
        return view
    }()
    
    lazy var auctionImageView = UIImageView(image: Image.auctionImg())
    
    lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .regular9(.goMainGreen)
        return label
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.cornerRadius = appearance.endViewHeight
        return imageView
    }()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .bold10(.black)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var closeView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var closeStaticLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .bold10(.black)
        label.styledText = Localizable.auctionCloseLabelText()
        return label
    }()
    
    lazy var closeTimeLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .regular10(.goMainGreen)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var priceStaticLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .bold10(.black)
        label.styledText = Localizable.auctionPriceLabelText()
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .regular10(.goMainGreen)
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
        backgroundColor = .white
        cornerRadius = 20
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(endView)
        endView.addSubview(auctionImageView)
        endView.addSubview(endDateLabel)
        
        addSubview(productImageView)
        addSubview(productDescriptionLabel)
        addSubview(closeView)
        closeView.addSubview(closeStaticLabel)
        closeView.addSubview(closeTimeLabel)
        addSubview(priceStaticLabel)
        addSubview(priceLabel)
    }

    private func makeConstraints() {
        
        endView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
                .inset(appearance.endViewOffsets)
            make.height.equalTo(appearance.endViewHeight)
        }
        
        auctionImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
                .offset(appearance.auctionImageViewOffset)
            make.size.equalTo(appearance.auctionImageViewSize)
        }
        
        endDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(auctionImageView.snp.centerY)
            make.leading.equalTo(auctionImageView.snp.trailing)
                .offset(appearance.auctionImageViewOffset)
            make.trailing.equalToSuperview()
                .inset(appearance.xxxsSpace)
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(endView.snp.bottom)
                .offset(appearance.endViewOffsets)
            make.leading.trailing.equalToSuperview()
                .inset(appearance.endViewOffsets)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom)
                .offset(appearance.endViewOffsets)
            make.leading.trailing.equalToSuperview()
                .inset(appearance.endViewOffsets)
        }
        
        closeView.snp.makeConstraints { make in
            make.top.equalTo(productDescriptionLabel.snp.bottom)
                .offset(appearance.endViewOffsets)
            make.leading.trailing.equalToSuperview()
                .inset(appearance.endViewOffsets)
            make.height.equalTo(28)
        }
        
        closeStaticLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        closeTimeLabel.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.leading.greaterThanOrEqualTo(closeStaticLabel.snp.trailing)
                .offset(appearance.endViewOffsets)
            
        }
        
        priceStaticLabel.snp.makeConstraints { make in
            make.top.equalTo(closeView.snp.bottom)
                .offset(appearance.endViewOffsets)
            make.leading.equalToSuperview()
                .offset(appearance.endViewOffsets)
            make.height.equalTo(17)
            make.bottom.equalToSuperview()
                .inset(appearance.sSpace)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(priceStaticLabel.snp.top)
            make.trailing.equalToSuperview()
                .inset(appearance.endViewOffsets)
            make.leading.greaterThanOrEqualTo(priceStaticLabel.snp.trailing)
        }
        
    }

}

extension AuctionProductCell: Configurable {
    
    func configure(with slot: Slot) {
        endDateLabel.styledText = "Заканчивается через \(Int(slot.endDate.prefix(2)) ?? 0) дня"
        productImageView.image = slot.imageUrl
        productDescriptionLabel.styledText = slot.name
        closeTimeLabel.styledText = slot.endTime + "\n" + slot.endDate
        priceLabel.styledText = "XXXXXX ₽"
    }

    func redrawConstraints(with imageHeight: CGFloat, textHeight: CGFloat) {
        productImageView.snp.remakeConstraints { make in
            make.top.equalTo(endView.snp.bottom)
                .offset(appearance.endViewOffsets)
            make.leading.trailing.equalToSuperview()
                .inset(appearance.endViewOffsets)
            make.height.equalTo(imageHeight)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom)
                .offset(appearance.endViewOffsets)
            make.leading.trailing.equalToSuperview()
                .inset(appearance.endViewOffsets)
            make.height.equalTo(textHeight)
        }
        
    }
    
}
