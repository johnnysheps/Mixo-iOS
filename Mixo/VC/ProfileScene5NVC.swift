//
//  ProfileScene5VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import DALinedTextView

@available(iOS 13.0, *)
class ProfileScene5NVC: UIViewController {
    
    // Multistep progress bar
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    var textView: DALinedTextView!
    
    // Buttons
    @IBOutlet weak var tvTagline: UITextView!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpUI()
        //title = "DALinedTextView"

        textView = DALinedTextView()
        textView.frame = view.bounds
        textView.alwaysBounceVertical = true
        textView.textContainerInset = UIEdgeInsets(top: 18.0, left: 10.0, bottom: 8.0, right: 10.0)
        textView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.addSubview(textView)
        
        textView.text = "";
        textView.text += "`DALinedTextView` is a `UITextView` subclass that draws ruled lines to the view, similar to iOS' built-in Notes app. The lines conform to the appropriate line-height for the currently set `UIFont`.\n\n";
        
        textView.text += "`DALinedTextView` is special because it was built with performance and appropriate behavior in mind. Most Q&A and OSS solutions involve image-based backgrounds or overzealous drawing code. For most applications such implementations are great, but `DALinedTextView` was built with 1000-line (or more) `UITextView`s in mind.\n\n";

        textView.text += "Performance decisions are commented so as to provide insight into the thought process behind `DALinedTextView`. The current `-drawRect:` implementation takes as little as 1ms on an iPhone 5."
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
