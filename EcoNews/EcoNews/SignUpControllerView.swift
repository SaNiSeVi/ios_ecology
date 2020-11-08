//
//  SignUpControllerView.swift
//  EcoNews
//
//  Created by Виктор Поволоцкий on 07.11.2020.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpControllerView: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func checkValidData()->String?{
        if nameTextField.text == "" ||
            lastnameTextField.text == "" ||
            mailTextField.text == "" ||
            passwordTextField.text == "" ||
            nameTextField.text == nil ||
            lastnameTextField.text == nil ||
            mailTextField.text == nil ||
            passwordTextField.text == nil {
            return "Please fill in all fiels"
        }
        return nil
    }

    @IBAction func signUpButton(_ sender: Any) {
            let error = checkValidData()

                if error != nil {
                    errorLabel.alpha = 1
                    errorLabel.text = error
                } else {
                    Auth.auth().createUser(withEmail: mailTextField.text!, password: passwordTextField.text!) { (result, error) in
                        if error != nil {
                            self.errorLabel.text = "\(error?.localizedDescription)"
                        } else {
                            let db = Firestore.firestore()
                            db.collection("users").addDocument(data: [
                                "firstname": self.nameTextField.text!,
                                "lastname": self.lastnameTextField.text!,
                                "email": self.mailTextField.text!,
                                "password": self.passwordTextField.text!
                            ]) { (error) in
                                if error != nil {
                                    self.errorLabel.text = "Error saving user in database"
                                }
                                print(result!.user.uid)
                            }
                            print("jump to screen")
                            let mapVC = MapViewController()
                            let newsVC = NewsViewController()
                            let profileVC = ProfileViewController()
                            let tabBarController = UITabBarController()

                            // settings controller
                            mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(named: "placeholder"), selectedImage: nil)
                            newsVC.tabBarItem = UITabBarItem(title: "News", image: UIImage(named: "newspaper"), selectedImage: nil)
                            profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: nil)

                            // visual contollers in tabbar
                            tabBarController.viewControllers = [mapVC,newsVC,profileVC]
                            
                            tabBarController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                            
                            self.present(tabBarController, animated: true, completion: nil)
                        }
                    }
                } // else
    }
}
