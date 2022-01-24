//
//  ViewController.swift
//  Mixo
//
//  Created by Sean Hall on 10/11/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FontAwesome_swift

/* Important. Set environment!
 * If development mode, then we can code screen skips for faster testing
 */
let devMode = true;

let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle:.main)
let defSB : UIStoryboard  = UIStoryboard(name: "Definitions", bundle: .main)
let warningSB : UIStoryboard = UIStoryboard(name: "Warning", bundle: .main)
let tempDefSB : UIStoryboard = UIStoryboard(name: "TMDef", bundle: .main)
let modDefSB : UIStoryboard = UIStoryboard(name: "TMDef", bundle: .main)
let resultsSB : UIStoryboard = UIStoryboard(name: "Results", bundle: .main)

class ViewController: UIViewController {
    @IBOutlet weak var chevron: UITextView!
    @IBOutlet weak var btnStart: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
                
        setUpElements()
        
        
    }
    
    func setUpElements(){
        
        Utilities.styleFilledButton(btnStart)
        chevron.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron.text = String.fontAwesomeIcon(name: FontAwesome.chevronRight)
        
    }

    @IBAction func btnStart(_ sender: Any) {
        
        
        
    }
    
    
    
    
    
}

