//
//  AuthorizationViewController.swift
//  EcoNews
//
//  Created by Виктор Поволоцкий on 07.11.2020.
//

import UIKit
import Firebase

class AuthorizationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         assignbackground()
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var labelForError: UILabel!
    
    func assignbackground(){
            let background = UIImage(named: "signIn.png")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }
    
    func checkValidData()->String?{
        if loginTextField.text == nil ||
            loginTextField.text == "" ||
            passwordTextField.text == nil ||
            passwordTextField.text == ""{
            return "Please fill in all fiels"
        }
        return nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil{
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func buttonInput(_ sender: Any) {
        let myerror = checkValidData()
        if myerror == nil{
        Auth.auth().signIn(withEmail: loginTextField.text!, password: passwordTextField.text!) { (result, error) in
                if error != nil {
                    self.labelForError.alpha = 1
                    self.labelForError.text = "User is not found"
                    } else {
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
        }
        else{
            self.labelForError.alpha=1
            self.labelForError.text=myerror
        }
    }
}
