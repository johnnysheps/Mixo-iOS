//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit
import Firebase

var response = [
    "user_id":"",
    "user_name": "",
    "user_pic": "",
    "user_city": "",
    "user_state": "",
    "user_location": "",
    "user_dob": "",
    "user_age_year": "",

    "gsImgRef": "",
    "httpsImgRef": "",

    "roleDone": "",
    "intelDone": "",
    "talentDone": "",
    "collectDone": "",

    "role_nest_1": "",
    "role_basket_nest_1": "",
    "role_basket_nest_2": "",
    "role_basket_nest_3": "",
    "role_basket_nest_4": "",

    "intel_nest_1": "",
    "intel_nest_2": "",
    "intel_nest_3": "",
    "intel_nest_4": "",

    "talent_nest_1": "",
    "talent_basket_nest_1": "",
    "talent_basket_nest_2": "",
    "talent_basket_nest_3": "",
    "talent_basket_nest_4": "",

    "collect_nest_1": "",
    "collect_basket_nest_1": "",
    "collect_basket_nest_2": "",
    "collect_basket_nest_3": "",
    "collect_basket_nest_4": ""
]

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func colorizeNavTabs(_ btnHeroNavScene1:UIButton, _ btnIntelNavScene1:UIButton, _ btnTalNavScene1:UIButton, _ btnColNavScene1:UIButton) {
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let roleDone = document.get("role_done")  as? String else {return}
                guard let intelDone = document.get("intel_done")  as? String else {return}
                guard let talentDone = document.get("talent_done")  as? String else {return}
                guard let collectDone = document.get("collect_done")  as? String else {return}
                
                let tabGreen = UIColor(red: 164/255, green: 212/255, blue: 162/255, alpha: 1)
                
                if(roleDone=="Y") {
                    btnHeroNavScene1.backgroundColor = tabGreen
                }
                if(intelDone=="Y") {
                    btnIntelNavScene1.backgroundColor = tabGreen
                }
                if(talentDone=="Y") {
                    btnTalNavScene1.backgroundColor = tabGreen
                }
                if(collectDone=="Y") {
                    btnColNavScene1.backgroundColor = tabGreen
                }
                 
            } else {
                //print("Document does not exist")
            }
        }
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.red.cgColor
    }
    
    static func roundedCorner(_ button:UIButton) {
        button.layer.cornerRadius = 5
    }
    
    static func stylePurpleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.purple
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.purple.cgColor
    }
    
    static func styleGreyFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.lightGray
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    static func styleBlackFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    static func styleGreyFilledRoundedButton(_ button:UIButton){
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    static func styleGreyOutlinedButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    static func styleBlackOutlinedButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func styleOuterView(_ view:UIView) {
        
        // Filled rounded corner style
        view.backgroundColor = UIColor.lightGray
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    static func styleInnerView(_ view:UIView) {
        
        // rounded corner style
        view.layer.cornerRadius = 5
    }
    
}
