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
    
    @IBOutlet weak var tvInstructions: UITextView!
    @IBOutlet weak var ivInstructions: UIImageView!
//    @IBOutlet weak var btnLoadEngine: UIButton!
    
    @IBOutlet weak var btnContinueNext: UIButton!
    @IBOutlet var uiView: UIView!
//    @IBOutlet weak var swipeText: UITextView!
//    @IBOutlet weak var arrowText: UITextView!
        
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

        // Do any additional setup after loading the view.
        
        setUpUI()
    }

    
    func setUpUI() {
        
        btnContinueNext.setTitle("Next", for: .normal)
        
        // index 0
        tvInstructions.text = instructionList[index]
        ivInstructions.loadGif(name: imageList[index])
        
    }
    
    @IBAction func btnContinueNext(_ sender: Any) {
        
        // On the last instructions page, change "Next" button to a "Continue" button that would load MX engine.
        index = index + 1
        if(index == 5) {
            let mixoEngineLoad = mainSB.instantiateViewController(withIdentifier: "EngineLoadVC") as! EngineLoadVC
            self.present(mixoEngineLoad, animated: true, completion: nil)
        } else if(index == 4) {
            btnContinueNext.setTitle("Continue", for: .normal)
            tvInstructions.text = instructionList[index]
            ivInstructions.image = UIImage(named:imageList[index])
        } else {
            tvInstructions.text = instructionList[index]
            ivInstructions.image = UIImage(named:imageList[index])
        }
        
    }
}
