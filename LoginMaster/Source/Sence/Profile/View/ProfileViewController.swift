//
//  ViewController.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit
import RxCocoa
import RxSwift

class ProfileViewController: BaseViewController {
    
    let mainview = ProfileView()
    let viewModel = ProfileViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    override func loadView() {
        super.view = mainview
    }
    
    func bind() {
        viewModel.showProfile(api: SeSACAPI.profile)
        print(viewModel.email, viewModel.name)
        viewModel.email.bind(to: mainview.emailLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.name.bind(to: mainview.userNameLabel.rx.text)
            .disposed(by: disposeBag)

    }
}


