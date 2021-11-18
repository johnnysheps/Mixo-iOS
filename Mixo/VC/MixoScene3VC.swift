//
//  MixoScene3VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import Firebase

struct TM : Decodable {
    let title: String
    let text: String
    let image: String
}

var tm1Title = String()
var tm1Text = String()
var tm1Image = String()
var tm2Title = String()
var tm2Text = String()
var tm2Image = String()
var tm3Title = String()
var tm3Text = String()
var tm3Image = String()
var tm4Title = String()
var tm4Text = String()
var tm4Image = String()
var alertType = String() // for temps and mods


@available(iOS 13.0, *)
class MixoScene3VC: UIViewController {

    var tmState: [String] = [] //temporary holder for each temperament choice
    var finalState: [String] = [] //temporary holder for each temperament choice
    var choiceState: [Int] = [] //array that holds the role_basket_nest
    var heroImages: [String] = [] //array that holds the role_basket_nest
    var talentImages: [String] = [] //array that holds the role_basket_nest
    var collectImages: [String] = [] //array that holds the role_basket_nest
    var temperamentImages: [String] = [] //array that holds the temperaments
    var modalityImages: [String] = [] //array that holds the modalities
    var talentNames: [String] = []//array to hold the names of each Talent
    var collectNames: [String] = []//array to hold the names of each Collections
    
    var archStep = Int()
    var tmTapped = String()
    var role1 = String()
    var role2 = String()
    var role3 = String()
    var role4 = String()
    var talent1 = String()
    var talent2 = String()
    var talent3 = String()
    var talent4 = String()
    var collect1 = String()
    var collect2 = String()
    var collect3 = String()
    var collect4 = String()
    var intelDone = String()
    
    @IBOutlet weak var btnHeroNav: UIButton!
    @IBOutlet weak var btnIntelNav: UIButton!
    @IBOutlet weak var btnTalNav: UIButton!
    @IBOutlet weak var btnColNav: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var lblArchText1: UILabel!
    @IBOutlet weak var lblArchText2: UILabel!
    
    @IBOutlet weak var imgArchetype: UIImageView!
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnArchTM1: UIButton!
    @IBOutlet weak var btnArchTM2: UIButton!
    @IBOutlet weak var btnArchTM3: UIButton!
    @IBOutlet weak var btnArchTM4: UIButton!
    @IBOutlet weak var btnTMDefs: UIButton!
    
    @IBOutlet weak var imgCheck1: UIImageView!
    @IBOutlet weak var imgCheck2: UIImageView!
    @IBOutlet weak var imgCheck3: UIImageView!
    @IBOutlet weak var imgCheck4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgCheck1.isHidden = true
        imgCheck2.isHidden = true
        imgCheck3.isHidden = true
        imgCheck4.isHidden = true
        
        btnNext.isHidden = true
        
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
    
    func getUserData(){
        //get the users hero choices
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                    
                //see which phase the user is in
                switch(mixoState){
                case 1:
                    let role_nest = document.get("role_nest")  as! String
                    self.role1 = role_nest[0]
                    self.role2 = role_nest[1]
                    self.role3 = role_nest[2]
                    self.role4 = role_nest[3]
                    self.lblArchText1.text = "For each Hero you chose, assign a Temperament that best describes what that Hero is to you."
                    self.lblArchText2.text = "My Hero is a ________(choose one):"
                    self.imgArchetype.image = UIImage(named: self.heroImages[Int(self.role1)! - 1])
                    self.btnArchTM1.setImage(UIImage(named: self.temperamentImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM2.setImage(UIImage(named: self.temperamentImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM3.setImage(UIImage(named: self.temperamentImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM4.setImage(UIImage(named: self.temperamentImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.archStep = 1
                    break
                case 3:
                    let talent_nest = document.get("talent_nest")  as! String
                    let talent_nestArr = talent_nest.components(separatedBy: "_")
                    self.talent1 = talent_nestArr[0]
                    self.talent2 = talent_nestArr[1]
                    self.talent3 = talent_nestArr[2]
                    self.talent4 = talent_nestArr[3]
                    self.lblArchText1.text = "For each Talent you chose, assign a Modality that you most associate with that Talent."
                    self.lblArchText2.text = "For me, (talent) is ________(choose one):"
                    self.imgArchetype.image = UIImage(named: self.talentImages[Int(self.talent1)! - 1])
                    self.btnArchTM1.setImage(UIImage(named: self.modalityImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM2.setImage(UIImage(named: self.modalityImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM3.setImage(UIImage(named: self.modalityImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM4.setImage(UIImage(named: self.modalityImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.archStep = 1
                    break
                case 4:
                    let collect_nest = document.get("collect_nest")  as! String
                    self.collect1 = collect_nest[0]
                    self.collect2 = collect_nest[1]
                    self.collect3 = collect_nest[2]
                    self.collect4 = collect_nest[3]
                    self.lblArchText1.text = "For each Collection you chose, assign a Modality that you most associate with that Collection."
                    self.lblArchText2.text = "For me, (collection) is ________(choose one):"
                    self.imgArchetype.image = UIImage(named: self.collectImages[Int(self.collect1)! - 1])
                    self.btnArchTM1.setImage(UIImage(named: self.modalityImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM2.setImage(UIImage(named: self.modalityImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM3.setImage(UIImage(named: self.modalityImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.btnArchTM4.setImage(UIImage(named: self.modalityImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self.archStep = 1
                    break
                default:
                    break
                }
                    
            } else {
                print("Document does not exist")
            }
        }
    }
    
    //function to set up the UI
    func setUpUI() {
        
        switch mixoState{
            case 1:
                Utilities.styleGreyFilledButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyOutlinedButton(btnTalNav)
                Utilities.styleGreyOutlinedButton(btnColNav)
                btnTMDefs.setTitle("Temperament Definitions", for: .normal)
                break
            case 3:
                Utilities.styleGreyOutlinedButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyFilledButton(btnTalNav)
                Utilities.styleGreyOutlinedButton(btnColNav)
                self.btnTMDefs.setTitle("Modality Definitions", for: .normal)
                break
            case 4:
                Utilities.styleGreyOutlinedButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyOutlinedButton(btnTalNav)
                Utilities.styleGreyFilledButton(btnColNav)
                self.btnTMDefs.setTitle("Modality Definitions", for: .normal)
                break
            default:
                break
        }
        
        Utilities.styleGreyFilledButton(btnNext)
        Utilities.styleGreyFilledRoundedButton(btnTMDefs)
        
    }
    
    func nextStep(){
        switch(mixoState){
            case 1:
                //heroes
                switch(archStep){
                    case 1:
                        btnNext.isHidden = true
                        archStep = 2
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.heroImages[Int(role2)! - 1])
                        break
                    case 2:
                        btnNext.isHidden = true
                        archStep = 3
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.heroImages[Int(role3)! - 1])
                        break
                    case 3:
                        btnNext.isHidden = true
                        archStep = 4
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.heroImages[Int(role4)! - 1])
                        break
                    case 4:
                        saveData()
                        break
                    default:
                        break
                }
                break
            case 3:
                //talents
                switch(archStep){
                    case 1:
                        btnNext.isHidden = true
                        archStep = 2
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.talentImages[Int(talent2)! - 1])
                        break
                    case 2:
                        btnNext.isHidden = true
                        archStep = 3
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.talentImages[Int(talent3)! - 1])
                        break
                    case 3:
                        btnNext.isHidden = true
                        archStep = 4
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.talentImages[Int(talent4)! - 1])
                        break
                    case 4:
                        saveData()
                        break
                    default:
                        break
                }
                break
            case 4:
                //collections
                switch(archStep){
                    case 1:
                        btnNext.isHidden = true
                        archStep = 2
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.collectImages[Int(collect2)! - 1])
                        break
                    case 2:
                        btnNext.isHidden = true
                        archStep = 3
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.collectImages[Int(collect3)! - 1])
                        break
                    case 3:
                        btnNext.isHidden = true
                        archStep = 4
                        imgCheck1.isHidden = true
                        imgCheck2.isHidden = true
                        imgCheck3.isHidden = true
                        imgCheck4.isHidden = true
                        self.imgArchetype.image = UIImage(named: self.collectImages[Int(collect4)! - 1])
                        break
                    case 4:
                        saveData()
                        break
                    default:
                        break
                }
                break
            default:
                break
        }
        
    }
    
    func saveData(){
        switch mixoState {
            case 1:
                //gather all data to send to Firebase
                let first = tmState[0]
                let second = tmState[1]
                let third = tmState[2]
                let fourth = tmState[3]
                var role = String()
                
                switch(first) {
                    case "K1":
                        role = "K"
                        choiceState.append(1)
                        break
                    case "W1":
                        role = "W"
                        choiceState.append(2)
                        break
                    case "M1":
                        role = "M"
                        choiceState.append(3)
                        break
                    case "L1":
                        role = "L"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (second) {
                    case "K2":
                        role += "K"
                        choiceState.append(1)
                        break
                    case "W2":
                        role += "W"
                        choiceState.append(2)
                        break
                    case "M2":
                        role += "M"
                        choiceState.append(3)
                        break
                    case "L2":
                        role += "L"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (third) {
                    case "K3":
                        role += "K"
                        choiceState.append(1)
                        break
                    case "W3":
                        role += "W"
                        choiceState.append(2)
                        break
                    case "M3":
                        role += "M"
                        choiceState.append(3)
                        break
                    case "L3":
                        role += "L"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (fourth) {
                    case "K4":
                        role += "K"
                        choiceState.append(1)
                        break
                    case "W4":
                        role += "W"
                        choiceState.append(2)
                        break
                    case "M4":
                        role += "M"
                        choiceState.append(3)
                        break
                    case "L4":
                        role += "L"
                        choiceState.append(4)
                        break
                    default:
                        break
                }
                
                var role_basket_nest = String()
                for temp in choiceState {
                    role_basket_nest += String(temp)
                }
                
                let role_sub: String = String(findRole(role: role));
                
                //send data to Firebase
                docRef.updateData([
                    "role": role,
                    "role_basket_nest": role_basket_nest,
                    "role_sub": role_sub,
                    "role_done": "Y",
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //data saved...go to MixoScene4aVC
                        let mixoScene4aVC = mainSB.instantiateViewController(withIdentifier: "MixoScene4aVC") as! MixoScene4aVC
                        self.present(mixoScene4aVC, animated:true, completion:nil)
                    }
                }
                break
            case 3:
                //gather all data to send to Firebase
                let first = tmState[0]
                let second = tmState[1]
                let third = tmState[2]
                let fourth = tmState[3]
                var talent = String()
                
                switch(first) {
                    case "P1":
                        talent = "P"
                        choiceState.append(1)
                        break
                    case "S1":
                        talent = "S"
                        choiceState.append(2)
                        break
                    case "L1":
                        talent = "L"
                        choiceState.append(3)
                        break
                    case "C1":
                        talent = "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (second) {
                    case "P2":
                        talent += "P"
                        choiceState.append(1)
                        break
                    case "S2":
                        talent += "S"
                        choiceState.append(2)
                        break
                    case "L2":
                        talent += "L"
                        choiceState.append(3)
                        break
                    case "C2":
                        talent += "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (third) {
                    case "P3":
                        talent += "P"
                        choiceState.append(1)
                        break
                    case "S3":
                        talent += "S"
                        choiceState.append(2)
                        break
                    case "L3":
                        talent += "L"
                        choiceState.append(3)
                        break
                    case "C3":
                        talent += "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (fourth) {
                    case "P4":
                        talent += "P"
                        choiceState.append(1)
                        break
                    case "S4":
                        talent += "S"
                        choiceState.append(2)
                        break
                    case "L4":
                        talent += "L"
                        choiceState.append(3)
                        break
                    case "C4":
                        talent += "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }
                
                var talent_basket_nest = String()
                for mod in choiceState {
                    talent_basket_nest += String(mod)
                }
                
                let talent_sub: String = String(findTalent(talent: talent));
                
                //send data to Firebase
                docRef.updateData([
                    "talent": talent,
                    "talent_basket_nest": talent_basket_nest,
                    "talent_sub": talent_sub,
                    "talent_done": "Y",
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //data saved...go to MixoScene4aVC
                        let mixoScene4aVC = mainSB.instantiateViewController(withIdentifier: "MixoScene4aVC") as! MixoScene4aVC
                        self.present(mixoScene4aVC, animated:true, completion:nil)
                    }
                }
                break
            case 4:
                //gather all data to send to Firebase
                let first = tmState[0]
                let second = tmState[1]
                let third = tmState[2]
                let fourth = tmState[3]
                var collect = String()
                
                switch(first) {
                    case "P1":
                        collect = "P"
                        choiceState.append(1)
                        break
                    case "S1":
                        collect = "S"
                        choiceState.append(2)
                        break
                    case "L1":
                        collect = "L"
                        choiceState.append(3)
                        break
                    case "C1":
                        collect = "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (second) {
                    case "P2":
                        collect += "P"
                        choiceState.append(1)
                        break
                    case "S2":
                        collect += "S"
                        choiceState.append(2)
                        break
                    case "L2":
                        collect += "L"
                        choiceState.append(3)
                        break
                    case "C2":
                        collect += "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (third) {
                    case "P3":
                        collect += "P"
                        choiceState.append(1)
                        break
                    case "S3":
                        collect += "S"
                        choiceState.append(2)
                        break
                    case "L3":
                        collect += "L"
                        choiceState.append(3)
                        break
                    case "C3":
                        collect += "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }

                switch (fourth) {
                    case "P4":
                        collect += "P"
                        choiceState.append(1)
                        break
                    case "S4":
                        collect += "S"
                        choiceState.append(2)
                        break
                    case "L4":
                        collect += "L"
                        choiceState.append(3)
                        break
                    case "C4":
                        collect += "C"
                        choiceState.append(4)
                        break
                    default:
                        break
                }
                
                var collect_basket_nest = String()
                for mod in choiceState {
                    collect_basket_nest += String(mod)
                }
                
                let collect_sub: String = String(findCollect(collect: collect));
                
                //send data to Firebase
                docRef.updateData([
                    "collect": collect,
                    "collect_basket_nest": collect_basket_nest,
                    "collect_sub": collect_sub,
                    "collect_done": "Y",
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //data saved...go to MixoScene4aVC
                        let mixoScene4aVC = mainSB.instantiateViewController(withIdentifier: "MixoScene4aVC") as! MixoScene4aVC
                        self.present(mixoScene4aVC, animated:true, completion:nil)
                    }
                }
                break
            default:
                break
        }
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
    
        
    func tmTap(arch: Int){
        
        switch(mixoState){
            case 1:
                //Heroes
                
                //get the button tapped
                let tappedTM = arch
                
                //see what step in the temperaments the user is on
                switch(archStep){
                    case 1:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "K1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "W1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "M1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "L1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 2:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "K2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "W2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "M2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "L2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 3:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "K3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "W3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "M3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "L3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 4:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "K4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "W4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "M4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "L4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    default:
                        break
                }
                
                break
            case 3:
                //Talents
                
                //get the button tapped
                let tappedTM = arch
                
                //see what step in the modalities the user is on
                switch(archStep){
                    case 1:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 2:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 3:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 4:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    default:
                        break
                }
                break
            case 4:
                //Collections
                
                //get the button tapped
                let tappedTM = arch
                
                //see what step in the modalities the user is on
                switch(archStep){
                    case 1:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C1"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 2:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C2"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 3:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C3"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    case 4:
                        switch(tappedTM){
                            case 1:
                                tmTapped = "P4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck2.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck1.isHidden == true){
                                    //show the checkmark
                                    imgCheck1.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck1.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 2:
                                tmTapped = "S4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck3.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck2.isHidden == true){
                                    //show the checkmark
                                    imgCheck2.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck2.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 3:
                                tmTapped = "L4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck4.isHidden == false){
                                    //do nothing
                                } else if(imgCheck3.isHidden == true){
                                    //show the checkmark
                                    imgCheck3.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck3.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            case 4:
                                tmTapped = "C4"
                                print(tmTapped)
                                
                                //check if any other temperament was checked
                                if(imgCheck1.isHidden == false || imgCheck2.isHidden == false || imgCheck3.isHidden == false){
                                    //do nothing
                                } else if(imgCheck4.isHidden == true){
                                    //show the checkmark
                                    imgCheck4.isHidden = false
                                    
                                    //add temperament to array
                                    tmState.append(tmTapped)
                                    print(tmState, " on add")
                                    
                                    //show btnNext1
                                    btnNext.isHidden = false
                                } else {
                                    imgCheck4.isHidden = true
                                    tmState.removeLast()
                                    print(tmState, " on remove")
                                    btnNext.isHidden = true
                                }
                                break
                            default:
                                break
                        }
                        break
                    default:
                        break
                }
                break
            default:
                break
        }
    }
    
    @IBAction func btnArchTM1(_ sender: Any) {
        tmTap(arch: btnArchTM1.tag)
    }
    @IBAction func btnArchTM2(_ sender: Any) {
        tmTap(arch: btnArchTM2.tag)
    }
    @IBAction func btnArchTM3(_ sender: Any) {
        tmTap(arch: btnArchTM3.tag)
    }
    @IBAction func btnArchTM4(_ sender: Any) {
        tmTap(arch: btnArchTM4.tag)
    }
    @IBAction func btnTMDefs(_ sender: Any) {
        switch(mixoState){
            case 1:
                //get data from server
                
                let queryParams: [String: String] = [
                    "type": "temp"
                ]
                
                var urlComponents = URLComponents()
                urlComponents.scheme = "http"
                urlComponents.host = "mixotype.com"
                urlComponents.path = "/echo/app/tmdefios.php"
                urlComponents.setQueryItems(with: queryParams)
                let urlString = urlComponents.url?.absoluteString
                
                guard let url = URL(string: urlString!) else {return}
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    guard let data = data else { return }
                    
                    do {
                        let decoder = JSONDecoder()
                        let arch = try decoder.decode([TM].self, from: data)
                        tm1Title = arch[0].title
                        tm1Text = arch[0].text
                        tm1Image = arch[0].image
                        tm2Title = arch[1].title
                        tm2Text = arch[1].text
                        tm2Image = arch[1].image
                        tm3Title = arch[2].title
                        tm3Text = arch[2].text
                        tm3Image = arch[2].image
                        tm4Title = arch[3].title
                        tm4Text = arch[3].text
                        tm4Image = arch[3].image
                        //print(data)
                        
                        DispatchQueue.main.async {
                            
                            alertType = "temp"
                            let tempDefVC = tempDefSB.instantiateViewController(withIdentifier: "TMDefVC") as! TMDefVC
                            self.present(tempDefVC, animated:true, completion:nil)
                            
                        }
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                
                break
            case 3:
                //get data from server
                let queryParams: [String: String] = [
                    "type": "mod"
                ]
                
                var urlComponents = URLComponents()
                urlComponents.scheme = "http"
                urlComponents.host = "mixotype.com"
                urlComponents.path = "/echo/app/tmdefios.php"
                urlComponents.setQueryItems(with: queryParams)
                let urlString = urlComponents.url?.absoluteString
                
                guard let url = URL(string: urlString!) else {return}
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                   guard let data = data else { return }
                    
                    do {
                        let decoder = JSONDecoder()
                        let arch = try decoder.decode([TM].self, from: data)
                        tm1Title = arch[0].title
                        tm1Text = arch[0].text
                        tm1Image = arch[0].image
                        tm2Title = arch[1].title
                        tm2Text = arch[1].text
                        tm2Image = arch[1].image
                        tm3Title = arch[2].title
                        tm3Text = arch[2].text
                        tm3Image = arch[2].image
                        tm4Title = arch[3].title
                        tm4Text = arch[3].text
                        tm4Image = arch[3].image
                        
                        DispatchQueue.main.async {
                            
                            alertType = "mod"
                            let tempDefVC = tempDefSB.instantiateViewController(withIdentifier: "TMDefVC") as! TMDefVC
                            self.present(tempDefVC, animated:true, completion:nil)
                            
                        }
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                
                break
            case 4:
                //get data from server
                let queryParams: [String: String] = [
                    "type": "mod"
                ]
                
                var urlComponents = URLComponents()
                urlComponents.scheme = "http"
                urlComponents.host = "mixotype.com"
                urlComponents.path = "/echo/app/tmdefios.php"
                urlComponents.setQueryItems(with: queryParams)
                let urlString = urlComponents.url?.absoluteString
                
                guard let url = URL(string: urlString!) else {return}
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    
                    guard let data = data else { return }
                    
                    do {
                        let decoder = JSONDecoder()
                        let arch = try decoder.decode([TM].self, from: data)
                        tm1Title = arch[0].title
                        tm1Text = arch[0].text
                        tm1Image = arch[0].image
                        tm2Title = arch[1].title
                        tm2Text = arch[1].text
                        tm2Image = arch[1].image
                        tm3Title = arch[2].title
                        tm3Text = arch[2].text
                        tm3Image = arch[2].image
                        tm4Title = arch[3].title
                        tm4Text = arch[3].text
                        tm4Image = arch[3].image
                        
                        DispatchQueue.main.async {
                            
                            alertType = "mod"
                            let tempDefVC = tempDefSB.instantiateViewController(withIdentifier: "TMDefVC") as! TMDefVC
                            self.present(tempDefVC, animated:true, completion:nil)
                            
                        }
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                
                break
            default:
                break
        }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        nextStep()
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
    
}



func findRole(role: String) -> Int{
    var roleSub: Int = 0
    let roleArray: [String] = [
        "KKKK", "KKKW", "KKKM", "KKKL", "KKWK", "KKWW", "KKWM", "KKWL", "KKMK", "KKMW", "KKMM", "KKML", "KKLW", "KKLM", "KKLL", "KWKK", "KWKW", "KWKM", "KWKL", "KWWK",
        "KWWW", "KWWM", "KWWL", "KWMK", "KWMK", "KWMW", "KWMM", "KWML", "KWLK", "KWLW", "KWLM", "KWLL", "KMKK", "KMKW", "KMKM", "KMKL", "KMWK", "KMWW", "KMWM", "KMWL",
        "KMMK", "KMMW", "KMMM", "KMML", "KMLK", "KMLW", "KMLM", "KMLL", "KLKK", "KLKW", "KLKM", "KLKL", "KLWK", "KLWW", "KLWM", "KLWL", "KLMK", "KLMW", "KLMM", "KLML",
        "KLLK", "KLLW", "KLLM", "KLLL", "WKKK", "WKKW", "WKKM", "WKKL", "WKWK", "WKWW", "WKWM", "WKWL", "WKMK", "WKMW", "WKMM", "WKML", "WKLK", "WKLW", "WKLM", "WKLL",
        "WWKK", "WWKW", "WWKM", "WWKL", "WWWK", "WWWW", "WWWM", "WWWL", "WWMK", "WWMW", "WWMM", "WWML", "WWLK", "WWLW", "WWLM", "WWLL", "WMKK", "WMKW", "WMKM", "WMKL",
        "WMWK", "WMWW", "WMWM", "WMWL", "WMMK", "WMMW", "WMMM", "WMML", "WMLK", "WMLW", "WMLM", "WMLL", "WLKK", "WLKW", "WLKM", "WLKL", "WLWK", "WLWW", "WLWM", "WLWL",
        "WLMK", "WLMW", "WLMM", "WLML", "WLLK", "WLLW", "WLLM", "WLLL", "MKKK", "MKKW", "MKKM", "MKKL", "MKWK", "MKWW", "MKWM", "MKWL", "MKMK", "MKMW", "MKMM", "MKML",
        "MKLK", "MKLW", "MKLM", "MKLL", "MWKK", "MWKW", "MWKM", "MWKL", "MWWK", "MWWW", "MWWM", "MWWL", "MWMK", "MWMW", "MWMM", "MWML", "MWLK", "MWLW", "MWLM", "MWLL",
        "MMKK", "MMKW", "MMKM", "MMKL", "MMWK", "MMWW", "MMWM", "MMWL", "MMMK", "MMMW", "MMMM", "MMML", "MMLK", "MMLW", "MMLM", "MMLL", "MLKK", "MLKW", "MLKM", "MLKL",
        "MLWK", "MLWW", "MLWM", "MLWL", "MLMK", "MLMW", "MLMM", "MLML", "MLLK", "MLLW", "MLLM", "MLLL", "LKKK", "LKKW", "LKKM", "LKKL", "LKWK", "LKWW", "LKWM", "LKWL",
        "LKMK", "LKMW", "LKMM", "LKML", "LKLK", "LKLW", "LKLM", "LKLL", "LWKK", "LWKW", "LWKM", "LWKL", "LWWK", "LWWW", "LWWM", "LWWL", "LWMK", "LWMW", "LWMM", "LWML",
        "LWLK", "LWLW", "LWLM", "LWLL", "LMKK", "LMKW", "LMKM", "LMKL", "LMWK", "LMWW", "LMWM", "LMWL", "LMMK", "LMMW", "LMMM", "LMML", "LMLK", "LMLW", "LMLM", "LMLL",
        "LLKK", "LLKW", "LLKM", "LLKL", "LLWK", "LLWW", "LLWM", "LLWL", "LLMK", "LLMW", "LLMM", "LLML", "LLLK", "LLLW", "LLLM", "LLLL"
    ]
    
    for role in roleArray{
        if(roleArray.contains(role)){
            roleSub = roleArray.firstIndex(of: role)! + 1
        }
    }
    
    return roleSub
    
}

func findTalent(talent: String) -> Int{
    var talentSub: Int = 0
    let talentArray: [String] = [
        "PPPP", "PPPS", "PPPL", "PPPC", "PPSP", "PPSS", "PPSL", "PPSC", "PPLP", "PPLS", "PPLL", "PPLC", "PPCP", "PPCS", "PPCL", "PPCC", "PSPP", "PSPS", "PSPL", "PSPC", "PSSP", "PSSS", "PSSL", "PSSC", "PSLP", "PSLS", "PSLL", "PSLC", "PSCP", "PSCS", "PSCL", "PSCC", "PLPP", "PLPS", "PLPL", "PLPC", "PLSP", "PLSS", "PLSL", "PLSC", "PLLP", "PLLS", "PLLL", "PLLC", "PLCP", "PLCS", "PLCL", "PLCC", "PCPP", "PCPS", "PCPL", "PCPC", "PCSP", "PCSS", "PCSL", "PCSC", "PCLP", "PCLS", "PCLL", "PCLC", "PCCP", "PCCS", "PCCL", "PCCC", "SPPP", "SPPS", "SPPL", "SPPC", "SPSP", "SPSS", "SPSL", "SPSC", "SPLP", "SPLS", "SPLL", "SPLC", "SPCP", "SPCS", "SPCL", "SPCC", "SSPP", "SSPS", "SSPL", "SSPC", "SSSP", "SSSS", "SSSL", "SSSC", "SSLP", "SSLS", "SSLL", "SSLC", "SSCP", "SSCS", "SSCL", "SSCC", "SLPP", "SLPS", "SLPL", "SLPC", "SLSP", "SLSS", "SLSL", "SLSC", "SLLP", "SLLS", "SLLL", "SLLC", "SLCP", "SLCS", "SLCL", "SLCC", "SCPP", "SCPS", "SCPL", "SCPC", "SCSP", "SCSS", "SCSL", "SCSC", "SCLP", "SCLS", "SCLL", "SCLC", "SCCP", "SCCS", "SCCL", "SCCC", "LPPP", "LPPS", "LPPL", "LPPC", "LPSP", "LPSS", "LPSL", "LPSC", "LPLP", "LPLS", "LPLL", "LPLC", "LPCP", "LPCS", "LPCL", "LPCC", "LSPP", "LSPS", "LSPL", "LSPC", "LSSP", "LSSS", "LSSL", "LSSC", "LSLP", "LSLS", "LSLL", "LSLC", "LSCP", "LSCS", "LSCL", "LSCC", "LLPP", "LLPS", "LLPL", "LLPC", "LLSP", "LLSS", "LLSL", "LLSC", "LLLP", "LLLS", "LLLL", "LLLC", "LLCP", "LLCS", "LLCL", "LLCC", "LCPP", "LCPS", "LCPL", "LCPC", "LCSP", "LCSS", "LCSL", "LCSC", "LCLP", "LCLS", "LCLL", "LCLC", "LCCP", "LCCS", "LCCL", "LCCC", "CPPP", "CPPS", "CPPL", "CPPC", "CPSP", "CPSS", "CPSL", "CPSC", "CPLP", "CPLS", "CPLL", "CPLC", "CPCP", "CPCS", "CPCL", "CPCC", "CSPP", "CSPS", "CSPL", "CSPC", "CSSP", "CSSS", "CSSL", "CSSC", "CSLP", "CSLS", "CSLL", "CSLC", "CSCP", "CSCS", "CSCL", "CSCC", "CLPP", "CLPS", "CLPL", "CLPC", "CLSP", "CLSS", "CLSL", "CLSC", "CLLP", "CLLS", "CLLL", "CLLC", "CLCP", "CLCS", "CLCL", "CLCC", "CCPP", "CCPS", "CCPL", "CCPC", "CCSP", "CCSS", "CCSL", "CCSC", "CCLP", "CCLS", "CCLL", "CCLC", "CCCP", "CCCS", "CCCL", "CCCC"
    ]
    
    for talent in talentArray{
        if(talentArray.contains(talent)){
            talentSub = talentArray.firstIndex(of: talent)! + 1
        }
    }
    
    return talentSub
}

func findCollect(collect: String) -> Int{
    var collectSub: Int = 0
    let collectArray: [String] = [
    "PPPP", "PPPL", "PPPC", "PPPS", "PPLP", "PPLL", "PPLC", "PPLS", "PPCP", "PPCL", "PPCC", "PPCS", "PPSP", "PPSL", "PPSC", "PPSS", "PLPP", "PLPL", "PLPC", "PLPS", "PLLP", "PLLL", "PLLC", "PLLS", "PLCP", "PLCL", "PLCC", "PLCS", "PLSP", "PLSL", "PLSC", "PLSS", "PCPP", "PCPL", "PCPC", "PCPS", "PCLP", "PCLL", "PCLC", "PCLS", "PCCP", "PCCL", "PCCC", "PCCS", "PCSP", "PCSL", "PCSC", "PCSS", "PSPP", "PSPL", "PSPC", "PSPS", "PSLP", "PSLL", "PSLC", "PSLS", "PSCP", "PSCL", "PSCC", "PSCS", "PSSP", "PSSL", "PSSC", "PSSS", "LPPP", "LPPL", "LPPC", "LPPS", "LPLP", "LPLL", "LPLC", "LPLS", "LPCP", "LPCL", "LPCC", "LPCS", "LPSP", "LPSL", "LPSC", "LPSS", "LLPP", "LLPL", "LLPC", "LLPS", "LLLP", "LLLL", "LLLC", "LLLS", "LLCP", "LLCL", "LLCC", "LLCS", "LLSP", "LLSL", "LLSC", "LLSS", "LCPP", "LCPL", "LCPC", "LCPS", "LCLP", "LCLL", "LCLC", "LCLS", "LCCP", "LCCL", "LCCC", "LCCS", "LCSP", "LCSL", "LCSC", "LCSS", "LSPP", "LSPL", "LSPC", "LSPS", "LSLP", "LSLL", "LSLC", "LSLS", "LSCP", "LSCL", "LSCC", "LSCS", "LSSP", "LSSL", "LSSC", "LSSS", "CPPP", "CPPL", "CPPC", "CPPS", "CPLP", "CPLL", "CPLC", "CPLS", "CPCP", "CPCL", "CPCC", "CPCS", "CPSP", "CPSL", "CPSC", "CPSS", "CLPP", "CLPL", "CLPC", "CLPS", "CLLP", "CLLL", "CLLC", "CLLS", "CLCP", "CLCL", "CLCC", "CLCS", "CLSP", "CLSL", "CLSC", "CLSS", "CCPP", "CCPL", "CCPC", "CCPS", "CCLP", "CCLL", "CCLC", "CCLS", "CCCP", "CCCL", "CCCC", "CCCS", "CCSP", "CCSL", "CCSC", "CCSS", "CSPP", "CSPL", "CSPC", "CSPS", "CSLP", "CSLL", "CSLC", "CSLS", "CSCP", "CSCL", "CSCC", "CSCS", "CSSP", "CSSL", "CSSC", "CSSS", "SPPP", "SPPL", "SPPC", "SPPS", "SPLP", "SPLL", "SPLC", "SPLS", "SPCP", "SPCL", "SPCC", "SPCS", "SPSP", "SPSL", "SPSC", "SPSS", "SLPP", "SLPL", "SLPC", "SLPS", "SLLP", "SLLL", "SLLC", "SLLS", "SLCP", "SLCL", "SLCC", "SLCS", "SLSP", "SLSL", "SLSC", "SLSS", "SCPP", "SCPL", "SCPC", "SCPS", "SCLP", "SCLL", "SCLC", "SCLS", "SCCP", "SCCL", "SCCC", "SCCS", "SCSP", "SCSL", "SCSC", "SCSS", "SSPP", "SSPL", "SSPC", "SSPS", "SSLP", "SSLL", "SSLC", "SSLS", "SSCP", "SSCL", "SSCC", "SSCS", "SSSP", "SSSL", "SSSC", "SSSS"
    ]
    
    for collect in collectArray{
        if(collectArray.contains(collect)){
            collectSub = collectArray.firstIndex(of: collect)! + 1
        }
    }
    
    return collectSub
}

extension String {

  var length: Int {
    return count
  }

  subscript (i: Int) -> String {
    return self[i ..< i + 1]
  }

  func substring(fromIndex: Int) -> String {
    return self[min(fromIndex, length) ..< length]
  }

  func substring(toIndex: Int) -> String {
    return self[0 ..< max(0, toIndex)]
  }

  subscript (r: Range<Int>) -> String {
    let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                        upper: min(length, max(0, r.upperBound))))
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
    return String(self[start ..< end])
  }

}
