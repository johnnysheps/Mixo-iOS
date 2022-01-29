//
//  MixoScene4VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MixoScene4aVC: UIViewController {

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
    @IBOutlet weak var imgTM1: UIImageView!
    @IBOutlet weak var imgTM2: UIImageView!
    @IBOutlet weak var imgTM3: UIImageView!
    @IBOutlet weak var imgTM4: UIImageView!
    
    @IBOutlet weak var btnRestart: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var heroImages: [String] = [] //array that holds the role
    var talentImages: [String] = []//array that holds the talents
    var collectImages: [String] = []//array that holds the collections
    var temperamentImages: [String] = [] //array that holds the temperaments
    var modalityImages: [String] = []//array that holds the modalities
    var intelDone = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        heroImages.append("actoras")
        heroImages.append("leaderas")
        heroImages.append("philosopheras")
        heroImages.append("athleteas")
        heroImages.append("musicianas")
        heroImages.append("scientistas")
        heroImages.append("designeras")
        heroImages.append("naturalistas")
        heroImages.append("selfreflectoras")
        
        talentImages.append("v1img1as") //Verbal - 1 - [0]
        talentImages.append("v1img2as") //Verbal - 2 - [1]
        talentImages.append("v1img3as") //Verbal - 3 - [2]
        talentImages.append("v1img4as") //Verbal - 4 - [3]
        talentImages.append("nimg1as") //Naturalistic - 5 - [4]
        talentImages.append("nimg2as") //Naturalistic - 6 - [5]
        talentImages.append("nimg3as") //Naturalistic - 7 - [6]
        talentImages.append("nimg4as") //Naturalistic - 8 - [7]
        talentImages.append("i1img1as") //Interpersonal - 9 - [8]
        talentImages.append("i1img2as") //Interpersonal - 10 - [9]
        talentImages.append("i1img3as") //Interpersonal - 11 - [10]
        talentImages.append("i1img4as") //Interpersonal - 12 - [11]
        talentImages.append("limg1as") //Logical - 13 - [12]
        talentImages.append("limg2as") //Logical - 14 - [13]
        talentImages.append("limg3as") //Logical - 15 - [14]
        talentImages.append("limg4as") //Logical - 16 - [15]
        talentImages.append("bimg1as") //Bodily - 17 - [16]
        talentImages.append("bimg2as") //Bodily - 18 - [17]
        talentImages.append("bimg3as") //Bodily - 19 - [18]
        talentImages.append("bimg4as") //Bodily - 20 - [19]
        talentImages.append("i2img1as") //Intrapersonal - 21 - [20]
        talentImages.append("i2img2as") //Intrapersonal - 22 - [21]
        talentImages.append("i2img3as") //Intrapersonal - 23 - [22]
        talentImages.append("i2img4as") //Intrapersonal - 24 - [23]
        talentImages.append("mimg1as") //Musical - 25 - [24]
        talentImages.append("mimg2as") //Musical - 26 - [25]
        talentImages.append("mimg3as") //Musical - 27 - [26]
        talentImages.append("mimg4as") //Musical - 28 - [27]
        talentImages.append("v2img1as") //Visual - 29 - [28]
        talentImages.append("v2img2as") //Visual - 30 - [29]
        talentImages.append("v2img3as") //Visual - 31 - [30]
        talentImages.append("v2img4as") //Visual - 32 - [31]
        talentImages.append("eimg1as") //Existential - 33 - [32]
        talentImages.append("eimg2as") //Existential - 34 - [33]
        talentImages.append("eimg3as") //Existential - 35 - [34]
        talentImages.append("eimg4as") //Existential - 36 - [35]
        
        collectImages.append("socialactivitiesas")
        collectImages.append("musicas")
        collectImages.append("heirloomsas")
        collectImages.append("fitnessas")
        collectImages.append("aestheticsas")
        collectImages.append("natureas")
        collectImages.append("technologyas")
        collectImages.append("theatricalas")
        collectImages.append("selfimprovementas")
        
        temperamentImages.append("king")
        temperamentImages.append("warrior")
        temperamentImages.append("magician")
        temperamentImages.append("lover")
        
        modalityImages.append("physical")
        modalityImages.append("spiritual")
        modalityImages.append("logical")
        modalityImages.append("creative")
        
        getUserData()
        setUpUI()
        
        progress()
    }
    
    @IBAction func btnRestart(_ sender: Any) {
        restartArchetype()
    }
    
    @IBAction func btnNext(_ sender: Any) {
        nextArchetype()
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
    
    func setUpUI(){
        switch mixoState{
            case 1:
                Utilities.styleGreyFilledButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyOutlinedButton(btnTalNav)
                Utilities.styleGreyOutlinedButton(btnColNav)
                btnRestart.setTitle("Start Over", for: .normal)
                lblTitleText.text = "Your Heroes"
                break
            case 3:
                Utilities.styleGreyOutlinedButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyFilledButton(btnTalNav)
                Utilities.styleGreyOutlinedButton(btnColNav)
                btnRestart.setTitle("Start Over", for: .normal)
                lblTitleText.text = "Your Talents"
                break
            case 4:
                Utilities.styleGreyOutlinedButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyOutlinedButton(btnTalNav)
                Utilities.styleGreyFilledButton(btnColNav)
                btnNext.setTitle("Complete My MixoType", for: .normal)
                btnRestart.setTitle("Start Over", for: .normal)
                lblTitleText.text = "Your Collections"
                break
            default:
                break
        }
    }
    
    func getUserData(){
        switch mixoState{
            case 1:
                //get the users hero choices
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let role_nest = document.get("role_nest")  as! String
                        let role_basket_nest = document.get("role_basket_nest") as! String
                        let role_nest_1 = role_nest[0]
                        let role_nest_2 = role_nest[1]
                        let role_nest_3 = role_nest[2]
                        let role_nest_4 = role_nest[3]
                        let role_basket_nest_1 = role_basket_nest[0]
                        let role_basket_nest_2 = role_basket_nest[1]
                        let role_basket_nest_3 = role_basket_nest[2]
                        let role_basket_nest_4 = role_basket_nest[3]
                        
                        self.imgArchetype1.image = UIImage(named: self.heroImages[Int(role_nest_1)! - 1])
                        self.imgArchetype2.image = UIImage(named: self.heroImages[Int(role_nest_2)! - 1])
                        self.imgArchetype3.image = UIImage(named: self.heroImages[Int(role_nest_3)! - 1])
                        self.imgArchetype4.image = UIImage(named: self.heroImages[Int(role_nest_4)! - 1])
                        
                        self.imgTM1.image = UIImage(named: self.temperamentImages[Int(role_basket_nest_1)! - 1])
                        self.imgTM2.image = UIImage(named: self.temperamentImages[Int(role_basket_nest_2)! - 1])
                        self.imgTM3.image = UIImage(named: self.temperamentImages[Int(role_basket_nest_3)! - 1])
                        self.imgTM4.image = UIImage(named: self.temperamentImages[Int(role_basket_nest_4)! - 1])
                               
                    } else {
                        print("Document does not exist")
                    }
                }
                break
            case 3:
                //get the users talent choices
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let talent_nest = document.get("talent_nest")  as! String
                        let talent_basket_nest = document.get("talent_basket_nest") as! String
                        let talent_nestArr = talent_nest.components(separatedBy: "_")
                        let talent_nest_1 = talent_nestArr[0]
                        let talent_nest_2 = talent_nestArr[1]
                        let talent_nest_3 = talent_nestArr[2]
                        let talent_nest_4 = talent_nestArr[3]
                        let talent_basket_nest_1 = talent_basket_nest[0]
                        let talent_basket_nest_2 = talent_basket_nest[1]
                        let talent_basket_nest_3 = talent_basket_nest[2]
                        let talent_basket_nest_4 = talent_basket_nest[3]
                        
                        self.imgArchetype1.image = UIImage(named: self.talentImages[Int(talent_nest_1)! - 1])
                        self.imgArchetype2.image = UIImage(named: self.talentImages[Int(talent_nest_2)! - 1])
                        self.imgArchetype3.image = UIImage(named: self.talentImages[Int(talent_nest_3)! - 1])
                        self.imgArchetype4.image = UIImage(named: self.talentImages[Int(talent_nest_4)! - 1])
                        
                        self.imgTM1.image = UIImage(named: self.modalityImages[Int(talent_basket_nest_1)! - 1])
                        self.imgTM2.image = UIImage(named: self.modalityImages[Int(talent_basket_nest_2)! - 1])
                        self.imgTM3.image = UIImage(named: self.modalityImages[Int(talent_basket_nest_3)! - 1])
                        self.imgTM4.image = UIImage(named: self.modalityImages[Int(talent_basket_nest_4)! - 1])
                               
                    } else {
                        print("Document does not exist")
                    }
                }
                break
            case 4:
                //get the users collect choices
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let collect_nest = document.get("collect_nest")  as! String
                        let collect_basket_nest = document.get("collect_basket_nest") as! String
                        let collect_nest_1 = collect_nest[0]
                        let collect_nest_2 = collect_nest[1]
                        let collect_nest_3 = collect_nest[2]
                        let collect_nest_4 = collect_nest[3]
                        let collect_basket_nest_1 = collect_basket_nest[0]
                        let collect_basket_nest_2 = collect_basket_nest[1]
                        let collect_basket_nest_3 = collect_basket_nest[2]
                        let collect_basket_nest_4 = collect_basket_nest[3]
                        
                        self.imgArchetype1.image = UIImage(named: self.collectImages[Int(collect_nest_1)! - 1])
                        self.imgArchetype2.image = UIImage(named: self.collectImages[Int(collect_nest_2)! - 1])
                        self.imgArchetype3.image = UIImage(named: self.collectImages[Int(collect_nest_3)! - 1])
                        self.imgArchetype4.image = UIImage(named: self.collectImages[Int(collect_nest_4)! - 1])
                        
                        self.imgTM1.image = UIImage(named: self.modalityImages[Int(collect_basket_nest_1)! - 1])
                        self.imgTM2.image = UIImage(named: self.modalityImages[Int(collect_basket_nest_2)! - 1])
                        self.imgTM3.image = UIImage(named: self.modalityImages[Int(collect_basket_nest_3)! - 1])
                        self.imgTM4.image = UIImage(named: self.modalityImages[Int(collect_basket_nest_4)! - 1])
                               
                    } else {
                        print("Document does not exist")
                    }
                }
                break
            default:
                break
        }
    }
    
    func restartArchetype(){
        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
        switch mixoState{
            case 1:
                docRef.updateData([
                    "role": "incomplete",
                    "role_basket_nest": "incomplete",
                    "role_done": "N",
                    "role_img1": "incomplete",
                    "role_img2": "incomplete",
                    "role_img3": "incomplete",
                    "role_img4": "incomplete",
                    "role_nest": "incomplete",
                    "role_sub": "incomplete",
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //data saved
                        self.present(mixoScene1VC, animated:true, completion:nil)
                    }
                }
                break
            case 3:
                docRef.updateData([
                    "talent": "incomplete",
                    "talent_basket_nest": "incomplete",
                    "talent_done": "N",
                    "talent_img1": "incomplete",
                    "talent_img2": "incomplete",
                    "talent_img3": "incomplete",
                    "talent_img4": "incomplete",
                    "talent_nest": "incomplete",
                    "talent_sub": "incomplete",
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //data saved...
                        self.present(mixoScene1VC, animated:true, completion:nil)
                    }
                }
                break
            case 4:
                docRef.updateData([
                    "collect": "incomplete",
                    "collect_basket_nest": "incomplete",
                    "collect_done": "N",
                    "collect_img1": "incomplete",
                    "collect_img2": "incomplete",
                    "collect_img3": "incomplete",
                    "collect_img4": "incomplete",
                    "collect_nest": "incomplete",
                    "collect_sub": "incomplete",
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //data saved...
                        self.present(mixoScene1VC, animated:true, completion:nil)
                    }
                }
                break
            default:
                break
        }
    }
    
    func nextArchetype(){
        let mixoScene5VC = mainSB.instantiateViewController(withIdentifier: "MixoScene5VC") as! MixoScene5VC
//        switch mixoState{
//            case 1:
//                self.present(mixoScene5VC, animated:true, completion:nil)
//                break
//            case 3:
//                self.present(mixoScene5VC, animated:true, completion:nil)
//                break
//            case 4:
//                self.present(mixoScene5VC, animated:true, completion:nil)
//                break
//            default:
//                break
//        }
//    }
        
            let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
            switch mixoState{
                case 1:
                    mixoState+=1;
                    self.present(mixoScene1VC, animated:true, completion:nil)
                    break
                case 3:
                    mixoState+=1;
                    self.present(mixoScene1VC, animated:true, completion:nil)
                    break
                case 4:
                    mixoState+=1;
                    self.present(mixoScene5VC, animated:true, completion:nil)
                    break
                default:
                    break
            }
        }

}
