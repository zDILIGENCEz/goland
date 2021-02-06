//
//  AboutCell.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.11.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell {

    // MARK: - Internal properties

    private struct Appearance: Grid { }
    private let appearance = Appearance()

    // MARK: - UI elements

    lazy var imageIconView = UIImageView()
    
    lazy var contactText: UILabel = {
        let label = UILabel()
        label.bonMotStyle = .medium14(.goGrayContacts)
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        addSubview(imageIconView)
        addSubview(contactText)
    }

    private func makeConstraints() {
        imageIconView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
                .offset(appearance.xsSpace)
            make.centerY.equalToSuperview()
            make.size.equalTo(appearance.mSpace)
        }
        
        contactText.snp.makeConstraints { make in
            make.leading.equalTo(imageIconView.snp.trailing)
                .offset(appearance.xsSpace)
            make.trailing.equalToSuperview()
                .inset(appearance.xsSpace)
            make.centerY.equalToSuperview()
        }
    }

}
