//
//  SignupViewController.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import RxCocoa
import RxSwift

class SignupViewController: BaseViewController {
    
    let mainview = SignupView()
    let viewModel = SignupViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindValidName()
        bindValidEmail()
        bindValidPassword()
        signupButtonbind()
    }
    
    override func loadView() {
        super.view = mainview
    }
    
    func bindValidName() {
        
        //MARK: - 이름에 대한 Validation Check
        viewModel.validName
            .asDriver()
            .drive(mainview.userNameValidLabel.rx.text)
            .disposed(by: disposeBag)
        
        let validationName = mainview.userNameLabel.rx.text
            .orEmpty
            .map { $0.count < 2 || $0.count > 8 }
        
        let validationNameFalse = mainview.userNameLabel.rx.text
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 8 }
        
        validationName.bind(to: mainview.signupButton.rx.isEnabled, mainview.emailLabel.rx.isHidden,
                            mainview.emailValidLabel.rx.isHidden, mainview.passwordLabel.rx.isHidden, mainview.passwordValidLabel.rx.isHidden)
        .disposed(by: disposeBag)
        
        validationNameFalse.bind(to: mainview.userNameValidLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    func bindValidEmail() {
        //MARK: - 이메일에 대한 Validation Check
        viewModel.validEmail
            .asDriver()
            .drive(mainview.emailValidLabel.rx.text)
            .disposed(by: disposeBag)
        
        let validationEmail = mainview.emailLabel.rx.text
            .orEmpty
            .map { $0.count < 5 }
        
        let validationEmailFalse = mainview.emailLabel.rx.text
            .orEmpty
            .map { $0.count >= 5  }
        
        validationEmail.bind(to: mainview.signupButton.rx.isEnabled, mainview.passwordLabel.rx.isHidden, mainview.passwordValidLabel.rx.isHidden)
        .disposed(by: disposeBag)
        
        validationEmailFalse.bind(to: mainview.emailValidLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    func bindValidPassword() {
        
        //MARK: - 비밀번호에 대한 Validation Check
        viewModel.validPassword
            .asDriver()
            .drive(mainview.passwordValidLabel.rx.text)
            .disposed(by: disposeBag)
        
        let validationEmail = mainview.passwordLabel.rx.text
            .orEmpty
            .map { $0.count < 2 || $0.count > 10 }
        
        let validationEmailFalse = mainview.passwordLabel.rx.text
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 10  }
        
        validationEmail.bind(to: mainview.signupButton.rx.isEnabled,  mainview.passwordValidLabel.rx.isHidden)
        .disposed(by: disposeBag)
        
        validationEmailFalse.bind(to: mainview.passwordValidLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        validationEmail
            .withUnretained(self)
            .bind { (vc, value) in
                let color: UIColor = value ? .systemGray : .systemOrange
                vc.mainview.signupButton.backgroundColor = color
            }
            .disposed(by: disposeBag)
    }
    
    func signupButtonbind() {
        mainview.signupButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                vc.present(LoginViewController(), animated: true)
            }
    }
}

