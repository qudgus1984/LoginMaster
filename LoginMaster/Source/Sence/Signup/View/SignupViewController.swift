//
//  SignupViewController.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import RxCocoa
import RxSwift

final class SignupViewController: BaseViewController {
    
    private let mainview = SignupView()
    private let viewModel = SignupViewModel()
    private let disposeBag = DisposeBag()
    
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
        
        validationName.bind(to: mainview.emailLabel.rx.isHidden,
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
        
        validationEmail.bind(to: mainview.passwordLabel.rx.isHidden, mainview.passwordValidLabel.rx.isHidden)
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
        
        let validationPassword = mainview.passwordLabel.rx.text
            .orEmpty
            .map { $0.count < 2 || $0.count > 10 }
        
        let validationPasswordFalse = mainview.passwordLabel.rx.text
            .orEmpty
            .map { $0.count >= 2 && $0.count <= 10  }
        
        validationPassword.bind(to:   mainview.passwordValidLabel.rx.isHidden)
        .disposed(by: disposeBag)
        
        validationPasswordFalse.bind(to: mainview.passwordValidLabel.rx.isHidden, mainview.signupButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        validationPassword
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
                
                vc.viewModel.requestSignup(name: vc.mainview.userNameLabel.text!, email: vc.mainview.emailLabel.text!, password: vc.mainview.passwordLabel.text!)
                
                
//                vc.viewModel.postSignup(name: vc.mainview.userNameLabel.text!, email: vc.mainview.emailLabel.text!, password: vc.mainview.passwordLabel.text!)
            }
        
        viewModel.isSucceed
            .withUnretained(self)
            .observe(on: MainScheduler.instance)// 뜻 알아보기
            .subscribe { vc, value in
                vc.present(LoginViewController(), animated: true)
            } onError: { error in
                self.presentAlert(title: "회원가입실패 \(error)")
            } onCompleted: {
                print("완료")
            } onDisposed: {
                print("종료")
            }
            .disposed(by: disposeBag)

    }
}

