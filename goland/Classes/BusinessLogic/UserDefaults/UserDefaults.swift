//
//  UserDefaults.swift
//  goland
//
//  Created by Kusyumov Nikita on 13.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import SwiftyUserDefaults

extension DefaultsKeys {
    
    var baseUrl: DefaultsKey<String> {
        .init("baseClientURL", defaultValue: "")
    }
    
}
