//
//  SignupView.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import Then

class SignupView: BaseView {
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
    }
    
    let userNameLabel = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = " 이름을 입력해주세요."
    }
    
    let userNameValidLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .red
    }
    
    let emailLabel = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = " 이메일을 입력해주세요."
    }
    
    let emailValidLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .red

    }
    
    let passwordLabel = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = " 비밀번호를 입력해주세요."
    }
    
    let passwordValidLabel = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = .red
    }
    
    let signupButton = UIButton().then {
        $0.backgroundColor = .systemOrange
        $0.setTitle("회원가입", for: .normal)
    }
    override func configureUI() {
        [bgView, userNameLabel, emailLabel,emailValidLabel, passwordLabel,userNameValidLabel,emailValidLabel,passwordValidLabel, signupButton].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(userNameLabel)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(userNameLabel)
        }
        
        userNameValidLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.bottom.equalTo(emailLabel.snp.top).offset(-8)
        }
        
        emailValidLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.bottom.equalTo(passwordLabel.snp.top).offset(-8)
        }
        
        passwordValidLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.bottom.equalTo(signupButton.snp.top).offset(-8)
        }
        
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(50)
            make.centerX.equalTo(bgView)
            make.width.equalTo(userNameLabel)
            make.height.equalTo(userNameLabel)
        }
    }
}
