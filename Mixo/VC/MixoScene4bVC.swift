//
//  MixoScene4bVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import Firebase

@available(iOS 13.0, *)
class MixoScene4bVC: UIViewController {

    @IBOutlet weak var btnHeroNav: UIButton!
    @IBOutlet weak var btnIntelNav: UIButton!
    @IBOutlet weak var btnTalNav: UIButton!
    @IBOutlet weak var btnColNav: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lblTitleText: UILabel!
    
    @IBOutlet weak var imgArchetype1: UIImageView!
    @IBOutlet weak var imgArchetype2: UIImageView!
    @IBOutlet weak var imgArchetype3: UIImageView!
    @IBOutlet weak var imgArchetype4: UIImageView!
    
    @IBOutlet weak var btnRestart: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var intelImages: [String] = [] //array that holds the intels
    var intelDone = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        intelImages.append("verbalas")
        intelImages.append("naturalisticas")
        intelImages.append("interpersonalas")
        intelImages.append("logicalas")
        intelImages.append("bodilyas")
        intelImages.append("intrapersonalas")
        intelImages.append("musicalas")
        intelImages.append("visualas")
        intelImages.append("existentialas")
        
        progress()
        Utilities.colorizeNavTabs(btnHeroNav,btnIntelNav,btnTalNav,btnColNav)
        setUpUI()
        getUserData()
    }
    
    //function to handle the progressBar
    func progress() {
        //check the users progress and set the progressbar accordingly
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let roleDone = document.get("role_done")  as! String
                let intelDone = document.get("intel_done")  as! String
                let talentDone = document.get("talent_done")  as! String
                let collectDone = document.get("collect_done")  as! String
                
                //combine all the Y's into 1 string
                let dones = roleDone + intelDone + talentDone + collectDone
                let done: Character = "Y"
                
                //count how many time Y is in the string
                let count = dones.filter { $0 == done }.count
                
                //set the progress bar accordingly
                if count == 1 {
                    self.progressBar.progress = 0.25
                } else if count == 2 {
                    self.progressBar.progress = 0.50
                } else if count == 3  {
                    self.progressBar.progress = 0.75
                } else if count == 4  {
                   self.progressBar.progress = 1
                }
                
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func setUpUI(){
        btnRestart.setTitle("Start Over",for: .normal)
        lblTitleText.text = "Your Intelligences"
        
        Utilities.styleGreyOutlinedButton(btnHeroNav)
        Utilities.styleGreyFilledButton(btnIntelNav)
        Utilities.styleGreyOutlinedButton(btnTalNav)
        Utilities.styleGreyOutlinedButton(btnColNav)
    }
    
    func getUserData(){
        //get the users intel choices
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let intel_nest = document.get("intel_nest")  as! String
                let intel_nest_1 = intel_nest[0]
                let intel_nest_2 = intel_nest[1]
                let intel_nest_3 = intel_nest[2]
                let intel_nest_4 = intel_nest[3]
                
                self.imgArchetype1.image = UIImage(named: self.intelImages[Int(intel_nest_1)! - 1])
                self.imgArchetype2.image = UIImage(named: self.intelImages[Int(intel_nest_2)! - 1])
                self.imgArchetype3.image = UIImage(named: self.intelImages[Int(intel_nest_3)! - 1])
                self.imgArchetype4.image = UIImage(named: self.intelImages[Int(intel_nest_4)! - 1])
                       
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func restartArchetype(){
        docRef.updateData([
            "intel": "incomplete",
            "intel_done": "N",
            "intel_img1": "incomplete",
            "intel_img2": "incomplete",
            "intel_img3": "incomplete",
            "intel_img4": "incomplete",
            "intel_nest": "incomplete",
            "intel_sub": "incomplete",
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                //data saved...
                let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
                self.present(mixoScene1VC, animated:true, completion:nil)
            }
        }
    }
    
    func nextArchetype(){
        let mixoScene5VC = mainSB.instantiateViewController(withIdentifier: "MixoScene5VC") as! MixoScene5VC
        self.present(mixoScene5VC, animated:true, completion:nil)
    }
    
    func warning(warn: String){
        if warn == "N" {
            warningInt = 5
            let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
            self.present(warningVC, animated:true, completion:nil)
        }else{
            
            mixoState = 3
            let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
            self.present(mixoScene1VC, animated:true, completion:nil)
        }
    }
    
    @IBAction func btnHeroNav(_ sender: Any) {
        mixoState = 1
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated:true, completion:nil)
    }
    @IBAction func btnIntelNav(_ sender: Any) {
        mixoState = 2
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated:true, completion:nil)
    }
    @IBAction func btnTalNav(_ sender: Any) {
        //check if the user has completed the section they are trying to jump to
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.intelDone = document.get("intel_done") as! String
                
                self.warning(warn: self.intelDone)
            } else {
                print("Document does not exist")
            }
        }
        
    }
    @IBAction func btnColNav(_ sender: Any) {
        mixoState = 4
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated:true, completion:nil)
    }
    
    @IBAction func btnRestart(_ sender: Any) {
        restartArchetype()
    }
    @IBAction func btnNext(_ sender: Any) {
//        let mixoScene5VC = mainSB.instantiateViewController(withIdentifier: "MixoScene5VC") as! MixoScene5VC
//        self.present(mixoScene5VC, animated:true, completion:nil)
        
        mixoState+=1;
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated:true, completion:nil)
    }
    

}
