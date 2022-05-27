//
//  ProfileScene5VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import DALinedTextView
import KMPlaceholderTextView

@available(iOS 13.0, *)
class ProfileScene5NVC: UIViewController, UITextViewDelegate {
    
    // Multistep progress bar
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    // Controls
    
    @IBOutlet weak var userInput: KMPlaceholderTextView!
    @IBOutlet weak var charLimit: UILabel!
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
    
    internal func textViewDidChange(_ textView: UITextView) {
        let count = String(userInput.text.count);
        charLimit.text = "(" + count + "/60)";
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        //save tagline
        docRef.updateData([
            "tagline": userInput.text!,
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
