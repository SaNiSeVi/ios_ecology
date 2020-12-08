//
//  ProfileViewController.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    //Имя страницы
    @IBOutlet weak var LabelPage: UILabel!
    //Лейблы
    @IBOutlet weak var LabelName: UILabel!
    @IBOutlet weak var LabelSur: UILabel!
    @IBOutlet weak var LabelEmail: UILabel!
    @IBOutlet weak var LabelPassword: UILabel!
    //Данные
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var UserSur: UILabel!
    @IBOutlet weak var UserEmail: UILabel!
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let defaults = UserDefaults.standard
        
        getData(onSuccsess: {
            self.UserName.text = defaults.string(forKey: "UserFirstName")
            self.UserSur.text = defaults.string(forKey: "UserLastName")
            self.UserEmail.text = defaults.string(forKey: "UserEmail")
            
        }) {(error) in
            self.present(ProfileViewController.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
        }
        
    }
    
    //Кнопка изменить пароль
    @IBAction func EditPassword(_ sender: Any) {
           let SettingsVC = SettingsViewController()
            self.present(SettingsVC, animated: true, completion: nil)
           
       }
    
    //Функция на вывод данных
    func getData(onSuccsess: @escaping ()-> Void, onError: @escaping (_ error: Error?) ->Void ){
        let ref = Database.database().reference()
        let defaults = UserDefaults.standard
        
        guard let uid = Auth.auth().currentUser?.uid else{
            print("User not found")
        return
        }
        
        ref.child("users").child(uid).observe(.value) { (snapshot) in
            if let dictionary = snapshot.value as? [String: Any] {
                let firstname = dictionary["firstname"] as! String
                let lastname = dictionary["lastname"] as! String
                let email = dictionary["email"] as! String
                
                defaults.set(firstname,forKey: "UserFirstName")
                defaults.set(lastname,forKey: "UserLastName")
                defaults.set(email,forKey: "UserEmail")
            }
        } withCancel: { (error) in
            onError(error)
        }

    }
    
    //отработчик ошибок
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        
        return alert
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
