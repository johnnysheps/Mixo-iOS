//
//  MixoScene5VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MixoScene5VC: UIViewController {

    @IBOutlet weak var btnHeroNav: UIButton!
    @IBOutlet weak var btnIntelNav: UIButton!
    @IBOutlet weak var btnTalNav: UIButton!
    @IBOutlet weak var btnColNav: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //the 4 mixos that make up the user mixotype
    @IBOutlet weak var imgMixo1: UIImageView!
    @IBOutlet weak var imgMixo2: UIImageView!
    @IBOutlet weak var imgMixo3: UIImageView!
    @IBOutlet weak var imgMixo4: UIImageView!
    
    //mixo1 shells
    @IBOutlet weak var imgM1TLC: UIImageView!
    @IBOutlet weak var imgM1TRC: UIImageView!
    @IBOutlet weak var imgM1BLC: UIImageView!
    @IBOutlet weak var imgM1BRC: UIImageView!
       
    //mixo2 shells
    @IBOutlet weak var imgM2TLC: UIImageView!
    @IBOutlet weak var imgM2TRC: UIImageView!
    @IBOutlet weak var imgM2BLC: UIImageView!
    @IBOutlet weak var imgM2BRC: UIImageView!
    
    //mixo3 shells
    @IBOutlet weak var imgM3TLC: UIImageView!
    @IBOutlet weak var imgM3TRC: UIImageView!
    @IBOutlet weak var imgM3BLC: UIImageView!
    @IBOutlet weak var imgM3BRC: UIImageView!
    
    //mixo4 shells
    @IBOutlet weak var imgM4TLC: UIImageView!
    @IBOutlet weak var imgM4TRC: UIImageView!
    @IBOutlet weak var imgM4BLC: UIImageView!
    @IBOutlet weak var imgM4BRC: UIImageView!
    
    
    @IBOutlet weak var btnResults: UIButton!
    @IBOutlet weak var btnRestart: UIButton!
    @IBOutlet weak var btnComplete: UIButton!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var navHolder: UIStackView!
    
    @IBOutlet weak var lblTitleConstraint: NSLayoutConstraint!
    var heroImages: [String] = [] //array that holds the heroes
    var intelImages: [String] = [] //array that holds the intels
    var talentImages: [String] = []//array that holds the talents
    var collectImages: [String] = []//array that holds the collections
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mixoState+=1;
//        let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
//        self.present(mixoScene1VC, animated:true, completion:nil)

        //heroes
        heroImages.append("actornb")
        heroImages.append("leadernb")
        heroImages.append("philosophernb")
        heroImages.append("athletenb")
        heroImages.append("musiciannb")
        heroImages.append("scientistnb")
        heroImages.append("designernb")
        heroImages.append("naturalistnb")
        heroImages.append("selfreflectornb")
        
        //intels
        intelImages.append("verbalnb")
        intelImages.append("naturalisticnb")
        intelImages.append("interpersonalnb")
        intelImages.append("logicalnb")
        intelImages.append("bodilynb")
        intelImages.append("intrapersonalnb")
        intelImages.append("musicalnb")
        intelImages.append("visualnb")
        intelImages.append("existentialnb")
        
        //talents
        talentImages.append("v1img1nb") //Verbal - 1 - [0]
        talentImages.append("v1img2nb") //Verbal - 2 - [1]
        talentImages.append("v1img3nb") //Verbal - 3 - [2]
        talentImages.append("v1img4nb") //Verbal - 4 - [3]
        talentImages.append("nimg1nb") //Naturalistic - 5 - [4]
        talentImages.append("nimg2nb") //Naturalistic - 6 - [5]
        talentImages.append("nimg3nb") //Naturalistic - 7 - [6]
        talentImages.append("nimg4nb") //Naturalistic - 8 - [7]
        talentImages.append("i1img1nb") //Interpersonal - 9 - [8]
        talentImages.append("i1img2nb") //Interpersonal - 10 - [9]
        talentImages.append("i1img3nb") //Interpersonal - 11 - [10]
        talentImages.append("i1img4nb") //Interpersonal - 12 - [11]
        talentImages.append("limg1nb") //Logical - 13 - [12]
        talentImages.append("limg2nb") //Logical - 14 - [13]
        talentImages.append("limg3nb") //Logical - 15 - [14]
        talentImages.append("limg4nb") //Logical - 16 - [15]
        talentImages.append("bimg1nb") //Bodily - 17 - [16]
        talentImages.append("bimg2nb") //Bodily - 18 - [17]
        talentImages.append("bimg3nb") //Bodily - 19 - [18]
        talentImages.append("bimg4nb") //Bodily - 20 - [19]
        talentImages.append("i2img1nb") //Intrapersonal - 21 - [20]
        talentImages.append("i2img2nb") //Intrapersonal - 22 - [21]
        talentImages.append("i2img3nb") //Intrapersonal - 23 - [22]
        talentImages.append("i2img4nb") //Intrapersonal - 24 - [23]
        talentImages.append("mimg1nb") //Musical - 25 - [24]
        talentImages.append("mimg2nb") //Musical - 26 - [25]
        talentImages.append("mimg3nb") //Musical - 27 - [26]
        talentImages.append("mimg4nb") //Musical - 28 - [27]
        talentImages.append("v2img1nb") //Visual - 29 - [28]
        talentImages.append("v2img2nb") //Visual - 30 - [29]
        talentImages.append("v2img3nb") //Visual - 31 - [30]
        talentImages.append("v2img4nb") //Visual - 32 - [31]
        talentImages.append("eimg1nb") //Existential - 33 - [32]
        talentImages.append("eimg2nb") //Existential - 34 - [33]
        talentImages.append("eimg3nb") //Existential - 35 - [34]
        talentImages.append("eimg4nb") //Existential - 36 - [35]
        
        //collecitons
        collectImages.append("socialactivitiesnb")
        collectImages.append("musicnb")
        collectImages.append("heirloomsnb")
        collectImages.append("fitnessnb")
        collectImages.append("aestheticsnb")
        collectImages.append("naturenb")
        collectImages.append("technologynb")
        collectImages.append("theatricalnb")
        collectImages.append("selfimprovementnb")
        
        Utilities.colorizeNavTabs(btnHeroNav,btnIntelNav,btnTalNav,btnColNav)
        setUpUI()
        getUserData()
        progress()
        
        //print("mixoState: " ,  mixoState)
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

    }
    
    func getUserData(){
        //get the users choices
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {

                //check the users dones
                guard let roleDone = document.get("role_done") as? String else {return}
                guard let intelDone = document.get("intel_done") as? String else {return}
                guard let talentDone = document.get("talent_done") as? String else {return}
                guard let collectDone = document.get("collect_done") as? String else {return}
                

                //heroes
                if roleDone == "Y"{
                    //get the users hero data
                    guard let role_nest = document.get("role_nest")  as? String else {return}
                    guard let role_basket_nest = document.get("role_basket_nest") as? String else {return}
                    
                    let role_nest_1 = role_nest[0]
                    let role_basket_nest_1 = role_basket_nest[0]
                    let role_basket_nest_2 = role_basket_nest[1]
                    let role_basket_nest_3 = role_basket_nest[2]
                    let role_basket_nest_4 = role_basket_nest[3]

                    print(role_nest_1)
                    //set mixo1 to the first hero choice
                    self.imgMixo1.image = UIImage(named: self.heroImages[Int(role_nest_1)! - 1])

                    //set the corners
                    //tlc
                    switch role_basket_nest_1{
                        case "1":
                            self.imgM1TLC.image = UIImage(named: "ktlc")
                            break
                        case "2":
                            self.imgM1TLC.image = UIImage(named: "wtlc")
                            break
                        case "3":
                            self.imgM1TLC.image = UIImage(named: "mtlc")
                            break
                        case "4":
                            self.imgM1TLC.image = UIImage(named: "ltlc")
                            break
                        default:
                            break
                    }

                    //trc
                    switch role_basket_nest_2{
                        case "1":
                            self.imgM1TRC.image = UIImage(named: "ktrc")
                            break
                        case "2":
                            self.imgM1TRC.image = UIImage(named: "wtrc")
                            break
                        case "3":
                            self.imgM1TRC.image = UIImage(named: "mtrc")
                            break
                        case "4":
                            self.imgM1TRC.image = UIImage(named: "ltrc")
                            break
                        default:
                            break
                    }

                    //blc
                    switch role_basket_nest_3{
                        case "1":
                            self.imgM1BLC.image = UIImage(named: "kblc")
                            break
                        case "2":
                            self.imgM1BLC.image = UIImage(named: "wblc")
                            break
                        case "3":
                            self.imgM1BLC.image = UIImage(named: "mblc")
                            break
                        case "4":
                            self.imgM1BLC.image = UIImage(named: "lblc")
                            break
                        default:
                            break
                    }

                    //brc
                    switch role_basket_nest_4{
                        case "1":
                            self.imgM1BRC.image = UIImage(named: "kbrc")
                            break
                        case "2":
                            self.imgM1BRC.image = UIImage(named: "wbrc")
                            break
                        case "3":
                            self.imgM1BRC.image = UIImage(named: "mbrc")
                            break
                        case "4":
                            self.imgM1BRC.image = UIImage(named: "lbrc")
                            break
                        default:
                            break
                    }
                }

                //intels
                if intelDone == "Y"{
                    //get the users intel data
                    guard let intel_nest = document.get("intel_nest")  as? String else {return}
                    let intel_nest_1 = intel_nest[0]
                    let intel_nest_2 = intel_nest[1]
                    let intel_nest_3 = intel_nest[2]
                    let intel_nest_4 = intel_nest[3]

                    //set mixo2 to the first intel choice
                    self.imgMixo2.image = UIImage(named: self.intelImages[Int(intel_nest_1)! - 1])

                    //set the corners
                    //tlc
                    switch intel_nest_1{
                        case "1":
                            self.imgM2TLC.image = UIImage(named: "verbaltlc")
                            break
                        case "2":
                            self.imgM2TLC.image = UIImage(named: "naturalistictlc")
                            break
                        case "3":
                            self.imgM2TLC.image = UIImage(named: "interpersonaltlc")
                            break
                        case "4":
                            self.imgM2TLC.image = UIImage(named: "ilogicaltlc")
                            break
                        case "5":
                            self.imgM2TLC.image = UIImage(named: "bodilytlc")
                            break
                        case "6":
                            self.imgM2TLC.image = UIImage(named: "intrapersonaltlc")
                            break
                        case "7":
                            self.imgM2TLC.image = UIImage(named: "musicaltlc")
                            break
                        case "8":
                            self.imgM2TLC.image = UIImage(named: "visualtlc")
                            break
                        case "9":
                            self.imgM2TLC.image = UIImage(named: "existentialtlc")
                            break
                        default:
                            break
                    }

                    //trc
                    switch intel_nest_2{
                        case "1":
                            self.imgM2TRC.image = UIImage(named: "verbaltrc")
                            break
                        case "2":
                            self.imgM2TRC.image = UIImage(named: "naturalistictrc")
                            break
                        case "3":
                            self.imgM2TRC.image = UIImage(named: "interpersonaltrc")
                            break
                        case "4":
                            self.imgM2TRC.image = UIImage(named: "ilogicaltrc")
                            break
                        case "5":
                            self.imgM2TRC.image = UIImage(named: "bodilytrc")
                            break
                        case "6":
                            self.imgM2TRC.image = UIImage(named: "intrapersonaltrc")
                            break
                        case "7":
                            self.imgM2TRC.image = UIImage(named: "musicaltrc")
                            break
                        case "8":
                            self.imgM2TRC.image = UIImage(named: "visualtrc")
                            break
                        case "9":
                            self.imgM2TRC.image = UIImage(named: "existentialtrc")
                            break
                        default:
                            break
                    }

                    //blc
                    switch intel_nest_3{
                        case "1":
                            self.imgM2BLC.image = UIImage(named: "verbalblc")
                            break
                        case "2":
                            self.imgM2BLC.image = UIImage(named: "naturalisticblc")
                            break
                        case "3":
                            self.imgM2BLC.image = UIImage(named: "interpersonalblc")
                            break
                        case "4":
                            self.imgM2BLC.image = UIImage(named: "ilogicalblc")
                            break
                        case "5":
                            self.imgM2BLC.image = UIImage(named: "bodilyblc")
                            break
                        case "6":
                            self.imgM2BLC.image = UIImage(named: "intrapersonalblc")
                            break
                        case "7":
                            self.imgM2BLC.image = UIImage(named: "musicalblc")
                            break
                        case "8":
                            self.imgM2BLC.image = UIImage(named: "visualblc")
                            break
                        case "9":
                            self.imgM2BLC.image = UIImage(named: "existentialblc")
                            break
                        default:
                            break
                    }

                    //brc
                    switch intel_nest_4{
                        case "1":
                            self.imgM2BRC.image = UIImage(named: "verbalbrc")
                            break
                        case "2":
                            self.imgM2BRC.image = UIImage(named: "naturalisticbrc")
                            break
                        case "3":
                            self.imgM2BRC.image = UIImage(named: "interpersonalbrc")
                            break
                        case "4":
                            self.imgM2BRC.image = UIImage(named: "ilogicalbrc")
                            break
                        case "5":
                            self.imgM2BRC.image = UIImage(named: "bodilybrc")
                            break
                        case "6":
                            self.imgM2BRC.image = UIImage(named: "intrapersonalbrc")
                            break
                        case "7":
                            self.imgM2BRC.image = UIImage(named: "musicalbrc")
                            break
                        case "8":
                            self.imgM2BRC.image = UIImage(named: "visualbrc")
                            break
                        case "9":
                            self.imgM2BRC.image = UIImage(named: "existentialbrc")
                            break
                        default:
                            break
                    }
                }

                //talents
                if talentDone == "Y"{
                    //get the users talent choices
                    guard let talent_nest = document.get("talent_nest")  as? String else {return}
                    guard let talent_basket_nest = document.get("talent_basket_nest") as? String else {return}
                    let talent_nestArr = talent_nest.components(separatedBy: "_")
                    let talent_nest_1 = talent_nestArr[0]
                    let talent_basket_nest_1 = talent_basket_nest[0]
                    let talent_basket_nest_2 = talent_basket_nest[1]
                    let talent_basket_nest_3 = talent_basket_nest[2]
                    let talent_basket_nest_4 = talent_basket_nest[3]

                    //set mixo3 to the first talent choice
                    self.imgMixo3.image = UIImage(named: self.talentImages[Int(talent_nest_1)! - 1])

                    //set the corners
                        //tlc
                        switch talent_basket_nest_1{
                            case "1":
                                self.imgM3TLC.image = UIImage(named: "physicaltlc")
                                break
                            case "2":
                                self.imgM3TLC.image = UIImage(named: "spiritualtlc")
                                break
                            case "3":
                                self.imgM3TLC.image = UIImage(named: "logicaltlc")
                                break
                            case "4":
                                self.imgM3TLC.image = UIImage(named: "creativetlc")
                                break
                            default:
                                break
                        }

                        //trc
                        switch talent_basket_nest_2{
                            case "1":
                                self.imgM3TRC.image = UIImage(named: "physicaltrc")
                                break
                            case "2":
                                self.imgM3TRC.image = UIImage(named: "spiritualtrc")
                                break
                            case "3":
                                self.imgM3TRC.image = UIImage(named: "logicaltrc")
                                break
                            case "4":
                                self.imgM3TRC.image = UIImage(named: "creativetrc")
                                break
                            default:
                                break
                        }

                        //blc
                        switch talent_basket_nest_3{
                            case "1":
                                self.imgM3BLC.image = UIImage(named: "physicalblc")
                                break
                            case "2":
                                self.imgM3BLC.image = UIImage(named: "spiritualblc")
                                break
                            case "3":
                                self.imgM3BLC.image = UIImage(named: "logicalblc")
                                break
                            case "4":
                                self.imgM3BLC.image = UIImage(named: "creativeblc")
                                break
                            default:
                                break
                        }

                        //brc
                        switch talent_basket_nest_4{
                            case "1":
                                self.imgM3BRC.image = UIImage(named: "physicalbrc")
                                break
                            case "2":
                                self.imgM3BRC.image = UIImage(named: "spiritualbrc")
                                break
                            case "3":
                                self.imgM3BRC.image = UIImage(named: "logicalbrc")
                                break
                            case "4":
                                self.imgM3BRC.image = UIImage(named: "creativebrc")
                                break
                            default:
                                break
                        }
                    }

                //collections
                if collectDone == "Y"{
                    //get the users collection choices
                    guard let collect_nest = document.get("collect_nest") as? String else {return}
                    guard let collect_basket_nest = document.get("collect_basket_nest") as? String else {return}
                    let collect_nest_1 = collect_nest[0]
                    let collect_basket_nest_1 = collect_basket_nest[0]
                    let collect_basket_nest_2 = collect_basket_nest[1]
                    let collect_basket_nest_3 = collect_basket_nest[2]
                    let collect_basket_nest_4 = collect_basket_nest[3]

                    //set mixo4 to the first collection choice
                    self.imgMixo4.image = UIImage(named: self.collectImages[Int(collect_nest_1)! - 1])

                    //set the corners
                        //tlc
                        switch collect_basket_nest_1{
                            case "1":
                                self.imgM4TLC.image = UIImage(named: "physicaltlc")
                                break
                            case "2":
                                self.imgM4TLC.image = UIImage(named: "spiritualtlc")
                                break
                            case "3":
                                self.imgM4TLC.image = UIImage(named: "logicaltlc")
                                break
                            case "4":
                                self.imgM4TLC.image = UIImage(named: "creativetlc")
                                break
                            default:
                                break
                        }

                        //trc
                        switch collect_basket_nest_2{
                            case "1":
                                self.imgM4TRC.image = UIImage(named: "physicaltrc")
                                break
                            case "2":
                                self.imgM4TRC.image = UIImage(named: "spiritualtrc")
                                break
                            case "3":
                                self.imgM4TRC.image = UIImage(named: "logicaltrc")
                                break
                            case "4":
                                self.imgM4TRC.image = UIImage(named: "creativetrc")
                                break
                            default:
                                break
                        }

                        //brc
                        switch collect_basket_nest_3{
                            case "1":
                                self.imgM4BLC.image = UIImage(named: "physicalblc")
                                break
                            case "2":
                                self.imgM4BLC.image = UIImage(named: "spiritualblc")
                                break
                            case "3":
                                self.imgM4BLC.image = UIImage(named: "logicalblc")
                                break
                            case "4":
                                self.imgM4BLC.image = UIImage(named: "creativeblc")
                                break
                            default:
                                break
                        }

                        //blc
                        switch collect_basket_nest_4{
                            case "1":
                                self.imgM4BRC.image = UIImage(named: "physicalbrc")
                                break
                            case "2":
                                self.imgM4BRC.image = UIImage(named: "spiritualbrc")
                                break
                            case "3":
                                self.imgM4BRC.image = UIImage(named: "logicalbrc")
                                break
                            case "4":
                                self.imgM4BRC.image = UIImage(named: "creativebrc")
                                break
                            default:
                                break
                        }
                }

            } else {
                print("Document does not exist")
            }
        }
    }
    
    
    @IBAction func btnResults(_ sender: Any) {
        // Modally:
        let resultsVC = mainSB.instantiateViewController(withIdentifier: "ResultsVC") as! ResultsVC
        resultsVC.previousScreen = {
            self.dismiss(animated:true, completion: nil );
        }
        self.present(resultsVC, animated:true, completion:nil)
        
//        let parentViewContainsChild = ResultsVC();
//        parentViewContainsChild.previousScreen = {
//            parentViewContainsChild.willMove(toParent: nil)
//            parentViewContainsChild.view.removeFromSuperview()
//            parentViewContainsChild.removeFromParent()
//        }
//
//        self.addChild(parentViewContainsChild)
//        self.view.addSubview(parentViewContainsChild.view)
//        parentViewContainsChild.didMove(toParent: self)
    }
    
    @IBAction func btnRestart(_ sender: Any) {
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
            "intel": "incomplete",
            "intel_done": "N",
            "intel_img1": "incomplete",
            "intel_img2": "incomplete",
            "intel_img3": "incomplete",
            "intel_img4": "incomplete",
            "intel_nest": "incomplete",
            "intel_sub": "incomplete",
            "talent": "incomplete",
            "talent_basket_nest": "incomplete",
            "talent_done": "N",
            "talent_img1": "incomplete",
            "talent_img2": "incomplete",
            "talent_img3": "incomplete",
            "talent_img4": "incomplete",
            "talent_nest": "incomplete",
            "talent_sub": "incomplete",
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
                //data saved
                restarted = 1
                mixoState = 1
                let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
                self.present(mixoScene1VC, animated:true, completion:nil)
            }
        }
    }

    @IBAction func btnComplete(_ sender: Any) {
        //proceed to the Profile Creation Scenes
        let profileScene1NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene1NVC") as! ProfileScene1NVC
        self.present(profileScene1NVC, animated:true, completion:nil)
    }
    
    
}
