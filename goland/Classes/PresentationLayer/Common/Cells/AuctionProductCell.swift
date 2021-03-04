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
    
    lazy var productImageView = UIImageView()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .bold10(.black)
        return label
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
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(endView)
        endView.addSubview(auctionImageView)
        endView.addSubview(endDateLabel)
        
        addSubview(productImageView)
        addSubview(productDescriptionLabel)
        addSubview(closeStaticLabel)
        addSubview(closeTimeLabel)
        addSubview(priceStaticLabel)
        addSubview(priceLabel)
    }

    private func makeConstraints() {
        // TODO: create constraints for this cell
    }

}

extension AuctionProductCell: Configurable {
    
    func configure(with text: String) {
        
    }

}
