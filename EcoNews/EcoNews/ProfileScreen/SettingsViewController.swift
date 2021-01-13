//  SettingsViewController
//  SettingsViewController.swift
//  EcoNews
//
//  Created by Виктор Поволоцкий on 12.01.2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

class SettingsViewController: UIViewController{
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.layer.cornerRadius = 50
        photoImageView.layer.borderWidth = 0.5
    }

    var urlString = ""
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    @IBAction func changePasswordProfile(_ sender: Any) {
        let cur = Auth.auth().currentUser!.email!
            
        }
    }
    

extension SettingsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        photoImageView.image = image
    }
}
