//
//  SplashScreenVC.swift
//  testnative
//
//  Created by Ricardo Granja Chávez on 11/08/21.
//

import UIKit

class SplashScreenVC: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoImageView.alpha = 0
        self.setNeedsStatusBarAppearanceUpdate()
        UIView.animate(withDuration: 1, animations: {
            self.logoImageView.alpha = 1
        })
    }
    
}
