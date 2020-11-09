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
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPassword: UILabel!
    
    @IBOutlet weak var labelBaseName: UILabel!
    @IBOutlet weak var labelBaseUsername: UILabel!
    @IBOutlet weak var labelBaseEmail: UILabel!
    @IBOutlet weak var labelDots: UILabel!
    
    @IBAction func buttonEditPassword(_ sender: Any) {
        let SettingsController = SettingsViewController()
        
        self.present(SettingsController, animated: true, completion: nil)
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
