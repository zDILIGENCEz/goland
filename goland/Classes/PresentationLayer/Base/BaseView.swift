//
//  BaseView.swift
//  goland
//
//  Created by Kusyumov Nikita on 27.08.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import UIKit
import SnapKit

typealias Localizable = R.string.localizable
typealias Fonts = R.font
typealias Image = R.image

class BaseView: UIView {
    
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeDefaultConstraints(in viewController: UIViewController) {
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
//            make.top.equalTo(viewController.topLayoutGuide.snp.bottom)
//            make.bottom.equalTo(viewController.bottomLayoutGuide.snp.top)
//            make.leading.trailing.equalToSuperview()
        }
    }
    
}
