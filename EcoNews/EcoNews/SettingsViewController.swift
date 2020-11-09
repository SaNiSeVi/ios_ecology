//
//  SettingsViewController.swift
//  EcoNews
//
//  Created by Sandzhar Tlepin on 09.11.2020.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var labelEditPassword: UILabel!
    @IBOutlet weak var labelOldPassword: UILabel!
    @IBOutlet weak var labelNewPassword: UILabel!
    @IBAction func fieldOldPassword(_ sender: Any) {
    }
    @IBAction func fieldNewPassword(_ sender: Any) {
    }
    @IBAction func buttonSave(_ sender: Any) {
    }
    
    func checkValidData()->String?{
           if  fieldOldPassword.text == nil ||
               fieldOldPassword.text == ""  ||
               fieldNewPassword.text == nil ||
               fieldNewPassword.text == "" {
               return "Please fill in all fiels"
           }
           return nil
       }
    @IBAction func touchdownSaveEdit(_ sender: Any) {
        
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
