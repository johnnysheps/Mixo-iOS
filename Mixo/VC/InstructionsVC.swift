// STORYBOARD Instructions are many screens dynamically generated. These instruct user how to choose the avatars that make up their Mixotype Identity later.
// POSITIONED after the overview aka onboarding screen
//
//  InstructionsVC.swift
//  Mixo
//
//  Created by Sean Hall on 4/26/21.
//  Copyright © 2021 Sean Hall. All rights reserved.
//

import UIKit
import SwiftGifOrigin

@available(iOS 13.0, *)
class InstructionsVC: UIViewController{
    
    @IBOutlet var uiView: UIView!
    @IBOutlet weak var tvInstructions: UITextView!
    @IBOutlet weak var ivInstructions: UIImageView!
    
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    @IBOutlet weak var btnContinueNext: UIButton!
    
        
    let instructionList = [
        "The MixoType Engine is a self-assessment that helps you visualize your unique identity through a symbol we call, your MixoType.",

        "A Mixotype Identity represents your Heroes, Intelligences, Talents, and Collections, which are what you value that speak to who you are.",

        "In each section, you respond to the prompt by selecting the icons from the options presented in order of their significance to you, from 1 (highest) to 4 (lowest).",

        "In the Heroes, Talents, and Collections sections, you will select an additional Temperament or Modality icon that aligns with each of your primary selections.",

        "After each section, you get a recap of your selections, plus the option to start over if you want to make any changes."
    
    ]
    let imageList = [
        "instructions-alt-0",
        "instructions-alt-1",
        "instructions-alt-2",
        "instructions-alt-3",
        "instructions-alt-4",
    ]

    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(devMode) {
            index = 4 // If developer mode, skip most instruction screens so we can get to testing faster. Index 4 first because it pre-increments before doing switch cases
        }
        
        // Do any additional setup after loading the view.
        setUpUI()
    }

    
    func setUpUI() {
        
        btnContinueNext.setTitle("Next", for: .normal)
        
        // index 0
        tvInstructions.text = instructionList[0]
        ivInstructions.loadGif(name: imageList[0])
        
        // Progess indicators
        ivProgressIndicator0.image = UIImage(named:"progress-indicator-purple")
        ivProgressIndicator1.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator2.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator3.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator4.image = UIImage(named:"progress-indicator-gray")
        
    }
    
    @IBAction func btnContinueNext(_ sender: Any) {
        
        // On the last instructions page, change "Next" button to a "Continue" button that would load MX engine.
        index = index + 1
        switch index {
            case 5:
                if(devMode) { // If developer mode, skip the Engine loading splash screen, so we can test faster
                    let IntroVCLoader = mainSB.instantiateViewController(withIdentifier: "IntroVC") as! IntroVC
                    self.present(IntroVCLoader, animated: true, completion: nil)
                } else {
                    let mixoEngineLoad = mainSB.instantiateViewController(withIdentifier: "EngineLoadVC") as! EngineLoadVC
                    self.present(mixoEngineLoad, animated: true, completion: nil)
                }
            case 4:
                btnContinueNext.setTitle("Continue", for: .normal)
                tvInstructions.text = instructionList[index]
                ivInstructions.image = UIImage(named:imageList[index])
            default:
                tvInstructions.text = instructionList[index]
                ivInstructions.image = UIImage(named:imageList[index])
        }
        
        // Progess indicators
        switch index {
            case 1:
                ivProgressIndicator0.image = UIImage(named:"progress-indicator-gray")
                ivProgressIndicator1.image = UIImage(named:"progress-indicator-purple")
            case 2:
                ivProgressIndicator1.image = UIImage(named:"progress-indicator-gray")
                ivProgressIndicator2.image = UIImage(named:"progress-indicator-purple")
            case 3:
                ivProgressIndicator2.image = UIImage(named:"progress-indicator-gray")
                ivProgressIndicator3.image = UIImage(named:"progress-indicator-purple")
            case 4:
                ivProgressIndicator3.image = UIImage(named:"progress-indicator-gray")
                ivProgressIndicator4.image = UIImage(named:"progress-indicator-purple")
            default:
                print("Error - Instructions index out of bound")
        }
    }
}
