//
//  LoginViewController.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: BaseViewController {

    let api = APIService()
    let mainview = LoginView()
    let disposeBag = DisposeBag()
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validButtonBind()
        loginButtonbind()

    }

    override func loadView() {
        super.view = mainview
    }
    
    func validButtonBind() {
        mainview.emailLabel.rx.text
            .orEmpty
            .asDriver()
            .drive(viewModel.loginEmail)
            .disposed(by: disposeBag)
        
        mainview.passwordLabel.rx.text
            .orEmpty
            .asDriver()
            .drive(viewModel.loginPassword)
            .disposed(by: disposeBag)
        
        viewModel.isValidLogin
            .bind(to: mainview.signupButton.rx.isEnabled)
            .disposed(by: disposeBag)
        
        viewModel.isValidLogin
            .withUnretained(self)
            .bind { (vc, value) in
                let color: UIColor = value ? .systemOrange : .systemGray
                vc.mainview.signupButton.backgroundColor = color
            }
            .disposed(by: disposeBag)
    }
    
    func loginButtonbind() {
        mainview.signupButton.rx.tap
            .withUnretained(self)
            .bind { (vc, _) in
                
                vc.viewModel.postLogin(email: vc.mainview.emailLabel.text!, password: vc.mainview.passwordLabel.text!)
                vc.present(ProfileViewController(), animated: true)
            }
        
        
    }
}

