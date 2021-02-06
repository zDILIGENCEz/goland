//
//  BaseTargetType.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Moya
import SwiftyUserDefaults

protocol BaseTargetType: TargetType { }

extension BaseTargetType {

    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
        ]
    }
    
    var baseURL: URL {
        guard let url = URL(string: Defaults[\.baseUrl]) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var sampleData: Data {
        return Data()
    }

}
