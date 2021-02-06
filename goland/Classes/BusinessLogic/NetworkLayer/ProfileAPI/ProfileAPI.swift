//
//  ProfileAPI.swift
//  goland
//
//  Created by Kusyumov Nikita on 06.10.2020.
//  Copyright © 2020 n.kusyumov@mail.ru. All rights reserved.
//

//import Moya
//import RxCocoa
//import RxSwift
//import SwiftyUserDefaults
//
//enum TokenAPI {
//    case signIn(email: String, password: String)
//    case signUp()
//}
//
//extension TokenAPI: BaseTargetType {
//
//    var path: String {
//        switch self {
//        case .authorizeClient:
//            return "/auth/login"
//        case .refreshToken:
//            return "/auth/token"
//        }
//    }
//
//    var method: Moya.Method {
//        switch self {
//        case .authorizeClient, .refreshToken:
//            return .post
//        }
//    }
//
//    var task: Task {
//        switch self {
//        case let .authorizeClient(info):
//            return .requestParameters(
//                parameters: [
//                    "email": info.email,
//                    "password": info.password,
//                ],
//                encoding: parameterEncoding
//            )
//        case let .refreshToken(refreshToken):
//            return .requestParameters(
//                parameters: [
//                    "refreshToken": refreshToken,
//                ],
//                encoding: parameterEncoding
//            )
//        }
//    }
//
//}
