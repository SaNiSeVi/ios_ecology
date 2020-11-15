//
//  ProfileViewController.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 07.11.2020.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var Profile: UILabel!
    @IBOutlet weak var LabelName: UILabel!
    @IBOutlet weak var LabelUsername: UILabel!
    @IBOutlet weak var LabelEmail: UILabel!
    @IBOutlet weak var LabelPassword: UILabel!
    @IBOutlet weak var Password: UILabel!
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Username: UILabel!
    @IBOutlet weak var Email: UILabel!
   
    
    @IBAction func PressChangePassword(_ sender: Any) {
        let SettingsVC = SettingsViewController()
        
        present(SettingsVC, animated: true, completion: nil)
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
