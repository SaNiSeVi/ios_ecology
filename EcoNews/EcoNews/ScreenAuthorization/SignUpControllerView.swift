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
    
    @IBOutlet weak var buttonForSign: UIButton!
    
    
    @IBAction func exitButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
    }
    
    func assignbackground(){
        let background = UIImage(named: "signUp.png")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        self.buttonForSign.layer.cornerRadius = 3
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
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil{
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }

    @IBAction func signUpButton(_ sender: Any) {
                let error = checkValidData()
                if error != nil {
                    errorLabel.alpha = 1
                    errorLabel.text = error
                } else {
                    Auth.auth().createUser(withEmail: mailTextField.text!, password: passwordTextField.text!) { (result, error) in
                        if error != nil {
                            self.errorLabel.text = "error of signUp"
                        } else {
                            let db = Firestore.firestore()
                            db.collection("users").document(self.mailTextField.text!).setData([
                                "firstname": self.nameTextField.text!,
                                "lastname": self.lastnameTextField.text!,
                                "email": self.mailTextField.text!,
                                "password": self.passwordTextField.text!
                            ]) { (error) in
                                if error != nil {
                                    self.errorLabel.text = "Error saving user in database"
                                }
                              //  print(result!.user.uid)
                            }
                            let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
                            let tabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarID") as UIViewController
                            tabBarVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                            self.present(tabBarVC, animated: true, completion: nil)
                        }
                    }
                }
    }
}
