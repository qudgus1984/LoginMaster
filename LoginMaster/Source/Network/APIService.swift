//
//  APIService.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import Foundation
import Alamofire

struct Login: Codable {
    let token: String
}

struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

class APIService {
    func signup(api: SeSACAPI) {
        
        AF.request(api.url, method: .post, parameters: api.parameter, headers: api.header).responseString { response in
            
            print(response)
            print(response.response?.statusCode)
        }
        
    }
    
    func login(api: SeSACAPI) {
       
        AF.request(api.url, method: .post, parameters: api.parameter, headers: api.header).validate(statusCode: 200...299).responseDecodable(of: Login.self) { response in
            switch response.result {
            case .success(let data):
                print(data.token)
                UserDefaults.standard.set(data.token, forKey: "token")
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
    
    func profile() {
        let api = SeSACAPI.profile
        AF.request(api.url, method: .get, headers: api.header).responseDecodable(of: Profile.self) { response in
            
            switch response.result {
            case .success(let data):
                print(data)
                
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
}
