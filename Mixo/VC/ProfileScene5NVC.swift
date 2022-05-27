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
class ProfileScene5NVC: UIViewController {
    
    // Multistep progress bar
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    @IBOutlet weak var viewWillContainLinedTextView: UIView!
    var textView: DALinedTextView!
    
    // Buttons
    @IBOutlet weak var tvTagline: UITextView!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpUI()

        setupLinedTextView();
    }
    
    func setupLinedTextView() {
        textView = DALinedTextView()
        viewWillContainLinedTextView.addSubview(textView);
        textView.font = UIFont(name: "Heiti TC", size: 16);
        textView.verticalLineColor = UIColor.clear;
        textView.horizontalLineColor = UIColor.black;
        textView.backgroundColor = UIColor.white;
        textView.frame = viewWillContainLinedTextView.bounds
        textView.alwaysBounceVertical = true
//        textView.textContainerInset = UIEdgeInsets(top: 18.0, left: 10.0, bottom: 8.0, right: 10.0)
        textView.textContainerInset = UIEdgeInsets(top: 28.0, left: 15.0, bottom: 8.0, right: 15.0)
        textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        textView.text = "";
        textView.text += "This is a multiline textview with ruled lines as if it's ruled paper per mockup.\n\n";
        textView.text += "So far and so far and so far and so far.";
        
        textView.becomeFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textView.becomeFirstResponder()
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
            "tagline": textView.text!,
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
