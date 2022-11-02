//
//  LoginView.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import Then

class LoginView: BaseView {
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
    }
        
    let emailLabel = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = " 이메일을 입력해주세요."
    }
    
    let passwordLabel = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = " 비밀번호를 입력해주세요."
    }
    
    let signupButton = UIButton().then {
        $0.backgroundColor = .systemOrange
        $0.setTitle("로그인", for: .normal)
    }
    override func configureUI() {
        [bgView, emailLabel, passwordLabel, signupButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(emailLabel)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(50)
            make.centerX.equalTo(bgView)
            make.width.equalTo(emailLabel)
            make.height.equalTo(emailLabel)
        }
    }
}
