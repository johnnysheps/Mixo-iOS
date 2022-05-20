//
//  ProfileScene5VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ProfileScene5NVC: UIViewController {
    
    // Multistep progress bar
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    // Buttons
    @IBOutlet weak var tvTagline: UITextView!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    func setUpUI() {
        
        // Progess indicators - Render appropriately
        ivProgressIndicator0.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator1.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator2.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator3.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator4.image = UIImage(named:"progress-indicator-purple")
    }
    
    @IBAction func btnNext(_ sender: Any) {
        //save tagline
        docRef.updateData([
            "tagline": tvTagline.text!,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                let dashboardVC = mainSB.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
                self.present(dashboardVC, animated:true, completion:nil)
            }
        }
    }

}
