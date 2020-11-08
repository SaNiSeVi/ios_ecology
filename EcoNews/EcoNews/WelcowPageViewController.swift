//
//  WelcowPageViewController.swift
//  EcoNews
//
//  Created by Виктор Поволоцкий on 07.11.2020.
//

import UIKit

class WelcowPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAuthorize(_ sender: Any) {
        let authorizationVC = AuthorizationViewController()
        present(authorizationVC, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonSignIn(_ sender: Any) {
        let signUpVC = SignUpControllerView()
        present(signUpVC, animated: true, completion: nil)
    }
}
