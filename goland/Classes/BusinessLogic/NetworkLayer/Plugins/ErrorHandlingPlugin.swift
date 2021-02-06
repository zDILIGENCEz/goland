//
//  ErrorHandlingPlugin.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

import Moya
import Result

struct ErrorHandlingPlugin: PluginType {
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        if let response = result.value {
            if response.statusCode > 399 {
                Message.shared.showMessage(with: "Oooops error...", type: .error)
            }
        } else if let error = result.error {
            Message.shared.showMessage(with: error.localizedDescription, type: .error)
        } else {
            Message.shared.showMessage(with: "Oooops error...", type: .error)
        }
    }
}
