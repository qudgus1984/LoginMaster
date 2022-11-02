//
//  MainView.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import Then

class ProfileView: BaseView {
    
    let bgView = UIView().then {
        $0.backgroundColor = .black
    }
    
    let emailLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.textColor = .systemOrange

    }
    
    let userNameLabel = UILabel().then {
        $0.backgroundColor = .white
        $0.textAlignment = .center
        $0.textColor = .systemOrange
    }
    
    let profileLabel = UILabel().then {
        $0.textAlignment = .center
        $0.text = "프로필 화면"
        $0.textColor = .systemOrange
        $0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    }
    
    override func configureUI() {
        [bgView, profileLabel, emailLabel, userNameLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setConstraints() {
        
        bgView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(profileLabel)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(profileLabel)
        }
    }
}
