// STORYBOARD: Onboarding is an overview screen of what the next screens will be.
// POSITIONED before the instruction screens
//
//  Onboarding.swift
//  Mixo
//
//  Created by Weng on 12/21/21.
//  Copyright © 2021 Sean Hall. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class OnboardingVC: UIViewController{
    
    @IBOutlet weak var btnOnboarding: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnOnboardingCont(_ sender: Any) {
        let mixoInstructions = mainSB.instantiateViewController(withIdentifier: "InstructionsVC") as! InstructionsVC
        self.present(mixoInstructions, animated: true, completion: nil)
        
    }
}
