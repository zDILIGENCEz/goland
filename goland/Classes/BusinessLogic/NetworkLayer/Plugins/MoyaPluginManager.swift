//
//  MoyaPluginManager.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Moya

class MoyaPluginManager {
    
    static let shared = MoyaPluginManager()
    
    let loggerPlugin = NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { (target, array) in
        if let log = array.first {
            print(log)
        }
    }, logOptions: .formatRequestAscURL))
    let errorHandlingPlugin = ErrorHandlingPlugin()
    let activityPlugin = NetworkActivityPlugin { activityType, _ in
        switch activityType {
        case .began:
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
            }
            
        case .ended:
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }

    var plugins: [PluginType] {
        get {
            return [
                loggerPlugin,
                activityPlugin,
                errorHandlingPlugin,
            ]
        }
    }
}
