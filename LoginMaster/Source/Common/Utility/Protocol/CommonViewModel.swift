//
//  CommonViewModel.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import Foundation

protocol CommonViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
