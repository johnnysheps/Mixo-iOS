//
//  ProfileScene5VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FontAwesome_swift

@available(iOS 13.0, *)
class ProfileScene5NVC: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var chevron: UITextView!
    var lastTextEntered = "";
    
    // Multistep progress bar
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    
    // Controls
    
    @IBOutlet weak var userInput: UITextView!
    @IBOutlet weak var charLimit: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        chevron.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron.text = String.fontAwesomeIcon(name: FontAwesome.chevronRight)
        super.viewDidLoad()
        
        print("/***/ Struct Creational missionStatement");
        if(!(Creational.missionStatement==nil)) {
            print("Is nil");
            userInput.text = Creational.missionStatement
        }
        
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
        
        let countInt = userInput.text!.count
        let countStr = String(countInt);
        if(countInt<60) {
            charLimit.textColor = UIColor.black;
            charLimit.text = "(" + countStr + "/60)";
            lastTextEntered = userInput.text!;
        } else if(countInt==60) {
            charLimit.textColor = UIColor.red;
            charLimit.text = "(60/60)";
            lastTextEntered = userInput.text!;
        } else if(countInt>60) {
            charLimit.textColor = UIColor.red;
            charLimit.text = "(60/60)";
            userInput.text = lastTextEntered;
        }
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        
        Creational.missionStatement = userInput.text = Creational.missionStatement
        
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
