//
//  ProfileViewModel.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class ProfileViewModel {
    
    var profileList: BehaviorSubject<[User]> = BehaviorSubject(value: [])
    
    var email = BehaviorSubject(value: "")
    var name = BehaviorSubject(value: "")
    
    func getProfile() {
        APIService().profile(api: SeSACAPI.profile)
    }
    
    func showProfile(api: SeSACAPI) {
        AF.request(api.url, method: .get, headers: api.header).responseDecodable(of: Profile.self) { response in
            
            switch response.result {
            case .success(let data):
                self.email.onNext(data.user.email)
                self.name.onNext(data.user.username)

                
                print(data)
                
            case .failure(_):
                print(response.response?.statusCode)

            }
        }
    }
}
