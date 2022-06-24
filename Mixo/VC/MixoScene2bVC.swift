//
//  MixoScene2bVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import Firebase

/*
 struct Archetype : Decodable {
     let title: String
     let text: String
     let image: String
 }

 var archTitle = String()
 var archText = String()
 var archImage = String()
 var alertInt = Int()
 var warningInt = Int()
*/

@available(iOS 13.0, *)
class MixoScene2bVC: UIViewController {

    var archChoiceState: [Int] = []
    var cl = String()
    var zs = String()
    var intelDone = String()
    
    //array for talent images
    var archActiveImages: [String] = []
    var archInactiveImages: [String] = []
    var archTalentImageLocs: [String] = []
    
    @IBOutlet weak var btnHeroNav: UIButton!
    @IBOutlet weak var btnIntelNav: UIButton!
    @IBOutlet weak var btnTalNav: UIButton!
    @IBOutlet weak var btnColNav: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lblArchetypeText: UILabel!
    
    
    @IBOutlet weak var btnArchetype1: UIButton!
    @IBOutlet weak var btnArchetype2: UIButton!
    @IBOutlet weak var btnArchetype3: UIButton!
    @IBOutlet weak var btnArchetype4: UIButton!
    @IBOutlet weak var btnArchetype5: UIButton!
    @IBOutlet weak var btnArchetype6: UIButton!
    @IBOutlet weak var btnArchetype7: UIButton!
    @IBOutlet weak var btnArchetype8: UIButton!
    @IBOutlet weak var btnArchetype9: UIButton!
    @IBOutlet weak var btnArchetype10: UIButton!
    @IBOutlet weak var btnArchetype11: UIButton!
    @IBOutlet weak var btnArchetype12: UIButton!
    @IBOutlet weak var btnArchetype13: UIButton!
    @IBOutlet weak var btnArchetype14: UIButton!
    @IBOutlet weak var btnArchetype15: UIButton!
    @IBOutlet weak var btnArchetype16: UIButton!
    
    @IBOutlet weak var lblArchetype1: UILabel!
    @IBOutlet weak var lblArchetype2: UILabel!
    @IBOutlet weak var lblArchetype3: UILabel!
    @IBOutlet weak var lblArchetype4: UILabel!
    @IBOutlet weak var lblArchetype5: UILabel!
    @IBOutlet weak var lblArchetype6: UILabel!
    @IBOutlet weak var lblArchetype7: UILabel!
    @IBOutlet weak var lblArchetype8: UILabel!
    @IBOutlet weak var lblArchetype9: UILabel!
    @IBOutlet weak var lblArchetype10: UILabel!
    @IBOutlet weak var lblArchetype11: UILabel!
    @IBOutlet weak var lblArchetype12: UILabel!
    @IBOutlet weak var lblArchetype13: UILabel!
    @IBOutlet weak var lblArchetype14: UILabel!
    @IBOutlet weak var lblArchetype15: UILabel!
    @IBOutlet weak var lblArchetype16: UILabel!
    
    @IBOutlet weak var btnNext: UIButton!
    
    var lngArch1 = UILongPressGestureRecognizer()
    var lngArch2 = UILongPressGestureRecognizer()
    var lngArch3 = UILongPressGestureRecognizer()
    var lngArch4 = UILongPressGestureRecognizer()
    var lngArch5 = UILongPressGestureRecognizer()
    var lngArch6 = UILongPressGestureRecognizer()
    var lngArch7 = UILongPressGestureRecognizer()
    var lngArch8 = UILongPressGestureRecognizer()
    var lngArch9 = UILongPressGestureRecognizer()
    var lngArch10 = UILongPressGestureRecognizer()
    var lngArch11 = UILongPressGestureRecognizer()
    var lngArch12 = UILongPressGestureRecognizer()
    var lngArch13 = UILongPressGestureRecognizer()
    var lngArch14 = UILongPressGestureRecognizer()
    var lngArch15 = UILongPressGestureRecognizer()
    var lngArch16 = UILongPressGestureRecognizer()
    
    var talent1TagNum = Int()
    var talent2TagNum = Int()
    var talent3TagNum = Int()
    var talent4TagNum = Int()
    var talent5TagNum = Int()
    var talent6TagNum = Int()
    var talent7TagNum = Int()
    var talent8TagNum = Int()
    var talent9TagNum = Int()
    var talent10TagNum = Int()
    var talent11TagNum = Int()
    var talent12TagNum = Int()
    var talent13TagNum = Int()
    var talent14TagNum = Int()
    var talent15TagNum = Int()
    var talent16TagNum = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load archInactiveImages array
        archInactiveImages.append("v1img1is") //Verbal - 1 - [0]
        archInactiveImages.append("v1img2is") //Verbal - 2 - [1]
        archInactiveImages.append("v1img3is") //Verbal - 3 - [2]
        archInactiveImages.append("v1img4is") //Verbal - 4 - [3]
        archInactiveImages.append("nimg1is") //Naturalistic - 5 - [4]
        archInactiveImages.append("nimg2is") //Naturalistic - 6 - [5]
        archInactiveImages.append("nimg3is") //Naturalistic - 7 - [6]
        archInactiveImages.append("nimg4is") //Naturalistic - 8 - [7]
        archInactiveImages.append("i1img1is") //Interpersonal - 9 - [8]
        archInactiveImages.append("i1img2is") //Interpersonal - 10 - [9]
        archInactiveImages.append("i1img3is") //Interpersonal - 11 - [10]
        archInactiveImages.append("i1img4is") //Interpersonal - 12 - [11]
        archInactiveImages.append("limg1is") //Logical - 13 - [12]
        archInactiveImages.append("limg2is") //Logical - 14 - [13]
        archInactiveImages.append("limg3is") //Logical - 15 - [14]
        archInactiveImages.append("limg4is") //Logical - 16 - [15]
        archInactiveImages.append("bimg1is") //Bodily - 17 - [16]
        archInactiveImages.append("bimg2is") //Bodily - 18 - [17]
        archInactiveImages.append("bimg3is") //Bodily - 19 - [18]
        archInactiveImages.append("bimg4is") //Bodily - 20 - [19]
        archInactiveImages.append("i2img1is") //Intrapersonal - 21 - [20]
        archInactiveImages.append("i2img2is") //Intrapersonal - 22 - [21]
        archInactiveImages.append("i2img3is") //Intrapersonal - 23 - [22]
        archInactiveImages.append("i2img4is") //Intrapersonal - 24 - [23]
        archInactiveImages.append("mimg1is") //Musical - 25 - [24]
        archInactiveImages.append("mimg2is") //Musical - 26 - [25]
        archInactiveImages.append("mimg3is") //Musical - 27 - [26]
        archInactiveImages.append("mimg4is") //Musical - 28 - [27]
        archInactiveImages.append("v2img1is") //Visual - 29 - [28]
        archInactiveImages.append("v2img2is") //Visual - 30 - [29]
        archInactiveImages.append("v2img3is") //Visual - 31 - [30]
        archInactiveImages.append("v2img4is") //Visual - 32 - [31]
        archInactiveImages.append("eimg1is") //Existential - 33 - [32]
        archInactiveImages.append("eimg2is") //Existential - 34 - [33]
        archInactiveImages.append("eimg3is") //Existential - 35 - [34]
        archInactiveImages.append("eimg4is") //Existential - 36 - [35]
        
        //load archActiveImages array
        archActiveImages.append("v1img1as") //Verbal - 1 - [0]
        archActiveImages.append("v1img2as") //Verbal - 2 - [1]
        archActiveImages.append("v1img3as") //Verbal - 3 - [2]
        archActiveImages.append("v1img4as") //Verbal - 4 - [3]
        archActiveImages.append("nimg1as") //Naturalistic - 5 - [4]
        archActiveImages.append("nimg2as") //Naturalistic - 6 - [5]
        archActiveImages.append("nimg3as") //Naturalistic - 7 - [6]
        archActiveImages.append("nimg4as") //Naturalistic - 8 - [7]
        archActiveImages.append("i1img1as") //Interpersonal - 9 - [8]
        archActiveImages.append("i1img2as") //Interpersonal - 10 - [9]
        archActiveImages.append("i1img3as") //Interpersonal - 11 - [10]
        archActiveImages.append("i1img4as") //Interpersonal - 12 - [11]
        archActiveImages.append("limg1as") //Logical - 13 - [12]
        archActiveImages.append("limg2as") //Logical - 14 - [13]
        archActiveImages.append("limg3as") //Logical - 15 - [14]
        archActiveImages.append("limg4as") //Logical - 16 - [15]
        archActiveImages.append("bimg1as") //Bodily - 17 - [16]
        archActiveImages.append("bimg2as") //Bodily - 18 - [17]
        archActiveImages.append("bimg3as") //Bodily - 19 - [18]
        archActiveImages.append("bimg4as") //Bodily - 20 - [19]
        archActiveImages.append("i2img1as") //Intrapersonal - 21 - [20]
        archActiveImages.append("i2img2as") //Intrapersonal - 22 - [21]
        archActiveImages.append("i2img3as") //Intrapersonal - 23 - [22]
        archActiveImages.append("i2img4as") //Intrapersonal - 24 - [23]
        archActiveImages.append("mimg1as") //Musical - 25 - [24]
        archActiveImages.append("mimg2as") //Musical - 26 - [25]
        archActiveImages.append("mimg3as") //Musical - 27 - [26]
        archActiveImages.append("mimg4as") //Musical - 28 - [27]
        archActiveImages.append("v2img1as") //Visual - 29 - [28]
        archActiveImages.append("v2img2as") //Visual - 30 - [29]
        archActiveImages.append("v2img3as") //Visual - 31 - [30]
        archActiveImages.append("v2img4as") //Visual - 32 - [31]
        archActiveImages.append("eimg1as") //Existential - 33 - [32]
        archActiveImages.append("eimg2as") //Existential - 34 - [33]
        archActiveImages.append("eimg3as") //Existential - 35 - [34]
        archActiveImages.append("eimg4as") //Existential - 36 - [35]
        
        //load imagelocations
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v1img1as") //Verbal - 1 - [0]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v1img2as") //Verbal - 2 - [1]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v1img3as") //Verbal - 3 - [2]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v1img4as") //Verbal - 4 - [3]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/nimg1as") //Naturalistic - 5 - [4]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/nimg2as") //Naturalistic - 6 - [5]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/nimg3as") //Naturalistic - 7 - [6]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/nimg4as") //Naturalistic - 8 - [7]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i1img1as") //Interpersonal - 9 - [8]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i1img2as") //Interpersonal - 10 - [9]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i1img3as") //Interpersonal - 11 - [10]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i1img4as") //Interpersonal - 12 - [11]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/limg1as") //Logical - 13 - [12]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/limg2as") //Logical - 14 - [13]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/limg3as") //Logical - 15 - [14]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/limg4as") //Logical - 16 - [15]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/bimg1as") //Bodily - 17 - [16]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/bimg2as") //Bodily - 18 - [17]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/bimg3as") //Bodily - 19 - [18]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/bimg4as") //Bodily - 20 - [19]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i2img1as") //Intrapersonal - 21 - [20]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i2img2as") //Intrapersonal - 22 - [21]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i2img3as") //Intrapersonal - 23 - [22]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/i2img4as") //Intrapersonal - 24 - [23]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/mimg1as") //Musical - 25 - [24]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/mimg2as") //Musical - 26 - [25]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/mimg3as") //Musical - 27 - [26]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/mimg4as") //Musical - 28 - [27]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v2img1as") //Visual - 29 - [28]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v2img2as") //Visual - 30 - [29]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v2img3as") //Visual - 31 - [30]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/v2img4as") //Visual - 32 - [31]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/eimg1as") //Existential - 33 - [32]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/eimg2as") //Existential - 34 - [33]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/eimg3as") //Existential - 35 - [34]
        archTalentImageLocs.append("http://engine.mixotype.com/app/images/collections/eimg4as") //Existential - 36 - [35]
        
        lngArch1 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch1(_:)))
        lngArch1.minimumPressDuration = 1
        lngArch2 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch2(_:)))
        lngArch2.minimumPressDuration = 1
        lngArch3 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch3(_:)))
        lngArch3.minimumPressDuration = 1
        lngArch4 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch4(_:)))
        lngArch4.minimumPressDuration = 1
        lngArch5 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch5(_:)))
        lngArch5.minimumPressDuration = 1
        lngArch6 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch6(_:)))
        lngArch6.minimumPressDuration = 1
        lngArch7 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch7(_:)))
        lngArch7.minimumPressDuration = 1
        lngArch8 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch8(_:)))
        lngArch8.minimumPressDuration = 1
        lngArch9 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch9(_:)))
        lngArch9.minimumPressDuration = 1
        lngArch10 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch10(_:)))
        lngArch10.minimumPressDuration = 1
        lngArch11 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch11(_:)))
        lngArch11.minimumPressDuration = 1
        lngArch12 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch12(_:)))
        lngArch12.minimumPressDuration = 1
        lngArch13 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch13(_:)))
        lngArch13.minimumPressDuration = 1
        lngArch14 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch14(_:)))
        lngArch14.minimumPressDuration = 1
        lngArch15 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch15(_:)))
        lngArch15.minimumPressDuration = 1
        lngArch16 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2bVC.lpArch16(_:)))
        lngArch16.minimumPressDuration = 1
        
        btnArchetype1.addGestureRecognizer(lngArch1)
        btnArchetype2.addGestureRecognizer(lngArch2)
        btnArchetype3.addGestureRecognizer(lngArch3)
        btnArchetype4.addGestureRecognizer(lngArch4)
        btnArchetype5.addGestureRecognizer(lngArch5)
        btnArchetype6.addGestureRecognizer(lngArch6)
        btnArchetype7.addGestureRecognizer(lngArch7)
        btnArchetype8.addGestureRecognizer(lngArch8)
        btnArchetype9.addGestureRecognizer(lngArch9)
        btnArchetype10.addGestureRecognizer(lngArch10)
        btnArchetype11.addGestureRecognizer(lngArch11)
        btnArchetype12.addGestureRecognizer(lngArch12)
        btnArchetype13.addGestureRecognizer(lngArch13)
        btnArchetype14.addGestureRecognizer(lngArch14)
        btnArchetype15.addGestureRecognizer(lngArch15)
        btnArchetype16.addGestureRecognizer(lngArch16)
        
        //hide the corner labels
        lblArchetype1.isHidden = true
        lblArchetype2.isHidden = true
        lblArchetype3.isHidden = true
        lblArchetype4.isHidden = true
        lblArchetype5.isHidden = true
        lblArchetype6.isHidden = true
        lblArchetype7.isHidden = true
        lblArchetype8.isHidden = true
        lblArchetype9.isHidden = true
        lblArchetype10.isHidden = true
        lblArchetype11.isHidden = true
        lblArchetype12.isHidden = true
        lblArchetype13.isHidden = true
        lblArchetype14.isHidden = true
        lblArchetype15.isHidden = true
        lblArchetype16.isHidden = true
        
        //hide the btnNext
        btnNext.isHidden = true
        
        //set up the UI
        Utilities.colorizeNavTabs(btnHeroNav,btnIntelNav,btnTalNav,btnColNav)
        setUpUI()
        
        //adjust tje progress bar
        progress()
    }
    
    func sendData(){
        //save the data to Firebase
        
        //create a string from the chosen heroes in heroChoiceState array
        var archString = String()
        let arch1 = String(archChoiceState[0])
        let arch2 = String(archChoiceState[1])
        let arch3 = String(archChoiceState[2])
        let arch4 = String(archChoiceState[3])
        
        archString = arch1 + "_" + arch2 + "_" + arch3 + "_" + arch4
        
        let archImage1 = archTalentImageLocs[archChoiceState[0]-1]
        let archImage2 = archTalentImageLocs[archChoiceState[1]-1]
        let archImage3 = archTalentImageLocs[archChoiceState[2]-1]
        let archImage4 = archTalentImageLocs[archChoiceState[3]-1]
        
        //send data to Firebase
        docRef.updateData([
            "talent_nest": archString,
            "talent_img1": archImage1,
            "talent_img2": archImage2,
            "talent_img3": archImage3,
            "talent_img4": archImage4,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                let mixoScene3VC = mainSB.instantiateViewController(withIdentifier: "MixoScene3VC") as! MixoScene3VC
                self.present(mixoScene3VC, animated:true, completion:nil)
            }
        }
    }
    
    func setUpUI() {
        
        Utilities.styleGreyOutlinedButton(btnHeroNav)
        Utilities.styleGreyOutlinedButton(btnIntelNav)
        Utilities.styleGreyFilledButton(btnTalNav)
        Utilities.styleGreyOutlinedButton(btnColNav)
        
        //get the user intelligence selections
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let intel_nest = document.get("intel_nest")  as! String
                let intel1 = Int(intel_nest[0])
                let intel2 = Int(intel_nest[1])
                let intel3 = Int(intel_nest[2])
                let intel4 = Int(intel_nest[3])
                
                //first column of talents
                switch(intel1){
                    case 1:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 1
                        self.talent5TagNum = 2
                        self.talent9TagNum = 3
                        self.talent13TagNum = 4
                        break
                    case 2:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 5
                        self.talent5TagNum = 6
                        self.talent9TagNum = 7
                        self.talent13TagNum = 8
                        break
                    case 3:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 9
                        self.talent5TagNum = 10
                        self.talent9TagNum = 11
                        self.talent13TagNum = 12
                        break
                    case 4:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 13
                        self.talent5TagNum = 14
                        self.talent9TagNum = 15
                        self.talent13TagNum = 16
                        break
                    case 5:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 17
                        self.talent5TagNum = 18
                        self.talent9TagNum = 19
                        self.talent13TagNum = 20
                        break
                    case 6:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 21
                        self.talent5TagNum = 22
                        self.talent9TagNum = 23
                        self.talent13TagNum = 24
                        break
                    case 7:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[27])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 25
                        self.talent5TagNum = 26
                        self.talent9TagNum = 27
                        self.talent13TagNum = 28
                        break

                    case 8:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[28])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[29])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[30])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[31])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 29
                        self.talent5TagNum = 30
                        self.talent9TagNum = 31
                        self.talent13TagNum = 32
                        break
                    case 9:
                        self.btnArchetype1.setImage(UIImage(named: self.archInactiveImages[32])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype5.setImage(UIImage(named: self.archInactiveImages[33])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype9.setImage(UIImage(named: self.archInactiveImages[34])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype13.setImage(UIImage(named: self.archInactiveImages[35])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent1TagNum = 33
                        self.talent5TagNum = 34
                        self.talent9TagNum = 35
                        self.talent13TagNum = 36
                        break
                    default:
                        break
                }
                
                //second column of talents
                switch(intel2){
                    case 1:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 1
                        self.talent6TagNum = 2
                        self.talent10TagNum = 3
                        self.talent14TagNum = 4
                        break
                    case 2:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 5
                        self.talent6TagNum = 6
                        self.talent10TagNum = 7
                        self.talent14TagNum = 8
                        break
                    case 3:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 9
                        self.talent6TagNum = 10
                        self.talent10TagNum = 11
                        self.talent14TagNum = 12
                        break
                    case 4:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 13
                        self.talent6TagNum = 14
                        self.talent10TagNum = 15
                        self.talent14TagNum = 16
                        break
                    case 5:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 17
                        self.talent6TagNum = 18
                        self.talent10TagNum = 19
                        self.talent14TagNum = 20
                        break
                    case 6:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 21
                        self.talent6TagNum = 22
                        self.talent10TagNum = 23
                        self.talent14TagNum = 24
                        break
                    case 7:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[27])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 25
                        self.talent6TagNum = 26
                        self.talent10TagNum = 27
                        self.talent14TagNum = 28
                        break

                    case 8:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[28])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[29])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[30])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[31])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 29
                        self.talent6TagNum = 30
                        self.talent10TagNum = 31
                        self.talent14TagNum = 32
                        break
                    case 9:
                        self.btnArchetype2.setImage(UIImage(named: self.archInactiveImages[32])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype6.setImage(UIImage(named: self.archInactiveImages[33])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype10.setImage(UIImage(named: self.archInactiveImages[34])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype14.setImage(UIImage(named: self.archInactiveImages[35])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent2TagNum = 33
                        self.talent6TagNum = 34
                        self.talent10TagNum = 35
                        self.talent14TagNum = 36
                        break
                    default:
                        break
                }
                
                //third column of talents
                switch(intel3){
                    case 1:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 1
                        self.talent7TagNum = 2
                        self.talent11TagNum = 3
                        self.talent15TagNum = 4
                        break
                    case 2:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 5
                        self.talent7TagNum = 6
                        self.talent11TagNum = 7
                        self.talent15TagNum = 8
                        break
                    case 3:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 9
                        self.talent7TagNum = 10
                        self.talent11TagNum = 11
                        self.talent15TagNum = 12
                        break
                    case 4:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 13
                        self.talent7TagNum = 14
                        self.talent11TagNum = 15
                        self.talent15TagNum = 16
                        break
                    case 5:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 17
                        self.talent7TagNum = 18
                        self.talent11TagNum = 19
                        self.talent15TagNum = 20
                        break
                    case 6:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 21
                        self.talent7TagNum = 22
                        self.talent11TagNum = 23
                        self.talent15TagNum = 24
                        break
                    case 7:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[27])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 25
                        self.talent7TagNum = 26
                        self.talent11TagNum = 27
                        self.talent15TagNum = 28
                        break

                    case 8:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[28])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[29])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[30])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[31])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 29
                        self.talent7TagNum = 30
                        self.talent11TagNum = 31
                        self.talent15TagNum = 32
                        break
                    case 9:
                        self.btnArchetype3.setImage(UIImage(named: self.archInactiveImages[32])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype7.setImage(UIImage(named: self.archInactiveImages[33])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype11.setImage(UIImage(named: self.archInactiveImages[34])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype15.setImage(UIImage(named: self.archInactiveImages[35])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent3TagNum = 33
                        self.talent7TagNum = 34
                        self.talent11TagNum = 35
                        self.talent15TagNum = 36
                        break
                    default:
                        break
                }
                
                //fourth column of talents
                switch(intel4){
                    case 1:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 1
                        self.talent8TagNum = 2
                        self.talent12TagNum = 3
                        self.talent16TagNum = 4
                        break
                    case 2:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 5
                        self.talent8TagNum = 6
                        self.talent12TagNum = 7
                        self.talent16TagNum = 8
                        break
                    case 3:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 9
                        self.talent8TagNum = 10
                        self.talent12TagNum = 11
                        self.talent16TagNum = 12
                        break
                    case 4:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 13
                        self.talent8TagNum = 14
                        self.talent12TagNum = 15
                        self.talent16TagNum = 16
                        break
                    case 5:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 17
                        self.talent8TagNum = 18
                        self.talent12TagNum = 19
                        self.talent16TagNum = 20
                        break
                    case 6:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 21
                        self.talent8TagNum = 22
                        self.talent12TagNum = 23
                        self.talent16TagNum = 24
                        break
                    case 7:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[27])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 25
                        self.talent8TagNum = 26
                        self.talent12TagNum = 27
                        self.talent16TagNum = 28
                        break

                    case 8:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[28])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[29])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[30])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[31])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 29
                        self.talent8TagNum = 30
                        self.talent12TagNum = 31
                        self.talent16TagNum = 32
                        break
                    case 9:
                        self.btnArchetype4.setImage(UIImage(named: self.archInactiveImages[32])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype8.setImage(UIImage(named: self.archInactiveImages[33])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype12.setImage(UIImage(named: self.archInactiveImages[34])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.btnArchetype16.setImage(UIImage(named: self.archInactiveImages[35])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        self.talent4TagNum = 33
                        self.talent8TagNum = 34
                        self.talent12TagNum = 35
                        self.talent16TagNum = 36
                        break
                    default:
                        break
                }
                    
            } else {
                print("Document does not exist")
            }
        }
        
        //load the archetype images & style the Nav fields according to mixoState
        Utilities.styleGreyOutlinedButton(btnHeroNav)
        Utilities.styleGreyOutlinedButton(btnIntelNav)
        Utilities.styleGreyFilledButton(btnTalNav)
        Utilities.styleGreyOutlinedButton(btnColNav)
        
        lblArchetypeText.text = "Select the (4) Talents that you best exhibit on a daily basis, and rank them in order of strength from 1(most) - 4(least)"

        Utilities.styleBlackFilledButton(btnNext)
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
    
    //function that handles getting the definition of the arch
    func archLongTap(arch: Int){
        let tappedArch = arch
        var archTag = String()
        var archType = String()
        
        
        switch tappedArch {
            case 1  :
                archTag = String(talent1TagNum)
                archType = "tal"
            case 2  :
                archTag = String(talent2TagNum)
                archType = "tal"
            case 3  :
                archTag = String(talent3TagNum)
                archType = "tal"
            case 4  :
                archTag = String(talent4TagNum)
                archType = "tal"
            case 5  :
                archTag = String(talent5TagNum)
                archType = "tal"
            case 6  :
                archTag = String(talent6TagNum)
                archType = "tal"
            case 7  :
                archTag = String(talent7TagNum)
                archType = "tal"
            case 8  :
                archTag = String(talent8TagNum)
                archType = "tal"
            case 9  :
                archTag = String(talent9TagNum)
                archType = "tal"
            case 10  :
                archTag = String(talent10TagNum)
                archType = "tal"
            case 11  :
                archTag = String(talent11TagNum)
                archType = "tal"
            case 12  :
                archTag = String(talent12TagNum)
                archType = "tal"
            case 13  :
                archTag = String(talent13TagNum)
                archType = "tal"
            case 14  :
                archTag = String(talent14TagNum)
                archType = "tal"
            case 15  :
                archTag = String(talent15TagNum)
                archType = "tal"
            case 16  :
                archTag = String(talent16TagNum)
                archType = "tal"
            default :
                return
        }
        
        
        
        //get data from server
        let queryParams: [String: String] = [
            "tag": archTag,
            "type": archType
        ]

        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "engine.mixotype.com"
        urlComponents.path = "/app/webapis/ios/mixodefios.php"
        urlComponents.setQueryItems(with: queryParams)
        let urlString = urlComponents.url?.absoluteString

        guard let url = URL(string: urlString!) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else { return }

            do {

                let decoder = JSONDecoder()
                let arch = try decoder.decode([Archetype].self, from: data)
                archTitle = arch[0].title
                archText = arch[0].text
                archImage = arch[0].image

                DispatchQueue.main.async {
                    alertInt = 1
                    let defVC = defSB.instantiateViewController(withIdentifier: "DefinitionsVC") as! DefinitionsVC
                    self.present(defVC, animated:true, completion:nil)
                }
            } catch {
                print("JSONSerialization error:", error)
            }
        }.resume()
    }
    
    //function handles setting up your mixotype
    func archTap(arch: Int){

        //get the tag of the button
        var tappedArch = Int()
        
        switch(arch){
            case 1:
                tappedArch = talent1TagNum
                break
            case 2:
                tappedArch = talent2TagNum
                break
            case 3:
                tappedArch = talent3TagNum
                break
            case 4:
                tappedArch = talent4TagNum
                break
            case 5:
                tappedArch = talent5TagNum
                break
            case 6:
                tappedArch = talent6TagNum
                break
            case 7:
                tappedArch = talent7TagNum
                break
            case 8:
                tappedArch = talent8TagNum
                break
            case 9:
                tappedArch = talent9TagNum
                break
            case 10:
                tappedArch = talent10TagNum
                break
            case 11:
                tappedArch = talent11TagNum
                break
            case 12:
                tappedArch = talent12TagNum
                break
            case 13:
                tappedArch = talent13TagNum
                break
            case 14:
                tappedArch = talent14TagNum
                break
            case 15:
                tappedArch = talent15TagNum
                break
            case 16:
                tappedArch = talent16TagNum
                break
            default:
                break
        }
        
        //get the size of the hero choice array
        let acsSize = archChoiceState.count

        if(acsSize < 4 || archChoiceState.isEmpty){
            //check if there are any 0's
            if(archChoiceState.contains(0)){
                //find where theres a 0 and set the new tappedArch to its place
                let zeroSet = archChoiceState.firstIndex(of: 0)! + 1
                zs = String(zeroSet)
                
                //replace the 0 with the tappedArch tag
                //if value exists in array, remove it and change lblHero text color and btnHero image
                if(archChoiceState.contains(tappedArch)){

                    //set choiceLoc to the tappedArch
                    guard let choiceLoc = archChoiceState.firstIndex(of: tappedArch) else { return }
                    archChoiceState[choiceLoc] = 0
                    print(archChoiceState)
                    cl = String(choiceLoc)

                    switch arch {
                        case 1  :
                            lblArchetype1.text = cl
                            lblArchetype1.isHidden = true
                            
                            //change image state
                            btnArchetype1.setImage(UIImage(named: archInactiveImages[talent1TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 2  :
                            lblArchetype2.text = cl
                            lblArchetype2.isHidden = true

                            //change image state
                            btnArchetype2.setImage(UIImage(named: archInactiveImages[talent2TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 3  :
                            lblArchetype3.text = cl
                            lblArchetype3.isHidden = true

                            //change image state
                            btnArchetype3.setImage(UIImage(named: archInactiveImages[talent3TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 4  :
                            lblArchetype4.text = cl
                            lblArchetype4.isHidden = true

                            //change image state
                            btnArchetype4.setImage(UIImage(named: archInactiveImages[talent4TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 5  :
                            lblArchetype5.text = cl
                            lblArchetype5.isHidden = true

                            //change image state
                            btnArchetype5.setImage(UIImage(named: archInactiveImages[talent5TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 6  :
                            lblArchetype6.text = cl
                            lblArchetype6.isHidden = true

                            //change image state
                            btnArchetype6.setImage(UIImage(named: archInactiveImages[talent6TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 7  :
                            lblArchetype7.text = cl
                            lblArchetype7.isHidden = true

                            //change image state
                            btnArchetype7.setImage(UIImage(named: archInactiveImages[talent7TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 8  :
                            lblArchetype8.text = cl
                            lblArchetype8.isHidden = true

                            //change image state
                            btnArchetype8.setImage(UIImage(named: archInactiveImages[talent8TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 9  :
                            lblArchetype9.text = cl
                            lblArchetype9.isHidden = true

                            //change image state
                            btnArchetype9.setImage(UIImage(named: archInactiveImages[talent9TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 10  :
                            lblArchetype10.text = cl
                            lblArchetype10.isHidden = true

                            //change image state
                            btnArchetype10.setImage(UIImage(named: archInactiveImages[talent10TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 11  :
                            lblArchetype11.text = cl
                            lblArchetype11.isHidden = true

                            //change image state
                            btnArchetype11.setImage(UIImage(named: archInactiveImages[talent11TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 12  :
                            lblArchetype12.text = cl
                            lblArchetype12.isHidden = true

                            //change image state
                            btnArchetype12.setImage(UIImage(named: archInactiveImages[talent12TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 13  :
                            lblArchetype13.text = cl
                            lblArchetype13.isHidden = true

                            //change image state
                            btnArchetype13.setImage(UIImage(named: archInactiveImages[talent13TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 14  :
                            lblArchetype14.text = cl
                            lblArchetype14.isHidden = true

                            //change image state
                            btnArchetype14.setImage(UIImage(named: archInactiveImages[talent14TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 15  :
                            lblArchetype15.text = cl
                            lblArchetype15.isHidden = true

                            //change image state
                            btnArchetype15.setImage(UIImage(named: archInactiveImages[talent15TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 16  :
                            lblArchetype16.text = cl
                            lblArchetype16.isHidden = true

                            //change image state
                            btnArchetype16.setImage(UIImage(named: archInactiveImages[talent16TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        default :
                            return
                    }
                } else {

                    print("ReAdd Hero")

                    guard let choiceLoc = archChoiceState.firstIndex(of: 0) else { return }
                    let zeroSet = archChoiceState.firstIndex(of: 0)! + 1
                    zs = String(zeroSet)
                    archChoiceState[choiceLoc] = tappedArch
                    print(archChoiceState)
                    
                    switch arch {
                        case 1  :
                            lblArchetype1.text = zs
                            lblArchetype1.isHidden = false

                            //change image state
                            btnArchetype16.setImage(UIImage(named: archActiveImages[talent1TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 2  :
                            lblArchetype2.text = zs
                            lblArchetype2.isHidden = false

                            //change image state
                            btnArchetype2.setImage(UIImage(named: archActiveImages[talent2TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 3  :
                            lblArchetype3.text = zs
                            lblArchetype3.isHidden = false

                            //change image state
                            btnArchetype3.setImage(UIImage(named: archActiveImages[talent3TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 4  :
                            lblArchetype4.text = zs
                            lblArchetype4.isHidden = false

                            //change image state
                            btnArchetype4.setImage(UIImage(named: archActiveImages[talent4TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 5  :
                            lblArchetype5.text = zs
                            lblArchetype5.isHidden = false

                            //change image state
                            btnArchetype5.setImage(UIImage(named: archActiveImages[talent5TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 6  :
                            lblArchetype6.text = zs
                            lblArchetype6.isHidden = false

                            //change image state
                            btnArchetype6.setImage(UIImage(named: archActiveImages[talent6TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 7  :
                            lblArchetype7.text = zs
                            lblArchetype7.isHidden = false

                            //change image state
                            btnArchetype7.setImage(UIImage(named: archActiveImages[talent7TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 8  :
                            lblArchetype8.text = zs
                            lblArchetype8.isHidden = false

                            //change image state
                            btnArchetype8.setImage(UIImage(named: archActiveImages[talent8TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 9  :
                            lblArchetype9.text = zs
                            lblArchetype9.isHidden = false

                            //change image state
                            btnArchetype9.setImage(UIImage(named: archActiveImages[talent9TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 10  :
                            lblArchetype10.text = zs
                            lblArchetype10.isHidden = false

                            //change image state
                            btnArchetype10.setImage(UIImage(named: archActiveImages[talent10TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 11  :
                            lblArchetype11.text = zs
                            lblArchetype11.isHidden = false

                            //change image state
                            btnArchetype11.setImage(UIImage(named: archActiveImages[talent11TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 12  :
                            lblArchetype12.text = zs
                            lblArchetype12.isHidden = false

                            //change image state
                            btnArchetype12.setImage(UIImage(named: archActiveImages[talent12TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 13  :
                            lblArchetype13.text = zs
                            lblArchetype13.isHidden = false

                            //change image state
                            btnArchetype13.setImage(UIImage(named: archActiveImages[talent13TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 14  :
                            lblArchetype14.text = zs
                            lblArchetype14.isHidden = false

                            //change image state
                            btnArchetype14.setImage(UIImage(named: archActiveImages[talent14TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 15  :
                            lblArchetype15.text = zs
                            lblArchetype15.isHidden = false

                            //change image state
                            btnArchetype15.setImage(UIImage(named: archActiveImages[talent15TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 16  :
                            lblArchetype16.text = zs
                            lblArchetype16.isHidden = false

                            //change image state
                            btnArchetype16.setImage(UIImage(named: archActiveImages[talent16TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        default :
                            return
                    }

                }

            } else {

                //replace the 0 with the tappedArch tag
                //if value exists in array, remove it and change lblHero text color and btnHero image
                
                if(archChoiceState.contains(tappedArch)){

                    print("Remove Hero")
                    
                    //set tappedArch to 0
                    guard let choiceLoc = archChoiceState.firstIndex(of: tappedArch) else { return }
                    archChoiceState[choiceLoc] = 0
                    cl = String(choiceLoc)

                    print(archChoiceState)

                    switch arch {
                        case 1  :
                            lblArchetype1.text = cl
                            lblArchetype1.isHidden = true

                            //change image state
                            btnArchetype1.setImage(UIImage(named: archInactiveImages[talent1TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 2  :
                            lblArchetype2.text = cl
                            lblArchetype2.isHidden = true

                            //change image state
                            btnArchetype2.setImage(UIImage(named: archInactiveImages[talent2TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 3  :
                            lblArchetype3.text = cl
                            lblArchetype3.isHidden = true

                            //change image state
                            btnArchetype3.setImage(UIImage(named: archInactiveImages[talent3TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 4  :
                            lblArchetype4.text = cl
                            lblArchetype4.isHidden = true

                            //change image state
                            btnArchetype4.setImage(UIImage(named: archInactiveImages[talent4TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 5  :
                            lblArchetype5.text = cl
                            lblArchetype5.isHidden = true

                            //change image state
                            btnArchetype5.setImage(UIImage(named: archInactiveImages[talent5TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 6  :
                            lblArchetype6.text = cl
                            lblArchetype6.isHidden = true

                            //change image state
                            btnArchetype6.setImage(UIImage(named: archInactiveImages[talent6TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 7  :
                            lblArchetype7.text = cl
                            lblArchetype7.isHidden = true

                            //change image state
                            btnArchetype7.setImage(UIImage(named: archInactiveImages[talent7TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 8  :
                            lblArchetype8.text = cl
                            lblArchetype8.isHidden = true

                            //change image state
                            btnArchetype8.setImage(UIImage(named: archInactiveImages[talent8TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 9  :
                            lblArchetype9.text = cl
                            lblArchetype9.isHidden = true

                            //change image state
                            btnArchetype9.setImage(UIImage(named: archInactiveImages[talent9TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 10  :
                            lblArchetype10.text = cl
                            lblArchetype10.isHidden = true

                            //change image state
                            btnArchetype10.setImage(UIImage(named: archInactiveImages[talent10TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 11  :
                            lblArchetype11.text = cl
                            lblArchetype11.isHidden = true

                            //change image state
                            btnArchetype11.setImage(UIImage(named: archInactiveImages[talent11TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 12  :
                            lblArchetype12.text = cl
                            lblArchetype12.isHidden = true

                            //change image state
                            btnArchetype12.setImage(UIImage(named: archInactiveImages[talent12TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 13  :
                            lblArchetype13.text = cl
                            lblArchetype13.isHidden = true

                            //change image state
                            btnArchetype13.setImage(UIImage(named: archInactiveImages[talent13TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 14  :
                            lblArchetype14.text = cl
                            lblArchetype14.isHidden = true

                            //change image state
                            btnArchetype14.setImage(UIImage(named: archInactiveImages[talent14TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 15  :
                            lblArchetype15.text = cl
                            lblArchetype15.isHidden = true

                            //change image state
                            btnArchetype15.setImage(UIImage(named: archInactiveImages[talent15TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 16  :
                            lblArchetype16.text = cl
                            lblArchetype16.isHidden = true

                            //change image state
                            btnArchetype16.setImage(UIImage(named: archInactiveImages[talent16TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        default :
                                return
                    }
                } else {

                    print("Initial Add")

                    archChoiceState.append(tappedArch)
                    let zeroSet = archChoiceState.firstIndex(of: tappedArch)! + 1
                    zs = String(zeroSet)
                    print(archChoiceState)

                    switch arch {
                        case 1  :
                            lblArchetype1.text = zs
                            lblArchetype1.isHidden = false

                            //change image state
                            btnArchetype1.setImage(UIImage(named: archActiveImages[talent1TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 2  :
                            lblArchetype2.text = zs
                            lblArchetype2.isHidden = false

                            //change image state
                            btnArchetype2.setImage(UIImage(named: archActiveImages[ talent2TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 3  :
                            lblArchetype3.text = zs
                            lblArchetype3.isHidden = false

                            //change image state
                            btnArchetype3.setImage(UIImage(named: archActiveImages[talent3TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 4  :
                            lblArchetype4.text = zs
                            lblArchetype4.isHidden = false

                            //change image state
                            btnArchetype4.setImage(UIImage(named: archActiveImages[talent4TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 5  :
                            lblArchetype5.text = zs
                            lblArchetype5.isHidden = false

                            //change image state
                            btnArchetype5.setImage(UIImage(named: archActiveImages[talent5TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 6  :
                            lblArchetype6.text = zs
                            lblArchetype6.isHidden = false

                            //change image state
                            btnArchetype6.setImage(UIImage(named: archActiveImages[talent6TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 7  :
                            lblArchetype7.text = zs
                            lblArchetype7.isHidden = false

                            //change image state
                            btnArchetype7.setImage(UIImage(named: archActiveImages[talent7TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 8  :
                            lblArchetype8.text = zs
                            lblArchetype8.isHidden = false

                            //change image state
                            btnArchetype8.setImage(UIImage(named: archActiveImages[talent8TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 9  :
                            lblArchetype9.text = zs
                            lblArchetype9.isHidden = false

                            //change image state
                            btnArchetype9.setImage(UIImage(named: archActiveImages[talent9TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 10  :
                            lblArchetype10.text = zs
                            lblArchetype10.isHidden = false

                            //change image state
                            btnArchetype10.setImage(UIImage(named: archActiveImages[talent10TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 11  :
                            lblArchetype11.text = zs
                            lblArchetype11.isHidden = false

                            //change image state
                            btnArchetype11.setImage(UIImage(named: archActiveImages[talent11TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 12  :
                            lblArchetype12.text = zs
                            lblArchetype12.isHidden = false

                            //change image state
                            btnArchetype12.setImage(UIImage(named: archActiveImages[talent12TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 13  :
                            lblArchetype13.text = zs
                            lblArchetype13.isHidden = false

                            //change image state
                            btnArchetype13.setImage(UIImage(named: archActiveImages[talent13TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 14  :
                            lblArchetype14.text = zs
                            lblArchetype14.isHidden = false

                            //change image state
                            btnArchetype14.setImage(UIImage(named: archActiveImages[talent14TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 15  :
                            lblArchetype15.text = zs
                            lblArchetype15.isHidden = false

                            //change image state
                            btnArchetype15.setImage(UIImage(named: archActiveImages[talent15TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 16  :
                            lblArchetype16.text = zs
                            lblArchetype16.isHidden = false

                            //change image state
                            btnArchetype16.setImage(UIImage(named: archActiveImages[talent16TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        default :
                            return
                    }

                }
            }

            if(archChoiceState.count == 4 && !archChoiceState.contains(0)){
                btnNext.isHidden = false
            }

        } else {

            //check if the user is selecting to remove a hero
            //"Remove Hero from full array"
            if(archChoiceState.contains(tappedArch)){
                    
                print("Remove Hero from full array")
                guard let choiceLoc = archChoiceState.firstIndex(of: tappedArch) else { return }

                //archChoiceState.insert(choiceLoc, at: 0)
                archChoiceState[choiceLoc] = 0
                cl = String(choiceLoc)

                print(archChoiceState)

                switch arch {
                    case 1  :
                        lblArchetype1.text = cl
                        lblArchetype1.isHidden = true

                        //change image state
                        btnArchetype1.setImage(UIImage(named: archInactiveImages[talent1TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 2  :
                        lblArchetype2.text = cl
                        lblArchetype2.isHidden = true

                        //change image state
                        btnArchetype2.setImage(UIImage(named: archInactiveImages[talent5TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 3  :
                        lblArchetype3.text = cl
                        lblArchetype3.isHidden = true

                        //change image state
                        btnArchetype3.setImage(UIImage(named: archInactiveImages[talent3TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 4  :
                        lblArchetype4.text = cl
                        lblArchetype4.isHidden = true

                        //change image state
                        btnArchetype4.setImage(UIImage(named: archInactiveImages[talent4TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 5  :
                        lblArchetype5.text = cl
                        lblArchetype5.isHidden = true

                        //change image state
                        btnArchetype5.setImage(UIImage(named: archInactiveImages[talent2TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 6  :
                        lblArchetype6.text = cl
                        lblArchetype6.isHidden = true

                        //change image state
                        btnArchetype6.setImage(UIImage(named: archInactiveImages[talent6TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 7  :
                        lblArchetype7.text = cl
                        lblArchetype7.isHidden = true

                        //change image state
                        btnArchetype7.setImage(UIImage(named: archInactiveImages[talent7TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 8  :
                        lblArchetype8.text = cl
                        lblArchetype8.isHidden = true

                        //change image state
                        btnArchetype8.setImage(UIImage(named: archInactiveImages[talent8TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 9  :
                        lblArchetype9.text = cl
                        lblArchetype9.isHidden = true

                        //change image state
                        btnArchetype9.setImage(UIImage(named: archInactiveImages[talent3TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 10  :
                        lblArchetype10.text = cl
                        lblArchetype10.isHidden = true

                        //change image state
                        btnArchetype10.setImage(UIImage(named: archInactiveImages[talent10TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 11  :
                        lblArchetype11.text = cl
                        lblArchetype11.isHidden = true

                        //change image state
                        btnArchetype11.setImage(UIImage(named: archInactiveImages[talent11TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 12  :
                        lblArchetype12.text = cl
                        lblArchetype12.isHidden = true

                        //change image state
                        btnArchetype12.setImage(UIImage(named: archInactiveImages[talent12TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 13  :
                        lblArchetype13.text = cl
                        lblArchetype13.isHidden = true

                        //change image state
                        btnArchetype13.setImage(UIImage(named: archInactiveImages[talent4TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 14  :
                        lblArchetype14.text = cl
                        lblArchetype14.isHidden = true

                        //change image state
                        btnArchetype14.setImage(UIImage(named: archInactiveImages[talent14TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 15  :
                        lblArchetype15.text = cl
                        lblArchetype15.isHidden = true

                        //change image state
                        btnArchetype15.setImage(UIImage(named: archInactiveImages[talent15TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    case 16  :
                        lblArchetype16.text = cl
                        lblArchetype16.isHidden = true

                        //change image state
                        btnArchetype16.setImage(UIImage(named: archInactiveImages[talent16TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                        break
                    default :
                        return
                }

                if(archChoiceState.contains(0)){
                    btnNext.isHidden = true
                }
            } else {

                if(acsSize == 4 && !archChoiceState.contains(0)) {
                    warningInt = 3
                    let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
                    self.present(warningVC, animated:true, completion:nil)
                } else {

                    print("ReAdd hero to full array")
                    
                    guard let choiceLoc = archChoiceState.firstIndex(of: 0) else { return }
                    let zeroSet = archChoiceState.firstIndex(of: 0)! + 1
                    zs = String(zeroSet)
                    archChoiceState[choiceLoc] = tappedArch

                    print(archChoiceState)

                    switch arch {
                        case 1  :
                            lblArchetype1.text = zs
                            lblArchetype1.isHidden = false

                            //change image state
                            btnArchetype16.setImage(UIImage(named: archActiveImages[talent1TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 2  :
                            lblArchetype2.text = zs
                            lblArchetype2.isHidden = false

                            //change image state
                            btnArchetype2.setImage(UIImage(named: archActiveImages[talent2TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 3  :
                            lblArchetype3.text = zs
                            lblArchetype3.isHidden = false

                            //change image state
                            btnArchetype3.setImage(UIImage(named: archActiveImages[talent3TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 4  :
                            lblArchetype4.text = zs
                            lblArchetype4.isHidden = false

                            //change image state
                            btnArchetype4.setImage(UIImage(named: archActiveImages[talent4TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 5  :
                            lblArchetype5.text = zs
                            lblArchetype5.isHidden = false

                            //change image state
                            btnArchetype5.setImage(UIImage(named: archActiveImages[talent5TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 6  :
                            lblArchetype6.text = zs
                            lblArchetype6.isHidden = false

                            //change image state
                            btnArchetype6.setImage(UIImage(named: archActiveImages[talent6TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 7  :
                            lblArchetype7.text = zs
                            lblArchetype7.isHidden = false

                            //change image state
                            btnArchetype7.setImage(UIImage(named: archActiveImages[talent7TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 8  :
                            lblArchetype8.text = zs
                            lblArchetype8.isHidden = false

                            //change image state
                            btnArchetype8.setImage(UIImage(named: archActiveImages[talent8TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 9  :
                            lblArchetype9.text = zs
                            lblArchetype9.isHidden = false

                            //change image state
                            btnArchetype9.setImage(UIImage(named: archActiveImages[talent9TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 10  :
                            lblArchetype10.text = zs
                            lblArchetype10.isHidden = false

                            //change image state
                            btnArchetype10.setImage(UIImage(named: archActiveImages[talent10TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 11  :
                            lblArchetype11.text = zs
                            lblArchetype11.isHidden = false

                            //change image state
                            btnArchetype11.setImage(UIImage(named: archActiveImages[talent11TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 12  :
                            lblArchetype12.text = zs
                            lblArchetype12.isHidden = false

                            //change image state
                            btnArchetype12.setImage(UIImage(named: archActiveImages[talent12TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 13  :
                            lblArchetype13.text = zs
                            lblArchetype13.isHidden = false

                            //change image state
                            btnArchetype13.setImage(UIImage(named: archActiveImages[talent13TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 14  :
                            lblArchetype14.text = zs
                            lblArchetype14.isHidden = false

                            //change image state
                            btnArchetype14.setImage(UIImage(named: archActiveImages[talent14TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 15  :
                            lblArchetype15.text = zs
                            lblArchetype15.isHidden = false

                            //change image state
                            btnArchetype15.setImage(UIImage(named: archActiveImages[talent15TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        case 16  :
                            lblArchetype16.text = zs
                            lblArchetype16.isHidden = false

                            //change image state
                            btnArchetype16.setImage(UIImage(named: archActiveImages[talent16TagNum - 1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                            break
                        default :
                            return
                    }

                    if(archChoiceState.count == 4 && !archChoiceState.contains(0)){
                        btnNext.isHidden = false
                    }
                }
            }
        }
    }
    
    //press and hold on the hero to show the definition
    @objc func lpArch1(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype1.tag)
    }
    @objc func lpArch2(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype2.tag)
    }
    @objc func lpArch3(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype3.tag)
    }
    @objc func lpArch4(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype4.tag)
    }
    @objc func lpArch5(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype5.tag)
    }
    @objc func lpArch6(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype6.tag)
    }
    @objc func lpArch7(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype7.tag)
    }
    @objc func lpArch8(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype8.tag)
    }
    @objc func lpArch9(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype9.tag)
    }
    @objc func lpArch10(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype10.tag)
    }
    @objc func lpArch11(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype11.tag)
    }
    @objc func lpArch12(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype12.tag)
    }
    @objc func lpArch13(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype13.tag)
    }
    @objc func lpArch14(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype14.tag)
    }
    @objc func lpArch15(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype15.tag)
    }
    @objc func lpArch16(_ sender: UILongPressGestureRecognizer){
        archLongTap(arch: btnArchetype16.tag)
    }
    
    @IBAction func btnArchetype1(_ sender: Any) {
        archTap(arch: btnArchetype1.tag)
    }
    @IBAction func btnArchetype2(_ sender: Any) {
        archTap(arch: btnArchetype2.tag)
    }
    @IBAction func btnArchetype3(_ sender: Any) {
        archTap(arch: btnArchetype3.tag)
    }
    @IBAction func btnArchetype4(_ sender: Any) {
        archTap(arch: btnArchetype4.tag)
    }
    @IBAction func btnArchetype5(_ sender: Any) {
        archTap(arch: btnArchetype5.tag)
    }
    @IBAction func btnArchetype6(_ sender: Any) {
        archTap(arch: btnArchetype6.tag)
    }
    @IBAction func btnArchetype7(_ sender: Any) {
        archTap(arch: btnArchetype7.tag)
    }
    @IBAction func btnArchetype8(_ sender: Any) {
        archTap(arch: btnArchetype8.tag)
    }
    @IBAction func btnArchetype9(_ sender: Any) {
        archTap(arch: btnArchetype9.tag)
    }
    @IBAction func btnArchetype10(_ sender: Any) {
        archTap(arch: btnArchetype10.tag)
    }
    @IBAction func btnArchetype11(_ sender: Any) {
        archTap(arch: btnArchetype11.tag)
    }
    @IBAction func btnArchetype12(_ sender: Any) {
        archTap(arch: btnArchetype12.tag)
    }
    @IBAction func btnArchetype13(_ sender: Any) {
        archTap(arch: btnArchetype13.tag)
    }
    @IBAction func btnArchetype14(_ sender: Any) {
        archTap(arch: btnArchetype14.tag)
    }
    @IBAction func btnArchetype15(_ sender: Any) {
        archTap(arch: btnArchetype15.tag)
    }
    @IBAction func btnArchetype16(_ sender: Any) {
        archTap(arch: btnArchetype16.tag)
    }
    
    @IBAction func btnNext(_ sender: Any) {
        sendData()
    }
    
    @IBAction func btnHeroNav(_ sender: Any) {
        mixoState = 1
        self.transitionToMixoScene1VC()
    }
    @IBAction func btnIntelNav(_ sender: Any) {
        mixoState = 2
        self.transitionToMixoScene1VC()
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
        self.transitionToMixoScene1VC()
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
    
    func transitionToMixoScene1VC(){
        let mixoScene1VC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.mixoScene1VC) as? MixoScene1VC
        
        view.window?.rootViewController = mixoScene1VC
        view.window?.makeKeyAndVisible()
    }
    
}
