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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        super.view = mainview
    }
    
    func bind() {
        
    }
}

