//
//  ProfileViewController.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var secondName: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        let db = Firestore.firestore()
        let curUserId: String = Auth.auth().currentUser!.email!
        let docRef = db.collection("users").document(curUserId)
        
    docRef.getDocument(source: .default) { (document, error) in
        if let document = document {
            self.secondName.text = (document.get("lastname") as! String)
            self.firstName.text = (document.get("firstname") as! String)
            self.email.text = (document.get("email") as! String)
        } else {
            self.email.text = "warning"
        }
    }

        // Do any additional setup after loading the view.
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
        self.firstName.backgroundColor = #colorLiteral(red: 0.6866912842, green: 0.9968866706, blue: 0.6948305368, alpha: 1).withAlphaComponent(0.5)
        self.secondName.backgroundColor = #colorLiteral(red: 0.6866912842, green: 0.9968866706, blue: 0.6948305368, alpha: 1).withAlphaComponent(0.5)
        self.email.backgroundColor = #colorLiteral(red: 0.6866912842, green: 0.9968866706, blue: 0.6948305368, alpha: 1).withAlphaComponent(0.5)
        self.firstName.layer.cornerRadius = 3
    }
}
