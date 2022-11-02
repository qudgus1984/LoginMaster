//
//  NetworkError.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case serverError
    case networkFail
}
