//
//  SignupViewModel.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire


final class SignupViewModel {
    let validName = BehaviorRelay(value: "이름은 2자 이상, 8자 이하로 입력해주세요!")
    
    let validEmail = BehaviorRelay(value: "이메일은 5자 이상 입력해주세요!!")
    
    let validPassword = BehaviorRelay(value: "비밀번호는 2자 이상, 10자 이하입니다!!")
    var isSucceed = BehaviorSubject<Bool>(value: false)

    func postSignup(name: String, email: String, password: String) {
        APIService().signup(api: SeSACAPI.signup(userName: name, email: email, password: password))
    }
    
    func requestSignup(name: String, email: String, password: String) {
        let api = SeSACAPI.signup(userName: name, email: email, password: password)
        
        
        AF.request(api.url, method: .post, parameters: api.parameter, headers: api.header).responseString { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {

            case .success(_):
                guard let statusCode = response.response?.statusCode else { return }
                
                switch statusCode {
                case 200..<300:
                    self.isSucceed.onNext(true)
                case 400..<500:
                    self.isSucceed.onError(NetworkError.badRequest)
                case 500..<600:
                    self.isSucceed.onError(NetworkError.serverError)
                default:
                    self.isSucceed.onError(NetworkError.networkFail)
                }
            case .failure:
                print("error")
            }
            print(response)
            print(response.response?.statusCode)
        }

    }
}

