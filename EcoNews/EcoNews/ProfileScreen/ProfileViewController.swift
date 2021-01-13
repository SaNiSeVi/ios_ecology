//
//  ProfileViewController.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        photoUi.layer.cornerRadius = 50
        photoUi.layer.borderWidth = 0.5
    
        let db = Firestore.firestore()
        let curUserId: String = Auth.auth().currentUser!.email!
        let docRef = db.collection("users").document(curUserId)
        
    docRef.getDocument(source: .default) { (document, error) in
        if let document = document {
            self.secondNameLabel.text = (document.get("lastname") as! String)
            self.firstNameLabel.text = (document.get("firstname") as! String)
            self.emailAdressLabel.text = (document.get("email") as! String)
        } else {
            self.emailAdressLabel.text = "warning"
        }
    }
        
    }
    
    func assignbackground(){
        let background = UIImage(named: "profile.png")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
        self.firstNameLabel.backgroundColor = #colorLiteral(red: 0.6866912842, green: 0.9968866706, blue: 0.6948305368, alpha: 1).withAlphaComponent(0.5)
        self.secondNameLabel.backgroundColor = #colorLiteral(red: 0.6866912842, green: 0.9968866706, blue: 0.6948305368, alpha: 1).withAlphaComponent(0.5)
        self.emailAdressLabel.backgroundColor = #colorLiteral(red: 0.6866912842, green: 0.9968866706, blue: 0.6948305368, alpha: 1).withAlphaComponent(0.5)
        self.firstNameLabel.layer.cornerRadius = 3
    }
    
    @IBOutlet weak var photoUi: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var emailAdressLabel: UILabel!
    
}
