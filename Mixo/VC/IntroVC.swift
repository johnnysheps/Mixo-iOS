// STORYBOARD This is a breathing screen that instructs user to think about who they are while they reflect and breathe.
// AKA IntroVC aka Breathing screen
// NAMESAKE It's called Introduction because it's an Introduction screen to the Mixotype Identity
// POSITIONED before choosing the avatars that make up their Mixotype Identity
//
//  IntroVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/12/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FontAwesome_swift

@available(iOS 13.0, *)
class IntroVC: UIViewController {

    @IBOutlet weak var lblSlow: UILabel!
    @IBOutlet weak var lblBreaths: UILabel!
    @IBOutlet weak var lblAssess: UILabel!
    @IBOutlet weak var ivCircle: UIImageView!
    @IBOutlet weak var lblCountdown: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var chevron: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpUI()
        
        showAnimation()
    }
    
    func setUpUI() {
        
        //hide the labels
        lblSlow.alpha = 0
        lblBreaths.alpha = 0
        lblAssess.alpha = 0
        lblCountdown.alpha = 0
        btnStart.alpha = 0
        chevron.alpha = 0
        ivCircle.alpha = 0
        
        if(devMode) {
            btnStart.alpha = 1 // If developer mode, let user skip right into the Mixotype Identity choosing screens, so we can test faster.
        }
        
        // Font awesome in iOS (not enough for it to display in storyboard)
        chevron.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron.text = String.fontAwesomeIcon(name: FontAwesome.chevronRight)
        
        //style the button
        Utilities.stylePurpleFilledButton(btnStart)
        
    }
    
    func showAnimation() {
        //show the slow label after 1.5 secs
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.lblSlow.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.lblBreaths.alpha = 1
        }
        
        //show the assess label after 3.5 secs
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
            self.lblAssess.alpha = 1
        }
        
        //show the circle and start countdown
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            self.ivCircle.alpha = 0.6
            self.lblCountdown.text = "3"
            self.lblCountdown.alpha = 1
        }
        
        //2 countdown
        DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
            self.lblCountdown.text = "2"
        }
        
        //1 countdown
        DispatchQueue.main.asyncAfter(deadline: .now() + 8.0) {
            self.lblCountdown.text = "1"
        }
        
        //show button
        DispatchQueue.main.asyncAfter(deadline: .now() + 9.0) {
            self.lblCountdown.alpha = 0
            self.ivCircle.alpha = 0
            self.btnStart.alpha = 1
            self.chevron.alpha = 1
        }
    }
    
    @IBAction func btnStart(_ sender: Any) {
        mixoState = 1
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated: true, completion: nil)
    }
    
    
    

}
