//
//  LoginViewModel.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import Foundation
import RxCocoa
import RxSwift

class LoginViewModel: CommonViewModel {
    var loginEmail = BehaviorRelay<String>(value: "")
    var loginPassword = BehaviorRelay<String>(value: "")
    
    var isValidLogin: Observable<Bool> {
        return Observable
            .combineLatest(loginEmail, loginPassword)
            .map { loginEmail, loginPassword in
                return loginEmail.count > 5 && loginPassword.count >= 2 && loginPassword.count <= 10
            }
    }
    
    func postLogin(email: String, password: String) {
        APIService().login(api: SeSACAPI.login(email: email, password: password))
    }
    /*
    struct Input {
        let emailText: ControlProperty<String?>
        let pwText: ControlProperty<String?>
    }
    
    struct Output {
        let emailText: Driver<String>
        let pwText: Driver<String>
    }
    func transform(input: Input) -> Output {
        let emailText = loginEmail.asDriver()
        let pwText = loginPassword.asDriver()
        return Output(emailText: emailText, pwText: pwText)
    }
     */
}
