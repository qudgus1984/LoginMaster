//
//  LoginViewController.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit

class LoginViewController: BaseViewController {

    let mainview = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.view = mainview
    }
}

