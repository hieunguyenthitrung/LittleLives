//
//  SplashViewController.swift
//  TestLittleLive
//
//  Created by Hieu Nguyen on 22/08/2022.
//

import Foundation
import UIKit
class SplashViewController: UIViewController {

    @IBOutlet weak var splashScreenLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.splashScreenLbl.text = ""
        let titleText = "Hello Little Lives"
        var charIndex = 0.0
        
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.splashScreenLbl.text?.append(letter)
            }
            charIndex += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
}

