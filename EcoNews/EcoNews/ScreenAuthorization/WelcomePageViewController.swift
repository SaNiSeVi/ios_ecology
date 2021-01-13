//
//  WelcowPageViewController.swift
//  EcoNews
//
//  Created by Виктор Поволоцкий on 07.11.2020.
//

import UIKit

class WelcomePageViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var labelEco: UILabel!
    @IBOutlet weak var buttonForAuthprize: UIButton!

    @IBOutlet weak var buttonForSignUp: UIButton!

    func assignbackground(){
            let background = UIImage(named: "backGround.png")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        self.labelEco.backgroundColor = #colorLiteral(red: 0.5869942904, green: 0.4428036809, blue: 0.5852294564, alpha: 1).withAlphaComponent(0.5)
        self.buttonForAuthprize.backgroundColor = #colorLiteral(red: 0.5870402455, green: 0.4427049458, blue: 0.5894571543, alpha: 1).withAlphaComponent(0.7)
        self.buttonForSignUp.backgroundColor = #colorLiteral(red: 0.5870402455, green: 0.4427049458, blue: 0.5894571543, alpha: 1).withAlphaComponent(0.7)
        }


    @IBAction func buttonAuthorize(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
        let authVC = storyboard.instantiateViewController(withIdentifier: "AuthID") as UIViewController
       
        authVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(authVC, animated: true, completion: nil)
        //present(authorizationVC, animated: true, completion: nil)
    }


    @IBAction func buttonSignIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let signVC = storyboard.instantiateViewController(withIdentifier: "SignUpID") as UIViewController
        signVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(signVC, animated: true, completion: nil)
      //  present(signUpVC, animated: true, completion: nil)
    }
}
