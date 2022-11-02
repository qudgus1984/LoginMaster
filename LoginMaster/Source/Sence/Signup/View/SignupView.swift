//
//  SignupView.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import Then

class SignupView: BaseView {
    
    let userNameLabel = UITextField().then {
        $0.placeholder = "이름을 입력해주세요."
    }
    
    let emailLabel = UITextField().then {
        $0.placeholder = "이메일을 입력해주세요."
    }
    
    let passwordLabel = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요."
    }
    
    
}
