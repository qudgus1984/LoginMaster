//
//  ViewController.swift
//  LoginMaster
//
//  Created by 이병현 on 2022/11/02.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    let mainview = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.view = mainview
    }
    
    
}


