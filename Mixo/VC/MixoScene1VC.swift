//
//  MixoScene1VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import Firebase

let progress = Progress(totalUnitCount: 4)

struct Warn : Decodable {
    let title: String
    let text: String
    let image: String
}



@available(iOS 13.0, *)
class MixoScene1VC: UIViewController {

    @IBOutlet weak var lblSectionTitle: UILabel!
    @IBOutlet weak var lblSectionText: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnHeroNavScene1: UIButton!
    @IBOutlet weak var btnIntelNavScene1: UIButton!
    @IBOutlet weak var btnTalNavScene1: UIButton!
    @IBOutlet weak var btnColNavScene1: UIButton!
    @IBOutlet weak var ivMixoState: UIImageView!
    
    var intelDone = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.colorizeNavTabs(btnHeroNavScene1, btnIntelNavScene1, btnTalNavScene1, btnColNavScene1)
        setUpUI()
        progress()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func progress() {
        //check the users progress and set the progressbar accordingly
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let roleDone = document.get("role_done")  as? String else {return}
                guard let intelDone = document.get("intel_done")  as? String else {return}
                guard let talentDone = document.get("talent_done")  as? String else {return}
                guard let collectDone = document.get("collect_done")  as? String else {return}
                
                // <-- Conditional breakpoint restarted 1. Breakpoint inside async updateDoc does not work at MixoScene5VC
                if restarted == 1 {
                    restarted = 0;
                }
                
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
                //print("Document does not exist")
            }
        }
    }
    
    func setUpUI() {
        //load the archetype images & style the Nav1 fields according to mixoState
        switch(mixoState){
            case 1:
                Utilities.styleGreyFilledButton(btnHeroNavScene1)
                Utilities.styleGreyOutlinedButton(btnIntelNavScene1)
                Utilities.styleGreyOutlinedButton(btnTalNavScene1)
                Utilities.styleGreyOutlinedButton(btnColNavScene1)
                Utilities.styleBlackFilledButton(btnNext)
                btnNext.setTitle("Next", for:.highlighted)
                lblSectionTitle.text = "Section 1: Heroes"
                lblSectionText.text = "Who Do You Aspire To Be?"
                ivMixoState.image = UIImage(named: "I _ MixoType Engine - Heroes Section Intro Graphic")
            break
            case 2:
                Utilities.styleGreyOutlinedButton(btnHeroNavScene1)
                Utilities.styleGreyFilledButton(btnIntelNavScene1)
                Utilities.styleGreyOutlinedButton(btnTalNavScene1)
                Utilities.styleGreyOutlinedButton(btnColNavScene1)
                Utilities.styleBlackFilledButton(btnNext)
                btnNext.setTitle("Next", for:.highlighted)
                lblSectionTitle.text = "Section 2: Intelligences"
                lblSectionText.text = "How Do You Express Yourself?"
                ivMixoState.image = UIImage(named: "J _ MixoType Engine - Intelligences Section Intro Graphic")
            
                break
            case 3:
                Utilities.styleGreyOutlinedButton(btnHeroNavScene1)
                Utilities.styleGreyOutlinedButton(btnIntelNavScene1)
                Utilities.styleGreyFilledButton(btnTalNavScene1)
                Utilities.styleGreyOutlinedButton(btnColNavScene1)
                Utilities.styleBlackFilledButton(btnNext)
                btnNext.setTitle("Next", for:.highlighted)
                lblSectionTitle.text = "Section 3: Talents"
                lblSectionText.text = "What Are Your Innate Abilities?"
                ivMixoState.image = UIImage(named: "K _ MixoType Engine - Talents Section Intro Graphic")
            
                break
            case 4:
                Utilities.styleGreyOutlinedButton(btnHeroNavScene1)
                Utilities.styleGreyOutlinedButton(btnIntelNavScene1)
                Utilities.styleGreyOutlinedButton(btnTalNavScene1)
                Utilities.styleGreyFilledButton(btnColNavScene1)
                Utilities.styleBlackFilledButton(btnNext)
                btnNext.setTitle("Next", for:.highlighted)
                lblSectionTitle.text = "Section 4: Collections"
                lblSectionText.text = "What Things Do You Value Most?"
                ivMixoState.image = UIImage(named: "L _ MixoType Engine - Collections Section Intro Graphic")
            
                break
            default:
                break
        }
    }
    
    @IBAction func btnHeroNavScene1(_ sender: Any) {
        mixoState = 1
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated:true, completion:nil)
    }
    @IBAction func btnIntelNavScene1(_ sender: Any) {
        mixoState = 2
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated:true, completion:nil)
    }
    @IBAction func btnTalNavScene1(_ sender: Any) {
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
    @IBAction func btnColNavScene1(_ sender: Any) {
        mixoState = 4
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        self.present(mixoScene1VC, animated:true, completion:nil)
    }
    
    func warning(warn: String){
        if warn == "N" {
            warningInt = 5
            let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
            self.present(warningVC, animated:true, completion:nil)
        }else{
            print("bypass")
            mixoState = 3
            let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
            self.present(mixoScene1VC, animated:true, completion:nil)
        }
    }
    
    
    @IBAction func btnNext(_ sender: Any) {
        //send the user on to the next step
        
        let mixoScene2aVC = mainSB.instantiateViewController(withIdentifier: "MixoScene2aVC") as! MixoScene2aVC
        let mixoScene2bVC = mainSB.instantiateViewController(withIdentifier: "MixoScene2bVC") as! MixoScene2bVC
        
        switch(mixoState){
            case 1:
                self.present(mixoScene2aVC, animated:true, completion:nil)
                break
            case 2:
                self.present(mixoScene2aVC, animated:true, completion:nil)
                break
            case 3:
                self.present(mixoScene2bVC, animated:true, completion:nil)
                break
            case 4:
                self.present(mixoScene2aVC, animated:true, completion:nil)
                break
            default:
                break
        }
        
    }
    
    

}
