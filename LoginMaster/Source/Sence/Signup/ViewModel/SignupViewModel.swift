//
//  SignupViewModel.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import Foundation
import RxCocoa
import RxSwift

final class SignupViewModel {
    let validName = BehaviorRelay(value: "이름은 2자 이상, 8자 이하로 입력해주세요!")
    
    let validEmail = BehaviorRelay(value: "이메일은 5자 이상 입력해주세요!!")
    
    let validPassword = BehaviorRelay(value: "비밀번호는 2자 이상, 10자 이하입니다!!")
    
    func postSignup(name: String, email: String, password: String) {
        APIService().signup(api: SeSACAPI.signup(userName: name, email: email, password: password))
    }
}

