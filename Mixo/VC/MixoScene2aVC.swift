//
//  MixoScene2VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import Firebase

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


@available(iOS 13.0, *)
class MixoScene2aVC: UIViewController {
    
    var archChoiceState: [Int] = []
    var cl = String()
    var zs = String()
    var intelDone = String()
    
    //array for hero, intel, collection images
    var archActiveImages: [String] = []
    var archInactiveImages: [String] = []
    var archHeroImageLocs: [String] = []
    var archIntelImageLocs: [String] = []
    var archCollectImageLocs: [String] = []

    @IBOutlet weak var btnHeroNav: UIButton!
    @IBOutlet weak var btnIntelNav: UIButton!
    @IBOutlet weak var btnTalNav: UIButton!
    @IBOutlet weak var btnColNav: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
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
    
    @IBOutlet weak var lblArchetype1: UILabel!
    @IBOutlet weak var lblArchetype2: UILabel!
    @IBOutlet weak var lblArchetype3: UILabel!
    @IBOutlet weak var lblArchetype4: UILabel!
    @IBOutlet weak var lblArchetype5: UILabel!
    @IBOutlet weak var lblArchetype6: UILabel!
    @IBOutlet weak var lblArchetype7: UILabel!
    @IBOutlet weak var lblArchetype8: UILabel!
    @IBOutlet weak var lblArchetype9: UILabel!
    
    var lngArch1 = UILongPressGestureRecognizer()
    var lngArch2 = UILongPressGestureRecognizer()
    var lngArch3 = UILongPressGestureRecognizer()
    var lngArch4 = UILongPressGestureRecognizer()
    var lngArch5 = UILongPressGestureRecognizer()
    var lngArch6 = UILongPressGestureRecognizer()
    var lngArch7 = UILongPressGestureRecognizer()
    var lngArch8 = UILongPressGestureRecognizer()
    var lngArch9 = UILongPressGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //load archInactiveImages array
        archInactiveImages.append("actoris") //hero - 1 - [0]
        archInactiveImages.append("leaderis") //hero - 2 - [1]
        archInactiveImages.append("philosopheris") //hero - 3 - [2]
        archInactiveImages.append("athleteis") //hero - 4 - [3]
        archInactiveImages.append("musicianis") //hero - 5 - [4]
        archInactiveImages.append("scientistis") //hero - 6 - [5]
        archInactiveImages.append("designeris") //hero - 7 - [6]
        archInactiveImages.append("naturalistis") //hero - 8 - [7]
        archInactiveImages.append("selfreflectoris") //hero - 9 - [8]
        
        archInactiveImages.append("verbalis") //intel - 1 - [9]
        archInactiveImages.append("naturalisticis") //intel - 2 - [10]
        archInactiveImages.append("interpersonalis") //intel - 3 - [11]
        archInactiveImages.append("logicalis") //intel - 4 - [12]
        archInactiveImages.append("bodilyis") //intel - 5 - [13]
        archInactiveImages.append("intrapersonalis") //intel - 6 - [14]
        archInactiveImages.append("musicalis") //intel - 7 - [15]
        archInactiveImages.append("visualis") //intel - 8 - [16]
        archInactiveImages.append("existentialis") //intel - 9 - [17]
        
        archInactiveImages.append("socialactivitiesis") //collect - 1 - [18]
        archInactiveImages.append("musicis") //collect - 2 - [19]
        archInactiveImages.append("heirloomsis") //collect - 3 - [20]
        archInactiveImages.append("fitnessis") //collect - 4 - [21]
        archInactiveImages.append("aestheticsis") //collect - 5 - [22]
        archInactiveImages.append("natureis") //collect - 6 - [23]
        archInactiveImages.append("technologyis") //collect - 7 - [24]
        archInactiveImages.append("theatricalis") //collect - 8 - [25]
        archInactiveImages.append("selfimprovementis") //collect - 9 - [26]
        
        //load archActiveImages array
        archActiveImages.append("actoras") //hero - 1 - [0]
        archActiveImages.append("leaderas") //hero - 2 - [1]
        archActiveImages.append("philosopheras") //hero - 3 - [2]
        archActiveImages.append("athleteas") //hero - 4 - [3]
        archActiveImages.append("musicianas") //hero - 5 - [4]
        archActiveImages.append("scientistas") //hero - 6 - [5]
        archActiveImages.append("designeras") //hero - 7 - [6]
        archActiveImages.append("naturalistas") //hero - 8 - [7]
        archActiveImages.append("selfreflectoras") //hero - 9 - [8]
        
        archActiveImages.append("verbalas") //intel - 1 - [9]
        archActiveImages.append("naturalisticas") //intel - 2 - [10]
        archActiveImages.append("interpersonalas") //intel - 3 - [11]
        archActiveImages.append("logicalas") //intel - 4 - [12]
        archActiveImages.append("bodilyas") //intel - 5 - [13]
        archActiveImages.append("intrapersonalas") //intel - 6 - [14]
        archActiveImages.append("musicalas") //intel - 7 - [15]
        archActiveImages.append("visualas") //intel - 8 - [16]
        archActiveImages.append("existentialas") //intel - 9 - [17]
        
        archActiveImages.append("socialactivitiesas") //collect - 1 - [18]
        archActiveImages.append("musicas") //collect - 2 - [19]
        archActiveImages.append("heirloomsas") //collect - 3 - [20]
        archActiveImages.append("fitnessas") //collect - 4 - [21]
        archActiveImages.append("aestheticsas") //collect - 5 - [22]
        archActiveImages.append("natureas") //collect - 6 - [23]
        archActiveImages.append("technologyas") //collect - 7 - [24]
        archActiveImages.append("theatricalas") //collect - 8 - [25]
        archActiveImages.append("selfimprovementas") //collect - 9 - [26]
        
       //load imagelocations
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/actoras.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/leaderas.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/philosopheras.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/athleteas.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/musicianas.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/scientistas.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/designeras.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/naturalistas.png")
        archHeroImageLocs.append("http://www.mixotype.com/app/images/heroes/selfreflectoras.png")
        
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/verbalas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/naturalisticas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/interpersonalas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/logicalas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/bodilyas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/intrapersonalas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/musicalas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/visualas.png")
        archIntelImageLocs.append("http://www.mixotype.com/app/images/intelligences/existentialas.png")
        
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/socialactivitiesas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/musicas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/heirloomsas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/fitnessas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/aestheticsas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/natureas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/technologyas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/theatricalas.png")
        archCollectImageLocs.append("http://www.mixotype.com/app/images/collections/selfimprovementas.png")
        
        
        lngArch1 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch1(_:)))
        lngArch1.minimumPressDuration = 1
        lngArch2 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch2(_:)))
        lngArch2.minimumPressDuration = 1
        lngArch3 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch3(_:)))
        lngArch3.minimumPressDuration = 1
        lngArch4 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch4(_:)))
        lngArch4.minimumPressDuration = 1
        lngArch5 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch5(_:)))
        lngArch5.minimumPressDuration = 1
        lngArch6 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch6(_:)))
        lngArch6.minimumPressDuration = 1
        lngArch7 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch7(_:)))
        lngArch7.minimumPressDuration = 1
        lngArch8 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch8(_:)))
        lngArch8.minimumPressDuration = 1
        lngArch9 = UILongPressGestureRecognizer(target: self, action: #selector(MixoScene2aVC.lpArch9(_:)))
        lngArch9.minimumPressDuration = 1
        
        btnArchetype1.addGestureRecognizer(lngArch1)
        btnArchetype2.addGestureRecognizer(lngArch2)
        btnArchetype3.addGestureRecognizer(lngArch3)
        btnArchetype4.addGestureRecognizer(lngArch4)
        btnArchetype5.addGestureRecognizer(lngArch5)
        btnArchetype6.addGestureRecognizer(lngArch6)
        btnArchetype7.addGestureRecognizer(lngArch7)
        btnArchetype8.addGestureRecognizer(lngArch8)
        btnArchetype9.addGestureRecognizer(lngArch9)
        
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
        
        //hide the btnNext
        btnNext.isHidden = true
        
        //set up the UI
        Utilities.colorizeNavTabs(btnHeroNav,btnIntelNav,btnTalNav,btnColNav)
        setUpUI()
        
        //adjust tje progress bar
        progress()
    }
    
    
    //function to send the user data to Firebase
    func sendData(){
        //save the data to Firebase
        
        //create a string from the chosen heroes in heroChoiceState array
        var archString = String()
        for arch in archChoiceState {
            archString += String(arch)
        }
        
        
        
        switch(mixoState){
            case 1:
                //get the image urls for each chosen hero
                let archImage1 = archHeroImageLocs[archChoiceState[0]-1]
                let archImage2 = archHeroImageLocs[archChoiceState[1]-1]
                let archImage3 = archHeroImageLocs[archChoiceState[2]-1]
                let archImage4 = archHeroImageLocs[archChoiceState[3]-1]
                //send data to Firebase
                docRef.updateData([
                    "role_nest": archString,
                    "role_img1": archImage1,
                    "role_img2": archImage2,
                    "role_img3": archImage3,
                    "role_img4": archImage4,
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        let mixoScene3VC = mainSB.instantiateViewController(withIdentifier: "MixoScene3VC") as! MixoScene3VC
                        self.present(mixoScene3VC, animated:true, completion:nil)
                    }
                }
                break
            case 2:
                //get the image urls for each chosen intel
                let archImage1 = archIntelImageLocs[archChoiceState[0]-1]
                let archImage2 = archIntelImageLocs[archChoiceState[1]-1]
                let archImage3 = archIntelImageLocs[archChoiceState[2]-1]
                let archImage4 = archIntelImageLocs[archChoiceState[3]-1]
                
                let intel1 = archString[0]
                let intel2 = archString[1]
                let intel3 = archString[2]
                let intel4 = archString[3]
                var intel = String()
                
                switch intel1 {
                    case "1":
                        intel += "V1"
                        break
                    case "2":
                        intel += "N"
                        break
                    case "3":
                        intel += "I1"
                        break
                    case "4":
                        intel += "L"
                        break
                    case "5":
                        intel += "B"
                        break
                    case "6":
                        intel += "I2"
                        break
                    case "7":
                        intel += "M"
                        break
                    case "8":
                        intel += "V2"
                        break
                    case "9":
                        intel += "E"
                        break
                    default:
                        break
                }
                switch intel2 {
                    case "1":
                        intel += "V1"
                        break
                    case "2":
                        intel += "N"
                        break
                    case "3":
                        intel += "I1"
                        break
                    case "4":
                        intel += "L"
                        break
                    case "5":
                        intel += "B"
                        break
                    case "6":
                        intel += "I2"
                        break
                    case "7":
                        intel += "M"
                        break
                    case "8":
                        intel += "V2"
                        break
                    case "9":
                        intel += "E"
                        break
                    default:
                        break
                }
                switch intel3 {
                    case "1":
                        intel += "V1"
                        break
                    case "2":
                        intel += "N"
                        break
                    case "3":
                        intel += "I1"
                        break
                    case "4":
                        intel += "L"
                        break
                    case "5":
                        intel += "B"
                        break
                    case "6":
                        intel += "I2"
                        break
                    case "7":
                        intel += "M"
                        break
                    case "8":
                        intel += "V2"
                        break
                    case "9":
                        intel += "E"
                        break
                    default:
                        break
                }
                switch intel4 {
                    case "1":
                        intel += "V1"
                        break
                    case "2":
                        intel += "N"
                        break
                    case "3":
                        intel += "I1"
                        break
                    case "4":
                        intel += "L"
                        break
                    case "5":
                        intel += "B"
                        break
                    case "6":
                        intel += "I2"
                        break
                    case "7":
                        intel += "M"
                        break
                    case "8":
                        intel += "V2"
                        break
                    case "9":
                        intel += "E"
                        break
                    default:
                        break
                }
                
                let intel_sub: String = String(findIntel(intel: intel));
                
                //send data to Firebase
                docRef.updateData([
                    "intel_nest": archString,
                    "intel_img1": archImage1,
                    "intel_img2": archImage2,
                    "intel_img3": archImage3,
                    "intel_img4": archImage4,
                    "intel_sub": intel_sub,
                    "intel": intel,
                    "intel_done": "Y",
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //move to MixoScene4a
                        let mixoScene4bVC = mainSB.instantiateViewController(withIdentifier: "MixoScene4bVC") as! MixoScene4bVC
                        self.present(mixoScene4bVC, animated:true, completion:nil)
                    }
                }
                break
            case 4:
                //get the image urls for each chosen hero
                let archImage1 = archCollectImageLocs[archChoiceState[0]-1]
                let archImage2 = archCollectImageLocs[archChoiceState[1]-1]
                let archImage3 = archCollectImageLocs[archChoiceState[2]-1]
                let archImage4 = archCollectImageLocs[archChoiceState[3]-1]
                //send data to Firebase
                docRef.updateData([
                    "collect_nest": archString,
                    "collect_img1": archImage1,
                    "collect_img2": archImage2,
                    "collect_img3": archImage3,
                    "collect_img4": archImage4,
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        //move to MixoScene3
                        let mixoScene3VC = mainSB.instantiateViewController(withIdentifier: "MixoScene3VC") as! MixoScene3VC
                        self.present(mixoScene3VC, animated:true, completion:nil)
                    }
                }
                break
            default:
                break
        }
        
        
    }
    
    //function to set up the UI
    func setUpUI() {
        //load the archetype images & style the Nav fields according to mixoState
        switch(mixoState){
            case 1:
                Utilities.styleGreyFilledButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyOutlinedButton(btnTalNav)
                Utilities.styleGreyOutlinedButton(btnColNav)
                btnArchetype1.setImage(UIImage(named: archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype2.setImage(UIImage(named: archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype3.setImage(UIImage(named: archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype4.setImage(UIImage(named: archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype5.setImage(UIImage(named: archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype6.setImage(UIImage(named: archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype7.setImage(UIImage(named: archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype8.setImage(UIImage(named: archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype9.setImage(UIImage(named: archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                lblArchetypeText.text = "Select the (4) Hero Types that best represent who you are at the core, and rank them in order of importance from 1(most) - 4(least)"
            break
            case 2:
                Utilities.styleGreyOutlinedButton(btnHeroNav)
                Utilities.styleGreyFilledButton(btnIntelNav)
                Utilities.styleGreyOutlinedButton(btnTalNav)
                Utilities.styleGreyOutlinedButton(btnColNav)
                btnArchetype1.setImage(UIImage(named: archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype2.setImage(UIImage(named: archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype3.setImage(UIImage(named: archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype4.setImage(UIImage(named: archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype5.setImage(UIImage(named: archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype6.setImage(UIImage(named: archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype7.setImage(UIImage(named: archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype8.setImage(UIImage(named: archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype9.setImage(UIImage(named: archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                lblArchetypeText.text = "Select (4) Intelligence Types that you exhibit best on a daily basis, and rank them in order of importance from 1(most) - 4(least)"
                break
            case 4:
                Utilities.styleGreyOutlinedButton(btnHeroNav)
                Utilities.styleGreyOutlinedButton(btnIntelNav)
                Utilities.styleGreyOutlinedButton(btnTalNav)
                Utilities.styleGreyFilledButton(btnColNav)
                btnArchetype1.setImage(UIImage(named: archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype2.setImage(UIImage(named: archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype3.setImage(UIImage(named: archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype4.setImage(UIImage(named: archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype5.setImage(UIImage(named: archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype6.setImage(UIImage(named: archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype7.setImage(UIImage(named: archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype8.setImage(UIImage(named: archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                btnArchetype9.setImage(UIImage(named: archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                lblArchetypeText.text = "Select the (4) Collection Types that you value most, and rank them in order of importance from 1(most) - 4(least)"
                break
            default:
                break
        }
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
    
    func archTap(arch: Int){

        //get the tag of the button
        let tappedArch = arch
            
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

                switch tappedArch {
                    case 1  :
                        lblArchetype1.text = cl
                        lblArchetype1.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype1.setImage(UIImage(named: archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype1.setImage(UIImage(named: archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype1.setImage(UIImage(named: archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 2  :
                        lblArchetype2.text = cl
                        lblArchetype2.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype2.setImage(UIImage(named: archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype2.setImage(UIImage(named: archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype2.setImage(UIImage(named: archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 3  :
                        lblArchetype3.text = cl
                        lblArchetype3.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype3.setImage(UIImage(named: archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype3.setImage(UIImage(named: archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype3.setImage(UIImage(named: archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 4  :
                        lblArchetype4.text = cl
                        lblArchetype4.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype4.setImage(UIImage(named: archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype4.setImage(UIImage(named: archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype4.setImage(UIImage(named: archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 5  :
                        lblArchetype5.text = cl
                        lblArchetype5.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype5.setImage(UIImage(named: archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype5.setImage(UIImage(named: archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype5.setImage(UIImage(named: archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 6  :
                        lblArchetype6.text = cl
                        lblArchetype6.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype6.setImage(UIImage(named: archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype6.setImage(UIImage(named: archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype6.setImage(UIImage(named: archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 7  :
                        lblArchetype7.text = cl
                        lblArchetype7.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype7.setImage(UIImage(named: archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype7.setImage(UIImage(named: archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype7.setImage(UIImage(named: archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 8  :
                        lblArchetype8.text = cl
                        lblArchetype8.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype8.setImage(UIImage(named: archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype8.setImage(UIImage(named: archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype8.setImage(UIImage(named: archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 9  :
                        lblArchetype9.text = zs
                        lblArchetype9.isHidden = true

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype9.setImage(UIImage(named: archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype9.setImage(UIImage(named: archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype9.setImage(UIImage(named: archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
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

                switch tappedArch {
                    case 1  :
                        lblArchetype1.text = zs
                        lblArchetype1.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype1.setImage(UIImage(named: archActiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype1.setImage(UIImage(named: archActiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype1.setImage(UIImage(named: archActiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 2  :
                        lblArchetype2.text = zs
                        lblArchetype2.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype2.setImage(UIImage(named: archActiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype2.setImage(UIImage(named: archActiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype2.setImage(UIImage(named: archActiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 3  :
                        lblArchetype3.text = zs
                        lblArchetype3.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype3.setImage(UIImage(named: archActiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype3.setImage(UIImage(named: archActiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype3.setImage(UIImage(named: archActiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 4  :
                        lblArchetype4.text = zs
                        lblArchetype4.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype4.setImage(UIImage(named: archActiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype4.setImage(UIImage(named: archActiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype4.setImage(UIImage(named: archActiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 5  :
                        lblArchetype5.text = zs
                        lblArchetype5.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype5.setImage(UIImage(named: archActiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype5.setImage(UIImage(named: archActiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype5.setImage(UIImage(named: archActiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 6  :
                        lblArchetype6.text = zs
                        lblArchetype6.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype6.setImage(UIImage(named: archActiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype6.setImage(UIImage(named: archActiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype6.setImage(UIImage(named: archActiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 7  :
                        lblArchetype7.text = zs
                        lblArchetype7.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype7.setImage(UIImage(named: archActiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype7.setImage(UIImage(named: archActiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype7.setImage(UIImage(named: archActiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 8  :
                        lblArchetype8.text = zs
                        lblArchetype8.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype8.setImage(UIImage(named: archActiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype8.setImage(UIImage(named: archActiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype8.setImage(UIImage(named: archActiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
                        break
                    case 9  :
                        lblArchetype9.text = zs
                        lblArchetype9.isHidden = false

                        //change image state according to mixoState
                        switch(mixoState){
                            case 1:
                                btnArchetype9.setImage(UIImage(named: archActiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 2:
                                btnArchetype9.setImage(UIImage(named: archActiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            case 4:
                                btnArchetype9.setImage(UIImage(named: archActiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                break
                            default:
                                break
                        }
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

                           switch tappedArch {
                               case 1  :
                                   lblArchetype1.text = cl
                                   lblArchetype1.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype1.setImage(UIImage(named: archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype1.setImage(UIImage(named: archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype1.setImage(UIImage(named: archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 2  :
                                   lblArchetype2.text = cl
                                   lblArchetype2.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype2.setImage(UIImage(named: archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype2.setImage(UIImage(named: archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype2.setImage(UIImage(named: archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 3  :
                                   lblArchetype3.text = cl
                                   lblArchetype3.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype3.setImage(UIImage(named: archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype3.setImage(UIImage(named: archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype3.setImage(UIImage(named: archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 4  :
                                   lblArchetype4.text = cl
                                   lblArchetype4.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype4.setImage(UIImage(named: archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype4.setImage(UIImage(named: archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype4.setImage(UIImage(named: archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 5  :
                                   lblArchetype5.text = cl
                                   lblArchetype5.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype5.setImage(UIImage(named: archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype5.setImage(UIImage(named: archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype5.setImage(UIImage(named: archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 6  :
                                   lblArchetype6.text = cl
                                   lblArchetype6.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype6.setImage(UIImage(named: archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype6.setImage(UIImage(named: archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype6.setImage(UIImage(named: archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 7  :
                                   lblArchetype7.text = cl
                                   lblArchetype7.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype7.setImage(UIImage(named: archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype7.setImage(UIImage(named: archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype7.setImage(UIImage(named: archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 8  :
                                   lblArchetype8.text = cl
                                   lblArchetype8.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype8.setImage(UIImage(named: archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype8.setImage(UIImage(named: archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype8.setImage(UIImage(named: archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 9  :
                                   lblArchetype9.text = zs
                                   lblArchetype9.isHidden = true

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype9.setImage(UIImage(named: archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype9.setImage(UIImage(named: archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype9.setImage(UIImage(named: archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               default :
                                   return
                           }
                       } else {

                           print("Initial Add")

                           //add tappedArch to array
                           archChoiceState.append(tappedArch)

                           let zeroSet = archChoiceState.firstIndex(of: tappedArch)! + 1
                           zs = String(zeroSet)

                           print(archChoiceState)

                           switch tappedArch {
                               case 1  :
                                   lblArchetype1.text = zs
                                   lblArchetype1.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype1.setImage(UIImage(named: archActiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype1.setImage(UIImage(named: archActiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype1.setImage(UIImage(named: archActiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 2  :
                                   lblArchetype2.text = zs
                                   lblArchetype2.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype2.setImage(UIImage(named: archActiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype2.setImage(UIImage(named: archActiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype2.setImage(UIImage(named: archActiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 3  :
                                   lblArchetype3.text = zs
                                   lblArchetype3.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype3.setImage(UIImage(named: archActiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype3.setImage(UIImage(named: archActiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype3.setImage(UIImage(named: archActiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 4  :
                                   lblArchetype4.text = zs
                                   lblArchetype4.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype4.setImage(UIImage(named: archActiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype4.setImage(UIImage(named: archActiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype4.setImage(UIImage(named: archActiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 5  :
                                   lblArchetype5.text = zs
                                   lblArchetype5.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype5.setImage(UIImage(named: archActiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype5.setImage(UIImage(named: archActiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype5.setImage(UIImage(named: archActiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 6  :
                                   lblArchetype6.text = zs
                                   lblArchetype6.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype6.setImage(UIImage(named: archActiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype6.setImage(UIImage(named: archActiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype6.setImage(UIImage(named: archActiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 7  :
                                   lblArchetype7.text = zs
                                   lblArchetype7.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype7.setImage(UIImage(named: archActiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                        case 2:
                                            btnArchetype7.setImage(UIImage(named: archActiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                            break
                                       case 4:
                                           btnArchetype7.setImage(UIImage(named: archActiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 8  :
                                   lblArchetype8.text = zs
                                   lblArchetype8.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype8.setImage(UIImage(named: archActiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype8.setImage(UIImage(named: archActiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype8.setImage(UIImage(named: archActiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 9  :
                                   lblArchetype9.text = zs
                                   lblArchetype9.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype9.setImage(UIImage(named: archActiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype9.setImage(UIImage(named: archActiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype9.setImage(UIImage(named: archActiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
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
                   if(archChoiceState.contains(tappedArch)){

                       print("Remove Hero from full array")
                       guard let choiceLoc = archChoiceState.firstIndex(of: tappedArch) else { return }

                       //archChoiceState.insert(choiceLoc, at: 0)
                       archChoiceState[choiceLoc] = 0
                       cl = String(choiceLoc)
                       print(archChoiceState)

                       switch tappedArch {
                           case 1  :
                               lblArchetype1.text = cl
                               lblArchetype1.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype1.setImage(UIImage(named: archInactiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype1.setImage(UIImage(named: archInactiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype1.setImage(UIImage(named: archInactiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 2  :
                               lblArchetype2.text = cl
                               lblArchetype2.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype2.setImage(UIImage(named: archInactiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype2.setImage(UIImage(named: archInactiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype2.setImage(UIImage(named: archInactiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 3  :
                               lblArchetype3.text = cl
                               lblArchetype3.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype3.setImage(UIImage(named: archInactiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype3.setImage(UIImage(named: archInactiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype3.setImage(UIImage(named: archInactiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 4  :
                               lblArchetype4.text = cl
                               lblArchetype4.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype4.setImage(UIImage(named: archInactiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype4.setImage(UIImage(named: archInactiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype4.setImage(UIImage(named: archInactiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 5  :
                               lblArchetype5.text = cl
                               lblArchetype5.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype5.setImage(UIImage(named: archInactiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype5.setImage(UIImage(named: archInactiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype5.setImage(UIImage(named: archInactiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 6  :
                               lblArchetype6.text = cl
                               lblArchetype6.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype6.setImage(UIImage(named: archInactiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype6.setImage(UIImage(named: archInactiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype6.setImage(UIImage(named: archInactiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 7  :
                               lblArchetype7.text = cl
                               lblArchetype7.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype7.setImage(UIImage(named: archInactiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype7.setImage(UIImage(named: archInactiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype7.setImage(UIImage(named: archInactiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 8  :
                               lblArchetype8.text = cl
                               lblArchetype8.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype8.setImage(UIImage(named: archInactiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype8.setImage(UIImage(named: archInactiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype8.setImage(UIImage(named: archInactiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           case 9  :
                               lblArchetype9.text = zs
                               lblArchetype9.isHidden = true

                               //change image state according to mixoState
                               switch(mixoState){
                                   case 1:
                                       btnArchetype9.setImage(UIImage(named: archInactiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 2:
                                       btnArchetype9.setImage(UIImage(named: archInactiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   case 4:
                                       btnArchetype9.setImage(UIImage(named: archInactiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                       break
                                   default:
                                       break
                               }
                               break
                           default :
                               return
                       }

                       if(archChoiceState.contains(0)){
                           btnNext.isHidden = true
                       }
                   } else {

                       if(acsSize == 4 && !archChoiceState.contains(0)) {
                        
                            switch(mixoState){
                                case 1:
                                    warningInt = 1
                                    break
                                case 2:
                                    warningInt = 2
                                    break
                                case 4:
                                    warningInt = 4
                                    break
                                default:
                                    break
                            }
                           
                            let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
                            self.present(warningVC, animated:true, completion:nil)
                       } else {

                           print("ReAdd hero to full array")
                           guard let choiceLoc = archChoiceState.firstIndex(of: 0) else { return }
                           let zeroSet = archChoiceState.firstIndex(of: 0)! + 1
                           zs = String(zeroSet)
                           archChoiceState[choiceLoc] = tappedArch
                           print(archChoiceState)

                           switch tappedArch {
                               case 1  :
                                   lblArchetype1.text = zs
                                   lblArchetype1.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype1.setImage(UIImage(named: archActiveImages[0])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype1.setImage(UIImage(named: archActiveImages[9])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype1.setImage(UIImage(named: archActiveImages[18])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 2  :
                                   lblArchetype2.text = zs
                                   lblArchetype2.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype2.setImage(UIImage(named: archActiveImages[1])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype2.setImage(UIImage(named: archActiveImages[10])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype2.setImage(UIImage(named: archActiveImages[19])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 3  :
                                   lblArchetype3.text = zs
                                   lblArchetype3.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype3.setImage(UIImage(named: archActiveImages[2])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype3.setImage(UIImage(named: archActiveImages[11])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype3.setImage(UIImage(named: archActiveImages[20])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 4  :
                                   lblArchetype4.text = zs
                                   lblArchetype4.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype4.setImage(UIImage(named: archActiveImages[3])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype4.setImage(UIImage(named: archActiveImages[12])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype4.setImage(UIImage(named: archActiveImages[21])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 5  :
                                   lblArchetype5.text = zs
                                   lblArchetype5.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype5.setImage(UIImage(named: archActiveImages[4])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype5.setImage(UIImage(named: archActiveImages[13])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype5.setImage(UIImage(named: archActiveImages[22])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 6  :
                                   lblArchetype6.text = zs
                                   lblArchetype6.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype6.setImage(UIImage(named: archActiveImages[5])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype6.setImage(UIImage(named: archActiveImages[14])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype6.setImage(UIImage(named: archActiveImages[23])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 7  :
                                   lblArchetype7.text = zs
                                   lblArchetype7.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype7.setImage(UIImage(named: archActiveImages[6])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype7.setImage(UIImage(named: archActiveImages[15])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype7.setImage(UIImage(named: archActiveImages[24])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 8  :
                                   lblArchetype8.text = zs
                                   lblArchetype8.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype8.setImage(UIImage(named: archActiveImages[7])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype8.setImage(UIImage(named: archActiveImages[16])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype8.setImage(UIImage(named: archActiveImages[25])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
                                   break
                               case 9  :
                                   lblArchetype9.text = zs
                                   lblArchetype9.isHidden = false

                                   //change image state according to mixoState
                                   switch(mixoState){
                                       case 1:
                                           btnArchetype9.setImage(UIImage(named: archActiveImages[8])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 2:
                                           btnArchetype9.setImage(UIImage(named: archActiveImages[17])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       case 4:
                                           btnArchetype9.setImage(UIImage(named: archActiveImages[26])?.withRenderingMode(.alwaysOriginal), for: .normal)
                                           break
                                       default:
                                           break
                                   }
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
    
    //function that handles getting the definition of the arch
    func archLongTap(arch: Int){
        let tappedArch = arch
        var archTag = String()
        var archType = String()
        
        switch(mixoState){
            case 1:
                switch tappedArch {
                    case 1  :
                        archTag = "1"
                        archType = "hero"
                    case 2  :
                        archTag = "2"
                        archType = "hero"
                    case 3  :
                        archTag = "3"
                        archType = "hero"
                    case 4  :
                        archTag = "4"
                        archType = "hero"
                    case 5  :
                        archTag = "5"
                        archType = "hero"
                    case 6  :
                        archTag = "6"
                        archType = "hero"
                    case 7  :
                        archTag = "7"
                        archType = "hero"
                    case 8  :
                        archTag = "8"
                        archType = "hero"
                    case 9  :
                        archTag = "9"
                        archType = "hero"
                    default :
                        return
                }
                break
                
            case 2:
                switch tappedArch {
                    case 1  :
                        archTag = "1"
                        archType = "intel"
                    case 2  :
                        archTag = "2"
                        archType = "intel"
                    case 3  :
                        archTag = "3"
                        archType = "intel"
                    case 4  :
                        archTag = "4"
                        archType = "intel"
                    case 5  :
                        archTag = "5"
                        archType = "intel"
                    case 6  :
                        archTag = "6"
                        archType = "intel"
                    case 7  :
                        archTag = "7"
                        archType = "intel"
                    case 8  :
                        archTag = "8"
                        archType = "intel"
                    case 9  :
                        archTag = "9"
                        archType = "intel"
                    default :
                        return
                }
                break
                
            case 4:
                switch tappedArch {
                    case 1  :
                        archTag = "1"
                        archType = "col"
                    case 2  :
                        archTag = "2"
                        archType = "col"
                    case 3  :
                        archTag = "3"
                        archType = "col"
                    case 4  :
                        archTag = "4"
                        archType = "col"
                    case 5  :
                        archTag = "5"
                        archType = "col"
                    case 6  :
                        archTag = "6"
                        archType = "col"
                    case 7  :
                        archTag = "7"
                        archType = "col"
                    case 8  :
                        archTag = "8"
                        archType = "col"
                    case 9  :
                        archTag = "9"
                        archType = "col"
                    default :
                        return
                }
                break
                
            default:
                break
        }
        
        //get data from server
        let queryParams: [String: String] = [
            "tag": archTag,
            "type": archType
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "mixotype.com"
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
    
    @IBAction func btnNext(_ sender: Any) {
        sendData()
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
            print("bypass")
            mixoState = 3
            let mixoScene1VC = mainSB.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
            self.present(mixoScene1VC, animated:true, completion:nil)
        }
    }
    
    
} //EOF

func findIntel(intel: String) -> Int{
    var intelSub: Int = 0
    let intelArray: [String] = [
        "V1NI1L", "V1NI1B", "V1NI1I2", "V1NI1M", "V1NI1V2", "V1NI1E", "V1NLI1", "V1NLB", "V1NLI2", "V1NLM", "V1NLV2", "V1NLE", "V1NBI1", "V1NBL", "V1NBI2", "V1NBM", "V1NBV2", "V1NBE", "V1NI2I1", "V1NI2L", "V1NI2B", "V1NI2M", "V1NI2V2", "V1NI2E", "V1NMI1", "V1NML", "V1NMB", "V1NMI2", "V1NMV2", "V1NME", "V1NV2I1", "V1NV2L", "V1NV2B", "V1NV2I2", "V1NV2M", "V1NV2E", "V1NEI1", "V1NEL", "V1NEB", "V1NEI2", "V1NEM", "V1NEV2", "V1I1NE", "V1I1NL", "V1I1NB", "V1I1NI2", "V1I1NM", "V1I1NV2", "V1I1LE", "V1I1LN", "V1I1LB", "V1I1LI2", "V1I1LM", "V1I1LV2", "V1I1BE", "V1I1BN", "V1I1BL", "V1I1BI2", "V1I1BM", "V1I1BV2", "V1I1I2E", "V1I1I2N", "V1I1I2L", "V1I1I2B", "V1I1I2M", "V1I1I2V2", "V1I1ME", "V1I1MN", "V1I1ML", "V1I1MB", "V1I1MI2", "V1I1MV2", "V1I1V2E", "V1I1V2N", "V1I1V2L", "V1I1V2B", "V1I1V2I2", "V1I1V2M", "V1I1EV2", "V1I1EN", "V1I1EL", "V1I1EB", "V1I1EI2", "V1I1EM", "V1LNV2", "V1LNE", "V1LNI1", "V1LNB", "V1LNI2", "V1LNM", "V1LI1V2", "V1LI1E", "V1LI1N", "V1LI1B", "V1LI1I2", "V1LI1M", "V1LBV2", "V1LBE", "V1LBN", "V1LBI1", "V1LBI2", "V1LBM", "V1LI2V2", "V1LI2E", "V1LI2N", "V1LI2I1", "V1LI2B", "V1LI2M", "V1LMV2", "V1LME", "V1LMN", "V1LMI1", "V1LMB", "V1LMI2", "V1LV2M", "V1LV2E", "V1LV2N", "V1LV2I1", "V1LV2B", "V1LV2I2", "V1LEM", "V1LEV2", "V1LEN", "V1LEI1", "V1LEB", "V1LEI2", "V1BNM", "V1BNV2", "V1BNE", "V1BNI1", "V1BNL", "V1BNI2", "V1BI1M", "V1BI1V2", "V1BI1E", "V1BI1N", "V1BI1L", "V1BI1I2", "V1BLM", "V1BLV2", "V1BLE", "V1BLN", "V1BLI1", "V1BLI2", "V1BI2M", "V1BI2V2", "V1BI2E", "V1BI2N", "V1BI2I1", "V1BI2L", "V1BMI2", "V1BMV2", "V1BME", "V1BMN", "V1BMI1", "V1BML", "V1BV2I2", "V1BV2M", "V1BV2E", "V1BV2N", "V1BV2I1", "V1BV2L", "V1BEI2", "V1BEM", "V1BEV2", "V1BEN", "V1BEI1", "V1BEL", "V1I2NB", "V1I2NM", "V1I2NV2", "V1I2NE", "V1I2NI1", "V1I2NL", "V1I2I1B", "V1I2I1M", "V1I2I1V2", "V1I2I1E", "V1I2I1N", "V1I2I1L", "V1I2LB", "V1I2LM", "V1I2LV2", "V1I2LE", "V1I2LN", "V1I2LI1", "V1I2BL", "V1I2BM", "V1I2BV2", "V1I2BE", "V1I2BN", "V1I2BI1", "V1I2ML", "V1I2MB", "V1I2MV2", "V1I2ME", "V1I2MN", "V1I2MI1", "V1I2V2L", "V1I2V2B", "V1I2V2M", "V1I2V2E", "V1I2V2N", "V1I2V2I1", "V1I2EL", "V1I2EB", "V1I2EM", "V1I2EV2", "V1I2EN", "V1I2EI1", "V1MNL", "V1MNB", "V1MNI2", "V1MNV2", "V1MNE", "V1MNI1", "V1MI1L", "V1MI1B", "V1MI1I2", "V1MI1V2", "V1MI1E", "V1MI1N", "V1MLI1", "V1MLB", "V1MLI2", "V1MLV2", "V1MLE", "V1MLN", "V1MBI1", "V1MBL", "V1MBI2", "V1MBV2", "V1MBE", "V1MBN", "V1MI2I1", "V1MI2L", "V1MI2B", "V1MI2V2", "V1MI2E", "V1MI2N", "V1MV2I1", "V1MV2L", "V1MV2B", "V1MV2I2", "V1MV2E", "V1MV2N", "V1MEI1", "V1MEL", "V1MEB", "V1MEI2", "V1MEV2", "V1MEN", "V1V2NI1", "V1V2NL", "V1V2NB", "V1V2NI2", "V1V2NM", "V1V2NE", "V1V2I1N", "V1V2I1L", "V1V2I1B", "V1V2I1I2", "V1V2I1M", "V1V2I1E", "V1V2LN", "V1V2LI1", "V1V2LB", "V1V2LI2", "V1V2LM", "V1V2LE", "V1V2BN", "V1V2BI1", "V1V2BL", "V1V2BI2", "V1V2BM", "V1V2BE", "V1V2I2N", "V1V2I2I1", "V1V2I2L", "V1V2I2B", "V1V2I2M", "V1V2I2E", "V1V2MN", "V1V2MI1", "V1V2ML", "V1V2MB", "V1V2MI2", "V1V2ME", "V1V2EN", "V1V2EI1", "V1V2EL", "V1V2EB", "V1V2EI2", "V1V2EM", "V1ENV2", "V1ENI1", "V1ENL", "V1ENB", "V1ENI2", "V1ENM", "V1EI1V2", "V1EI1N", "V1EI1L", "V1EI1B", "V1EI1I2", "V1EI1M", "V1ELV2", "V1ELN", "V1ELI1", "V1ELB", "V1ELI2", "V1ELM", "V1EBV2", "V1EBN", "V1EBI1", "V1EBL", "V1EBI2", "V1EBM", "V1EI2V2", "V1EI2N", "V1EI2I1", "V1EI2L", "V1EI2B", "V1EI2M", "V1EMV2", "V1EMN", "V1EMI1", "V1EML", "V1EMB", "V1EMI2", "V1EV2M", "V1EV2N", "V1EV2I1", "V1EV2L", "V1EV2B", "V1EV2I2",
                "NV1EM", "NV1EV2", "NV1EI1", "NV1EL", "NV1EB", "NV1EI2", "NV1I1M", "NV1I1V2", "NV1I1E", "NV1I1L", "NV1I1B", "NV1I1I2", "NV1LM", "NV1LV2", "NV1LE", "NV1LI1", "NV1LB", "NV1LI2", "NV1BM", "NV1BV2", "NV1BE", "NV1BI1", "NV1BL", "NV1BI2", "NV1I2M", "NV1I2V2", "NV1I2E", "NV1I2I1", "NV1I2L", "NV1I2B", "NV1MI2", "NV1MV2", "NV1ME", "NV1MI1", "NV1ML", "NV1MB", "NV1V2I2", "NV1V2M", "NV1V2E", "NV1V2I1", "NV1V2L", "NV1V2B", "NI1EI2", "NI1EM", "NI1EV2", "NI1EV1", "NI1EL", "NI1EB", "NI1V1I2", "NI1V1M", "NI1V1V2", "NI1V1E", "NI1V1L", "NI1V1B", "NI1LI2", "NI1LM", "NI1LV2", "NI1LE", "NI1LV1", "NI1LB", "NI1BI2", "NI1BM", "NI1BV2", "NI1BE", "NI1BV1", "NI1BL", "NI1I2B", "NI1I2M", "NI1I2V2", "NI1I2E", "NI1I2V1", "NI1I2L", "NI1MB", "NI1MI2", "NI1MV2", "NI1ME", "NI1MV1", "NI1ML", "NI1V2B", "NI1V2I2", "NI1V2M", "NI1V2E", "NI1V2V1", "NI1V2L", "NLEB", "NLEI2", "NLEM", "NLEV2", "NLEV1", "NLEI1", "NLV1B", "NLV1I2", "NLV1M", "NLV1V2", "NLV1E", "NLV1I1", "NLI1B", "NLI1I2", "NLI1M", "NLI1V2", "NLI1E", "NLI1V1", "NLBI1", "NLBI2", "NLBM", "NLBV2", "NLBE", "NLBV1", "NLI2I1", "NLI2B", "NLI2M", "NLI2V2", "NLI2E", "NLI2V1", "NLMI1", "NLMB", "NLMI2", "NLMV2", "NLME", "NLMV1", "NLV2I1", "NLV2B", "NLV2I2", "NLV2M", "NLV2E", "NLV2V1", "NBEI1", "NBEL", "NBEI2", "NBEM", "NBEV2", "NBEV1", "NBV1I1", "NBV1L", "NBV1I2", "NBV1M", "NBV1V2", "NBV1E", "NBI1V1", "NBI1L", "NBI1I2", "NBI1M", "NBI1V2", "NBI1E", "NBLV1", "NBLI1", "NBLI2", "NBLM", "NBLV2", "NBLE", "NBI2V1", "NBI2I1", "NBI2L", "NBI2M", "NBI2V2", "NBI2E", "NBMV1", "NBMI1", "NBML", "NBMI2", "NBMV2", "NBME", "NBV2V1", "NBV2I1", "NBV2L", "NBV2I2", "NBV2M", "NBV2E", "NI2EV1", "NI2EI1", "NI2EL", "NI2EB", "NI2EM", "NI2EV2", "NI2V1E", "NI2V1I1", "NI2V1L", "NI2V1B", "NI2V1M", "NI2V1V2", "NI2I1E", "NI2I1V1", "NI2I1L", "NI2I1B", "NI2I1M", "NI2I1V2", "NI2LE", "NI2LV1", "NI2LI1", "NI2LB", "NI2LM", "NI2LV2", "NI2BE", "NI2BV1", "NI2BI1", "NI2BL", "NI2BM", "NI2BV2", "NI2ME", "NI2MV1", "NI2MI1", "NI2ML", "NI2MB", "NI2MV2", "NI2V2E", "NI2V2V1", "NI2V2I1", "NI2V2L", "NI2V2B", "NI2V2M", "NMEV2", "NMEV1", "NMEI1", "NMEL", "NMEB", "NMEI2", "NMV1V2", "NMV1E", "NMV1I1", "NMV1L", "NMV1B", "NMV1I2", "NMI1V2", "NMI1E", "NMI1V1", "NMI1L", "NMI1B", "NMI1I2", "NMLV2", "NMLE", "NMLV1", "NMLI1", "NMLB", "NMLI2", "NMBV2", "NMBE", "NMBV1", "NMBI1", "NMBL", "NMBI2", "NMI2V2", "NMI2E", "NMI2V1", "NMI2I1", "NMI2L", "NMI2B", "NMV2I2", "NMV2E", "NMV2V1", "NMV2I1", "NMV2L", "NMV2B", "NV2EI2", "NV2EM", "NV2EV1", "NV2EI1", "NV2EL", "NV2EB", "NV2V1I2", "NV2V1M", "NV2V1E", "NV2V1I1", "NV2V1L", "NV2V1B", "NV2I1I2", "NV2I1M", "NV2I1E", "NV2I1V1", "NV2I1L", "NV2I1B", "NV2LI2", "NV2LM", "NV2LE", "NV2LV1", "NV2LI1", "NV2LB", "NV2BI2", "NV2BM", "NV2BE", "NV2BV1", "NV2BI1", "NV2BL", "NV2I2B", "NV2I2M", "NV2I2E", "NV2I2V1", "NV2I2I1", "NV2I2L", "NV2MB", "NV2MI2", "NV2ME", "NV2MV1", "NV2MI1", "NV2ML", "NEV2B", "NEV2I2", "NEV2M", "NEV2V1", "NEV2I1", "NEV2L", "NEV1B", "NEV1I2", "NEV1M", "NEV1V2", "NEV1I1", "NEV1L", "NEI1B", "NEI1I2", "NEI1M", "NEI1V2", "NEI1V1", "NEI1L", "NELB", "NELI2", "NELM", "NELV2", "NELV1", "NELI1", "NEBL", "NEBI2", "NEBM", "NEBV2", "NEBV1", "NEBI1", "NEI2L", "NEI2B", "NEI2M", "NEI2V2", "NEI2V1", "NEI2I1", "NEML", "NEMB", "NEMI2", "NEMV2", "NEMV1", "NEMI1",
                "I1V1V2L", "I1V1V2B", "I1V1V2I2", "I1V1V2M", "I1V1V2E", "I1V1V2N", "I1V1EL", "I1V1EB", "I1V1EI2", "I1V1EM", "I1V1EV2", "I1V1EN", "I1V1NL", "I1V1NB", "I1V1NI2", "I1V1NM", "I1V1NV2", "I1V1NE", "I1V1LN", "I1V1LB", "I1V1LI2", "I1V1LM", "I1V1LV2", "I1V1LE", "I1V1BN", "I1V1BL", "I1V1BI2", "I1V1BM", "I1V1BV2", "I1V1BE", "I1V1I2N", "I1V1I2L", "I1V1I2B", "I1V1I2M", "I1V1I2V2", "I1V1I2E", "I1V1MN", "I1V1ML", "I1V1MB", "I1V1MI2", "I1V1MV2", "I1V1ME", "I1NV2V1", "I1NV2L", "I1NV2B", "I1NV2I2", "I1NV2M", "I1NV2E", "I1NEV1", "I1NEL", "I1NEB", "I1NEI2", "I1NEM", "I1NEV2", "I1NV1E", "I1NV1L", "I1NV1B", "I1NV1I2", "I1NV1M", "I1NV1V2", "I1NLE", "I1NLV1", "I1NLB", "I1NLI2", "I1NLM", "I1NLV2", "I1NBE", "I1NBV1", "I1NBL", "I1NBI2", "I1NBM", "I1NBV2", "I1NI2E", "I1NI2V1", "I1NI2L", "I1NI2B", "I1NI2M", "I1NI2V2", "I1NME", "I1NMV1", "I1NML", "I1NMB", "I1NMI2", "I1NMV2", "I1LV2E", "I1LV2V1", "I1LV2N", "I1LV2B", "I1LV2I2", "I1LV2M", "I1LEV2", "I1LEV1", "I1LEN", "I1LEB", "I1LEI2", "I1LEM", "I1LV1V2", "I1LV1E", "I1LV1N", "I1LV1B", "I1LV1I2", "I1LV1M", "I1LNV2", "I1LNE", "I1LNV1", "I1LNB", "I1LNI2", "I1LNM", "I1LBV2", "I1LBE", "I1LBV1", "I1LBN", "I1LBI2", "I1LBM", "I1LI2V2", "I1LI2E", "I1LI2V1", "I1LI2N", "I1LI2B", "I1LI2M", "I1LMV2", "I1LME", "I1LMV1", "I1LMN", "I1LMB", "I1LMI2", "I1BV2M", "I1BV2E", "I1BV2V1", "I1BV2N", "I1BV2L", "I1BV2I2", "I1BEM", "I1BEV2", "I1BEV1", "I1BEN", "I1BEL", "I1BEI2", "I1BV1M", "I1BV1V2", "I1BV1E", "I1BV1N", "I1BV1L", "I1BV1I2", "I1BNM", "I1BNV2", "I1BNE", "I1BNV1", "I1BNL", "I1BNI2", "I1BLM", "I1BLV2", "I1BLE", "I1BLV1", "I1BLN", "I1BLI2", "I1BI2M", "I1BI2V2", "I1BI2E", "I1BI2V1", "I1BI2N", "I1BI2L", "I1BMI2", "I1BMV2", "I1BME", "I1BMV1", "I1BMN", "I1BML", "I1I2V2B", "I1I2V2M", "I1I2V2E", "I1I2V2V1", "I1I2V2N", "I1I2V2L", "I1I2EB", "I1I2EM", "I1I2EV2", "I1I2EV1", "I1I2EN", "I1I2EL", "I1I2V1B", "I1I2V1M", "I1I2V1V2", "I1I2V1E", "I1I2V1N", "I1I2V1L", "I1I2NB", "I1I2NM", "I1I2NV2", "I1I2NE", "I1I2NV1", "I1I2NL", "I1I2LB", "I1I2LM", "I1I2LV2", "I1I2LE", "I1I2LV1", "I1I2LN", "I1I2BL", "I1I2BM", "I1I2BV2", "I1I2BE", "I1I2BV1", "I1I2BN", "I1I2ML", "I1I2MB", "I1I2MV2", "I1I2ME", "I1I2MV1", "I1I2MN", "I1MV2L", "I1MV2B", "I1MV2I2", "I1MV2E", "I1MV2V1", "I1MV2N", "I1MEL", "I1MEB", "I1MEI2", "I1MEV2", "I1MEV1", "I1MEN", "I1MV1L", "I1MV1B", "I1MV1I2", "I1MV1V2", "I1MV1E", "I1MV1N", "I1MNL", "I1MNB", "I1MNI2", "I1MNV2", "I1MNE", "I1MNV1", "I1MLN", "I1MLB", "I1MLI2", "I1MLV2", "I1MLE", "I1MLV1", "I1MBN", "I1MBL", "I1MBI2", "I1MBV2", "I1MBE", "I1MBV1", "I1MI2N", "I1MI2L", "I1MI2B", "I1MI2V2", "I1MI2E", "I1MI2V1", "I1V2MN", "I1V2ML", "I1V2MB", "I1V2MI2", "I1V2ME", "I1V2MV1", "I1V2EN", "I1V2EL", "I1V2EB", "I1V2EI2", "I1V2EM", "I1V2EV1", "I1V2V1N", "I1V2V1L", "I1V2V1B", "I1V2V1I2", "I1V2V1M", "I1V2V1E", "I1V2NV1", "I1V2NL", "I1V2NB", "I1V2NI2", "I1V2NM", "I1V2NE", "I1V2LV1", "I1V2LN", "I1V2LB", "I1V2LI2", "I1V2LM", "I1V2LE", "I1V2BV1", "I1V2BN", "I1V2BL", "I1V2BI2", "I1V2BM", "I1V2BE", "I1V2I2V1", "I1V2I2N", "I1V2I2L", "I1V2I2B", "I1V2I2M", "I1V2I2E", "I1EMV1", "I1EMN", "I1EML", "I1EMB", "I1EMI2", "I1EMV2", "I1EV2V1", "I1EV2N", "I1EV2L", "I1EV2B", "I1EV2I2", "I1EV2M", "I1EV1V2", "I1EV1N", "I1EV1L", "I1EV1B", "I1EV1I2", "I1EV1M", "I1ENV2", "I1ENV1", "I1ENL", "I1ENB", "I1ENI2", "I1ENM", "I1ELV2", "I1ELV1", "I1ELN", "I1ELB", "I1ELI2", "I1ELM", "I1EBV2", "I1EBV1", "I1EBN", "I1EBL", "I1EBI2", "I1EBM", "I1EI2V2", "I1EI2V1", "I1EI2N", "I1EI2L", "I1EI2B", "I1EI2M",
                "LV1MV2", "LV1ME", "LV1MN", "LV1MI1", "LV1MB", "LV1MI2", "LV1V2M", "LV1V2E", "LV1V2N", "LV1V2I1", "LV1V2B", "LV1V2I2", "LV1EM", "LV1EV2", "LV1EN", "LV1EI1", "LV1EB", "LV1EI2", "LV1NM", "LV1NV2", "LV1NE", "LV1NI1", "LV1NB", "LV1NI2", "LV1I1M", "LV1I1V2", "LV1I1E", "LV1I1N", "LV1I1B", "LV1I1I2", "LV1BM", "LV1BV2", "LV1BE", "LV1BN", "LV1BI1", "LV1BI2", "LV1I2M", "LV1I2V2", "LV1I2E", "LV1I2N", "LV1I2I1", "LV1I2B", "LNMI2", "LNMV2", "LNME", "LNMV1", "LNMI1", "LNMB", "LNV2I2", "LNV2M", "LNV2E", "LNV2V1", "LNV2I1", "LNV2B", "LNEI2", "LNEM", "LNEV2", "LNEV1", "LNEI1", "LNEB", "LNV1I2", "LNV1M", "LNV1V2", "LNV1E", "LNV1I1", "LNV1B", "LNI1I2", "LNI1M", "LNI1V2", "LNI1E", "LNI1V1", "LNI1B", "LNBI2", "LNBM", "LNBV2", "LNBE", "LNBV1", "LNBI1", "LNI2B", "LNI2M", "LNI2V2", "LNI2E", "LNI2V1", "LNI2I1", "LI1MB", "LI1MI2", "LI1MV2", "LI1ME", "LI1MV1", "LI1MN", "LI1V2B", "LI1V2I2", "LI1V2M", "LI1V2E", "LI1V2V1", "LI1V2N", "LI1EB", "LI1EI2", "LI1EM", "LI1EV2", "LI1EV1", "LI1EN", "LI1V1B", "LI1V1I2", "LI1V1M", "LI1V1V2", "LI1V1E", "LI1V1N", "LI1NB", "LI1NI2", "LI1NM", "LI1NV2", "LI1NE", "LI1NV1", "LI1BN", "LI1BI2", "LI1BM", "LI1BV2", "LI1BE", "LI1BV1", "LI1I2N", "LI1I2B", "LI1I2M", "LI1I2V2", "LI1I2E", "LI1I2V1", "LBMN", "LBMI1", "LBMI2", "LBMV2", "LBME", "LBMV1", "LBV2N", "LBV2I1", "LBV2I2", "LBV2M", "LBV2E", "LBV2V1", "LBEN", "LBEI1", "LBEI2", "LBEM", "LBEV2", "LBEV1", "LBV1N", "LBV1I1", "LBV1I2", "LBV1M", "LBV1V2", "LBV1E", "LBNV1", "LBNI1", "LBNI2", "LBNM", "LBNV2", "LBNE", "LBI1V1", "LBI1N", "LBI1I2", "LBI1M", "LBI1V2", "LBI1E", "LBI2V1", "LBI2N", "LBI2I1", "LBI2M", "LBI2V2", "LBI2E", "LI2MV1", "LI2MN", "LI2MI1", "LI2MB", "LI2MV2", "LI2ME", "LI2V2V1", "LI2V2N", "LI2V2I1", "LI2V2B", "LI2V2M", "LI2V2E", "LI2EV1", "LI2EN", "LI2EI1", "LI2EB", "LI2EM", "LI2EV2", "LI2V1E", "LI2V1N", "LI2V1I1", "LI2V1B", "LI2V1M", "LI2V1V2", "LI2NE", "LI2NV1", "LI2NI1", "LI2NB", "LI2NM", "LI2NV2", "LI2I1E", "LI2I1V1", "LI2I1N", "LI2I1B", "LI2I1M", "LI2I1V2", "LI2BE", "LI2BV1", "LI2BN", "LI2BI1", "LI2BM", "LI2BV2", "LMI2E", "LMI2V1", "LMI2N", "LMI2I1", "LMI2B", "LMI2V2", "LMV2E", "LMV2V1", "LMV2N", "LMV2I1", "LMV2B", "LMV2I2", "LMEV2", "LMEV1", "LMEN", "LMEI1", "LMEB", "LMEI2", "LMV1V2", "LMV1E", "LMV1N", "LMV1I1", "LMV1B", "LMV1I2", "LMNV2", "LMNE", "LMNV1", "LMNI1", "LMNB", "LMNI2", "LMI1V2", "LMI1E", "LMI1V1", "LMI1N", "LMI1B", "LMI1I2", "LMBV2", "LMBE", "LMBV1", "LMBN", "LMBI1", "LMBI2", "LV2I2M", "LV2I2E", "LV2I2V1", "LV2I2N", "LV2I2I1", "LV2I2B", "LV2MI2", "LV2ME", "LV2MV1", "LV2MN", "LV2MI1", "LV2MB", "LV2EI2", "LV2EM", "LV2EV1", "LV2EN", "LV2EI1", "LV2EB", "LV2V1I2", "LV2V1M", "LV2V1E", "LV2V1N", "LV2V1I1", "LV2V1B", "LV2NI2", "LV2NM", "LV2NE", "LV2NV1", "LV2NI1", "LV2NB", "LV2I1I2", "LV2I1M", "LV2I1E", "LV2I1V1", "LV2I1N", "LV2I1B", "LV2BI2", "LV2BM", "LV2BE", "LV2BV1", "LV2BN", "LV2BI1", "LEI2B", "LEI2M", "LEI2V2", "LEI2V1", "LEI2N", "LEI2I1", "LEMB", "LEMI2", "LEMV2", "LEMV1", "LEMN", "LEMI1", "LEV2B", "LEV2I2", "LEV2M", "LEV2V1", "LEV2N", "LEV2I1", "LEV1B", "LEV1I2", "LEV1M", "LEV1V2", "LEV1N", "LEV1I1", "LENB", "LENI2", "LENM", "LENV2", "LENV1", "LENI1", "LEI1B", "LEI1I2", "LEI1M", "LEI1V2", "LEI1V1", "LEI1N", "LEBI1", "LEBI2", "LEBM", "LEBV2", "LEBV1", "LEBN",
                "BV1I2I1", "BV1I2L", "BV1I2M", "BV1I2V2", "BV1I2E", "BV1I2N", "BV1MI1", "BV1ML", "BV1MI2", "BV1MV2", "BV1ME", "BV1MN", "BV1V2I1", "BV1V2L", "BV1V2I2", "BV1V2M", "BV1V2E", "BV1V2N", "BV1EI1", "BV1EL", "BV1EI2", "BV1EM", "BV1EV2", "BV1EN", "BV1NI1", "BV1NL", "BV1NI2", "BV1NM", "BV1NV2", "BV1NE", "BV1I1N", "BV1I1L", "BV1I1I2", "BV1I1M", "BV1I1V2", "BV1I1E", "BV1LN", "BV1LI1", "BV1LI2", "BV1LM", "BV1LV2", "BV1LE", "BNI2V1", "BNI2I1", "BNI2L", "BNI2M", "BNI2V2", "BNI2E", "BNMV1", "BNMI1", "BNML", "BNMI2", "BNMV2", "BNME", "BNV2V1", "BNV2I1", "BNV2L", "BNV2I2", "BNV2M", "BNV2E", "BNEV1", "BNEI1", "BNEL", "BNEI2", "BNEM", "BNEV2", "BNV1E", "BNV1I1", "BNV1L", "BNV1I2", "BNV1M", "BNV1V2", "BNI1E", "BNI1V1", "BNI1L", "BNI1I2", "BNI1M", "BNI1V2", "BNLE", "BNLV1", "BNLI1", "BNLI2", "BNLM", "BNLV2", "BI1I2E", "BI1I2V1", "BI1I2N", "BI1I2L", "BI1I2M", "BI1I2V2", "BI1ME", "BI1MV1", "BI1MN", "BI1ML", "BI1MI2", "BI1MV2", "BI1V2E", "BI1V2V1", "BI1V2N", "BI1V2L", "BI1V2I2", "BI1V2M", "BI1EV2", "BI1EV1", "BI1EN", "BI1EL", "BI1EI2", "BI1EM", "BI1V1V2", "BI1V1E", "BI1V1N", "BI1V1L", "BI1V1I2", "BI1V1M", "BI1NV2", "BI1NE", "BI1NV1", "BI1NL", "BI1NI2", "BI1NM", "BI1LV2", "BI1LE", "BI1LV1", "BI1LN", "BI1LI2", "BI1LM", "BLI2V2", "BLI2E", "BLI2V1", "BLI2N", "BLI2I1", "BLI2M", "BLMV2", "BLME", "BLMV1", "BLMN", "BLMI1", "BLMI2", "BLV2M", "BLV2E", "BLV2V1", "BLV2N", "BLV2I1", "BLV2I2", "BLEM", "BLEV2", "BLEV1", "BLEN", "BLEI1", "BLEI2", "BLV1M", "BLV1V2", "BLV1E", "BLV1N", "BLV1I1", "BLV1I2", "BLNM", "BLNV2", "BLNE", "BLNV1", "BLNI1", "BLNI2", "BLI1M", "BLI1V2", "BLI1E", "BLI1V1", "BLI1N", "BLI1I2", "BI2LM", "BI2LV2", "BI2LE", "BI2LV1", "BI2LN", "BI2LI1", "BI2ML", "BI2MV2", "BI2ME", "BI2MV1", "BI2MN", "BI2MI1", "BI2V2L", "BI2V2M", "BI2V2E", "BI2V2V1", "BI2V2N", "BI2V2I1", "BI2EL", "BI2EM", "BI2EV2", "BI2EV1", "BI2EN", "BI2EI1", "BI2V1L", "BI2V1M", "BI2V1V2", "BI2V1E", "BI2V1N", "BI2V1I1", "BI2NL", "BI2NM", "BI2NV2", "BI2NE", "BI2NV1", "BI2NI1", "BI2I1L", "BI2I1M", "BI2I1V2", "BI2I1E", "BI2I1V1", "BI2I1N", "BMLI1", "BMLI2", "BMLV2", "BMLE", "BMLV1", "BMLN", "BMI2I1", "BMI2L", "BMI2V2", "BMI2E", "BMI2V1", "BMI2N", "BMV2I1", "BMV2L", "BMV2I2", "BMV2E", "BMV2V1", "BMV2N", "BMEI1", "BMEL", "BMEI2", "BMEV2", "BMEV1", "BMEN", "BMV1I1", "BMV1L", "BMV1I2", "BMV1V2", "BMV1E", "BMV1N", "BMNI1", "BMNL", "BMNI2", "BMNV2", "BMNE", "BMNV1", "BMI1N", "BMI1L", "BMI1I2", "BMI1V2", "BMI1E", "BMI1V1", "BV2LN", "BV2LI1", "BV2LI2", "BV2LM", "BV2LE", "BV2LV1", "BV2I2N", "BV2I2I1", "BV2I2L", "BV2I2M", "BV2I2E", "BV2I2V1", "BV2MN", "BV2MI1", "BV2ML", "BV2MI2", "BV2ME", "BV2MV1", "BV2EN", "BV2EI1", "BV2EL", "BV2EI2", "BV2EM", "BV2EV1", "BV2V1N", "BV2V1I1", "BV2V1L", "BV2V1I2", "BV2V1M", "BV2V1E", "BV2NV1", "BV2NI1", "BV2NL", "BV2NI2", "BV2NM", "BV2NE", "BV2I1V1", "BV2I1N", "BV2I1L", "BV2I1I2", "BV2I1M", "BV2I1E", "BELV1", "BELN", "BELI1", "BELI2", "BELM", "BELV2", "BEI2V1", "BEI2N", "BEI2I1", "BEI2L", "BEI2M", "BEI2V2", "BEMV1", "BEMN", "BEMI1", "BEML", "BEMI2", "BEMV2", "BEV2V1", "BEV2N", "BEV2I1", "BEV2L", "BEV2I2", "BEV2M", "BEV1V2", "BEV1N", "BEV1I1", "BEV1L", "BEV1I2", "BEV1M", "BENV2", "BENV1", "BENI1", "BENL", "BENI2", "BENM", "BEI1V2", "BEI1V1", "BEI1N", "BEI1L", "BEI1I2", "BEI1M",
                "I2V1LV2", "I2V1LE", "I2V1LN", "I2V1LI1", "I2V1LB", "I2V1LM", "I2V1BV2", "I2V1BE", "I2V1BN", "I2V1BI1", "I2V1BL", "I2V1BM", "I2V1MV2", "I2V1ME", "I2V1MN", "I2V1MI1", "I2V1ML", "I2V1MB", "I2V1V2M", "I2V1V2E", "I2V1V2N", "I2V1V2I1", "I2V1V2L", "I2V1V2B", "I2V1EM", "I2V1EV2", "I2V1EN", "I2V1EI1", "I2V1EL", "I2V1EB", "I2V1NM", "I2V1NV2", "I2V1NE", "I2V1NI1", "I2V1NL", "I2V1NB", "I2V1I1M", "I2V1I1V2", "I2V1I1E", "I2V1I1N", "I2V1I1L", "I2V1I1B", "I2NLM", "I2NLV2", "I2NLE", "I2NLV1", "I2NLI1", "I2NLB", "I2NBM", "I2NBV2", "I2NBE", "I2NBV1", "I2NBI1", "I2NBL", "I2NMB", "I2NMV2", "I2NME", "I2NMV1", "I2NMI1", "I2NML", "I2NV2B", "I2NV2M", "I2NV2E", "I2NV2V1", "I2NV2I1", "I2NV2L", "I2NEB", "I2NEM", "I2NEV2", "I2NEV1", "I2NEI1", "I2NEL", "I2NV1B", "I2NV1M", "I2NV1V2", "I2NV1E", "I2NV1I1", "I2NV1L", "I2NI1B", "I2NI1M", "I2NI1V2", "I2NI1E", "I2NI1V1", "I2NI1L", "I2I1LB", "I2I1LM", "I2I1LV2", "I2I1LE", "I2I1LV1", "I2I1LN", "I2I1BL", "I2I1BM", "I2I1BV2", "I2I1BE", "I2I1BV1", "I2I1BN", "I2I1ML", "I2I1MB", "I2I1MV2", "I2I1ME", "I2I1MV1", "I2I1MN", "I2I1V2L", "I2I1V2B", "I2I1V2M", "I2I1V2E", "I2I1V2V1", "I2I1V2N", "I2I1EL", "I2I1EB", "I2I1EM", "I2I1EV2", "I2I1EV1", "I2I1EN", "I2I1V1L", "I2I1V1B", "I2I1V1M", "I2I1V1V2", "I2I1V1E", "I2I1V1N", "I2I1NL", "I2I1NB", "I2I1NM", "I2I1NV2", "I2I1NE", "I2I1NV1", "I2LI1N", "I2LI1B", "I2LI1M", "I2LI1V2", "I2LI1E", "I2LI1V1", "I2LBN", "I2LBI1", "I2LBM", "I2LBV2", "I2LBE", "I2LBV1", "I2LMN", "I2LMI1", "I2LMB", "I2LMV2", "I2LME", "I2LMV1", "I2LV2N", "I2LV2I1", "I2LV2B", "I2LV2M", "I2LV2E", "I2LV2V1", "I2LEN", "I2LEI1", "I2LEB", "I2LEM", "I2LEV2", "I2LEV1", "I2LV1N", "I2LV1I1", "I2LV1B", "I2LV1M", "I2LV1V2", "I2LV1E", "I2LNV1", "I2LNI1", "I2LNB", "I2LNM", "I2LNV2", "I2LNE", "I2BI1V1", "I2BI1N", "I2BI1L", "I2BI1M", "I2BI1V2", "I2BI1E", "I2BLV1", "I2BLN", "I2BLI1", "I2BLM", "I2BLV2", "I2BLE", "I2BMV1", "I2BMN", "I2BMI1", "I2BML", "I2BMV2", "I2BME", "I2BV2V1", "I2BV2N", "I2BV2I1", "I2BV2L", "I2BV2M", "I2BV2E", "I2BEV1", "I2BEN", "I2BEI1", "I2BEL", "I2BEM", "I2BEV2", "I2BV1E", "I2BV1N", "I2BV1I1", "I2BV1L", "I2BV1M", "I2BV1V2", "I2BNE", "I2BNV1", "I2BNI1", "I2BNL", "I2BNM", "I2BNV2", "I2MI1E", "I2MI1V1", "I2MI1N", "I2MI1L", "I2MI1B", "I2MI1V2", "I2MLE", "I2MLV1", "I2MLN", "I2MLI1", "I2MLB", "I2MLV2", "I2MBE", "I2MBV1", "I2MBN", "I2MBI1", "I2MBL", "I2MBV2", "I2MV2E", "I2MV2V1", "I2MV2N", "I2MV2I1", "I2MV2L", "I2MV2B", "I2MEV2", "I2MEV1", "I2MEN", "I2MEI1", "I2MEL", "I2MEB", "I2MV1V2", "I2MV1E", "I2MV1N", "I2MV1I1", "I2MV1L", "I2MV1B", "I2MNV2", "I2MNE", "I2MNV1", "I2MNI1", "I2MNL", "I2MNB", "I2V2I1M", "I2V2I1E", "I2V2I1V1", "I2V2I1N", "I2V2I1L", "I2V2I1B", "I2V2LM", "I2V2LE", "I2V2LV1", "I2V2LN", "I2V2LI1", "I2V2LB", "I2V2BM", "I2V2BE", "I2V2BV1", "I2V2BN", "I2V2BI1", "I2V2BL", "I2V2MB", "I2V2ME", "I2V2MV1", "I2V2MN", "I2V2MI1", "I2V2ML", "I2V2EB", "I2V2EM", "I2V2EV1", "I2V2EN", "I2V2EI1", "I2V2EL", "I2V2V1B", "I2V2V1M", "I2V2V1E", "I2V2V1N", "I2V2V1I1", "I2V2V1L", "I2V2NB", "I2V2NM", "I2V2NE", "I2V2NV1", "I2V2NI1", "I2V2NL", "I2EI1B", "I2EI1M", "I2EI1V2", "I2EI1V1", "I2EI1N", "I2EI1L", "I2ELB", "I2ELM", "I2ELV2", "I2ELV1", "I2ELN", "I2ELI1", "I2EBL", "I2EBM", "I2EBV2", "I2EBV1", "I2EBN", "I2EBI1", "I2EML", "I2EMB", "I2EMV2", "I2EMV1", "I2EMN", "I2EMI1", "I2EV2L", "I2EV2B", "I2EV2M", "I2EV2V1", "I2EV2N", "I2EV2I1", "I2EV1L", "I2EV1B", "I2EV1M", "I2EV1V2", "I2EV1N", "I2EV1I1", "I2ENL", "I2ENB", "I2ENM", "I2ENV2", "I2ENV1", "I2ENI1",
                "MV1I1L", "MV1I1B", "MV1I1I2", "MV1I1V2", "MV1I1E", "MV1I1N", "MV1LI1", "MV1LB", "MV1LI2", "MV1LV2", "MV1LE", "MV1LN", "MV1BI1", "MV1BL", "MV1BI2", "MV1BV2", "MV1BE", "MV1BN", "MV1I2I1", "MV1I2L", "MV1I2B", "MV1I2V2", "MV1I2E", "MV1I2N", "MV1V2I1", "MV1V2L", "MV1V2B", "MV1V2I2", "MV1V2E", "MV1V2N", "MV1EI1", "MV1EL", "MV1EB", "MV1EI2", "MV1EV2", "MV1EN", "MV1NI1", "MV1NL", "MV1NB", "MV1NI2", "MV1NV2", "MV1NE", "MNI1V1", "MNI1L", "MNI1B", "MNI1I2", "MNI1V2", "MNI1E", "MNLV1", "MNLI1", "MNLB", "MNLI2", "MNLV2", "MNLE", "MNBV1", "MNBI1", "MNBL", "MNBI2", "MNBV2", "MNBE", "MNI2V1", "MNI2I1", "MNI2L", "MNI2B", "MNI2V2", "MNI2E", "MNV2V1", "MNV2I1", "MNV2L", "MNV2B", "MNV2I2", "MNV2E", "MNEV1", "MNEI1", "MNEL", "MNEB", "MNEI2", "MNEV2", "MNV1E", "MNV1I1", "MNV1L", "MNV1B", "MNV1I2", "MNV1V2", "MI1NE", "MI1NV1", "MI1NL", "MI1NB", "MI1NI2", "MI1NV2", "MI1LE", "MI1LV1", "MI1LN", "MI1LB", "MI1LI2", "MI1LV2", "MI1BE", "MI1BV1", "MI1BN", "MI1BL", "MI1BI2", "MI1BV2", "MI1I2E", "MI1I2V1", "MI1I2N", "MI1I2L", "MI1I2B", "MI1I2V2", "MI1V2E", "MI1V2V1", "MI1V2N", "MI1V2L", "MI1V2B", "MI1V2I2", "MI1EV2", "MI1EV1", "MI1EN", "MI1EL", "MI1EB", "MI1EI2", "MI1V1V2", "MI1V1E", "MI1V1N", "MI1V1L", "MI1V1B", "MI1V1I2", "MLNV2", "MLNE", "MLNV1", "MLNI1", "MLNB", "MLNI2", "MLI1V2", "MLI1E", "MLI1V1", "MLI1N", "MLI1B", "MLI1I2", "MLBV2", "MLBE", "MLBV1", "MLBN", "MLBI1", "MLBI2", "MLI2V2", "MLI2E", "MLI2V1", "MLI2N", "MLI2I1", "MLI2B", "MLV2I2", "MLV2E", "MLV2V1", "MLV2N", "MLV2I1", "MLV2B", "MLEI2", "MLEV2", "MLEV1", "MLEN", "MLEI1", "MLEB", "MLV1I2", "MLV1V2", "MLV1E", "MLV1N", "MLV1I1", "MLV1B", "MBNI2", "MBNV2", "MBNE", "MBNV1", "MBNI1", "MBNL", "MBI1I2", "MBI1V2", "MBI1E", "MBI1V1", "MBI1N", "MBI1L", "MBLI2", "MBLV2", "MBLE", "MBLV1", "MBLN", "MBLI1", "MBI2L", "MBI2V2", "MBI2E", "MBI2V1", "MBI2N", "MBI2I1", "MBV2L", "MBV2I2", "MBV2E", "MBV2V1", "MBV2N", "MBV2I1", "MBEL", "MBEI2", "MBEV2", "MBEV1", "MBEN", "MBEI1", "MBV1L", "MBV1I2", "MBV1V2", "MBV1E", "MBV1N", "MBV1I1", "MI2NL", "MI2NB", "MI2NV2", "MI2NE", "MI2NV1", "MI2NI1", "MI2I1L", "MI2I1B", "MI2I1V2", "MI2I1E", "MI2I1V1", "MI2I1N", "MI2LI1", "MI2LB", "MI2LV2", "MI2LE", "MI2LV1", "MI2LN", "MI2BI1", "MI2BL", "MI2BV2", "MI2BE", "MI2BV1", "MI2BN", "MI2V2I1", "MI2V2L", "MI2V2B", "MI2V2E", "MI2V2V1", "MI2V2N", "MI2EI1", "MI2EL", "MI2EB", "MI2EV2", "MI2EV1", "MI2EN", "MI2V1I1", "MI2V1L", "MI2V1B", "MI2V1V2", "MI2V1E", "MI2V1N", "MV2NI1", "MV2NL", "MV2NB", "MV2NI2", "MV2NE", "MV2NV1", "MV2I1N", "MV2I1L", "MV2I1B", "MV2I1I2", "MV2I1E", "MV2I1V1", "MV2LN", "MV2LI1", "MV2LB", "MV2LI2", "MV2LE", "MV2LV1", "MV2BN", "MV2BI1", "MV2BL", "MV2BI2", "MV2BE", "MV2BV1", "MV2I2N", "MV2I2I1", "MV2I2L", "MV2I2B", "MV2I2E", "MV2I2V1", "MV2EN", "MV2EI1", "MV2EL", "MV2EB", "MV2EI2", "MV2EV1", "MV2V1N", "MV2V1I1", "MV2V1L", "MV2V1B", "MV2V1I2", "MV2V1E", "MENV1", "MENI1", "MENL", "MENB", "MENI2", "MENV2", "MEI1V1", "MEI1N", "MEI1L", "MEI1B", "MEI1I2", "MEI1V2", "MELV1", "MELN", "MELI1", "MELB", "MELI2", "MELV2", "MEBV1", "MEBN", "MEBI1", "MEBL", "MEBI2", "MEBV2", "MEI2V1", "MEI2N", "MEI2I1", "MEI2L", "MEI2B", "MEI2V2", "MEV2V1", "MEV2N", "MEV2I1", "MEV2L", "MEV2B", "MEV2I2", "MEV1V2", "MEV1N", "MEV1I1", "MEV1L", "MEV1B", "MEV1I2",
                "V2V1NM", "V2V1NE", "V2V1NI1", "V2V1NL", "V2V1NB", "V2V1NI2", "V2V1I1M", "V2V1I1E", "V2V1I1N", "V2V1I1L", "V2V1I1B", "V2V1I1I2", "V2V1LM", "V2V1LE", "V2V1LN", "V2V1LI1", "V2V1LB", "V2V1LI2", "V2V1BM", "V2V1BE", "V2V1BN", "V2V1BI1", "V2V1BL", "V2V1BI2", "V2V1I2M", "V2V1I2E", "V2V1I2N", "V2V1I2I1", "V2V1I2L", "V2V1I2B", "V2V1MI2", "V2V1ME", "V2V1MN", "V2V1MI1", "V2V1ML", "V2V1MB", "V2V1EI2", "V2V1EM", "V2V1EN", "V2V1EI1", "V2V1EL", "V2V1EB", "V2NV1I2", "V2NV1M", "V2NV1E", "V2NV1I1", "V2NV1L", "V2NV1B", "V2NI1I2", "V2NI1M", "V2NI1E", "V2NI1V1", "V2NI1L", "V2NI1B", "V2NLI2", "V2NLM", "V2NLE", "V2NLV1", "V2NLI1", "V2NLB", "V2NBI2", "V2NBM", "V2NBE", "V2NBV1", "V2NBI1", "V2NBL", "V2NI2B", "V2NI2M", "V2NI2E", "V2NI2V1", "V2NI2I1", "V2NI2L", "V2NMB", "V2NMI2", "V2NME", "V2NMV1", "V2NMI1", "V2NML", "V2NEB", "V2NEI2", "V2NEM", "V2NEV1", "V2NEI1", "V2NEL", "V2I1V1B", "V2I1V1I2", "V2I1V1M", "V2I1V1E", "V2I1V1N", "V2I1V1L", "V2I1NB", "V2I1NI2", "V2I1NM", "V2I1NE", "V2I1NV1", "V2I1NL", "V2I1LB", "V2I1LI2", "V2I1LM", "V2I1LE", "V2I1LV1", "V2I1LN", "V2I1BL", "V2I1BI2", "V2I1BM", "V2I1BE", "V2I1BV1", "V2I1BN", "V2I1I2L", "V2I1I2B", "V2I1I2M", "V2I1I2E", "V2I1I2V1", "V2I1I2N", "V2I1ML", "V2I1MB", "V2I1MI2", "V2I1ME", "V2I1MV1", "V2I1MN", "V2I1EL", "V2I1EB", "V2I1EI2", "V2I1EM", "V2I1EV1", "V2I1EN", "V2LV1I1", "V2LV1B", "V2LV1I2", "V2LV1M", "V2LV1E", "V2LV1N", "V2LNI1", "V2LNB", "V2LNI2", "V2LNM", "V2LNE", "V2LNV1", "V2LI1N", "V2LI1B", "V2LI1I2", "V2LI1M", "V2LI1E", "V2LI1V1", "V2LBN", "V2LBI1", "V2LBI2", "V2LBM", "V2LBE", "V2LBV1", "V2LI2N", "V2LI2I1", "V2LI2B", "V2LI2M", "V2LI2E", "V2LI2V1", "V2LMN", "V2LMI1", "V2LMB", "V2LMI2", "V2LME", "V2LMV1", "V2LEN", "V2LEI1", "V2LEB", "V2LEI2", "V2LEM", "V2LEV1", "V2BV1N", "V2BV1I1", "V2BV1L", "V2BV1I2", "V2BV1M", "V2BV1E", "V2BNV1", "V2BNI1", "V2BNL", "V2BNI2", "V2BNM", "V2BNE", "V2BI1V1", "V2BI1N", "V2BI1L", "V2BI1I2", "V2BI1M", "V2BI1E", "V2BLV1", "V2BLN", "V2BLI1", "V2BLI2", "V2BLM", "V2BLE", "V2BI2V1", "V2BI2N", "V2BI2I1", "V2BI2L", "V2BI2M", "V2BI2E", "V2BMV1", "V2BMN", "V2BMI1", "V2BML", "V2BMI2", "V2BME", "V2BEV1", "V2BEN", "V2BEI1", "V2BEL", "V2BEI2", "V2BEM", "V2I2V1E", "V2I2V1N", "V2I2V1I1", "V2I2V1L", "V2I2V1B", "V2I2V1M", "V2I2NE", "V2I2NV1", "V2I2NI1", "V2I2NL", "V2I2NB", "V2I2NM", "V2I2I1E", "V2I2I1V1", "V2I2I1N", "V2I2I1L", "V2I2I1B", "V2I2I1M", "V2I2LE", "V2I2LV1", "V2I2LN", "V2I2LI1", "V2I2LB", "V2I2LM", "V2I2BE", "V2I2BV1", "V2I2BN", "V2I2BI1", "V2I2BL", "V2I2BM", "V2I2ME", "V2I2MV1", "V2I2MN", "V2I2MI1", "V2I2ML", "V2I2MB", "V2I2EM", "V2I2EV1", "V2I2EN", "V2I2EI1", "V2I2EL", "V2I2EB", "V2MV1I2", "V2MV1E", "V2MV1N", "V2MV1I1", "V2MV1L", "V2MV1B", "V2MNI2", "V2MNE", "V2MNV1", "V2MNI1", "V2MNL", "V2MNB", "V2MI1I2", "V2MI1E", "V2MI1V1", "V2MI1N", "V2MI1L", "V2MI1B", "V2MLI2", "V2MLE", "V2MLV1", "V2MLN", "V2MLI1", "V2MLB", "V2MBI2", "V2MBE", "V2MBV1", "V2MBN", "V2MBI1", "V2MBL", "V2MI2B", "V2MI2E", "V2MI2V1", "V2MI2N", "V2MI2I1", "V2MI2L", "V2MEB", "V2MEI2", "V2MEV1", "V2MEN", "V2MEI1", "V2MEL", "V2EV1B", "V2EV1I2", "V2EV1M", "V2EV1N", "V2EV1I1", "V2EV1L", "V2ENB", "V2ENI2", "V2ENM", "V2ENV1", "V2ENI1", "V2ENL", "V2EI1B", "V2EI1I2", "V2EI1M", "V2EI1V1", "V2EI1N", "V2EI1L", "V2ELB", "V2ELI2", "V2ELM", "V2ELV1", "V2ELN", "V2ELI1", "V2EBL", "V2EBI2", "V2EBM", "V2EBV1", "V2EBN", "V2EBI1", "V2EI2L", "V2EI2B", "V2EI2M", "V2EI2V1", "V2EI2N", "V2EI2I1", "V2EML", "V2EMB", "V2EMI2", "V2EMV1", "V2EMN", "V2EMI1",
                "EV1V2L", "EV1V2B", "EV1V2I2", "EV1V2M", "EV1V2N", "EV1V2I1", "EV1NL", "EV1NB", "EV1NI2", "EV1NM", "EV1NV2", "EV1NI1", "EV1I1L", "EV1I1B", "EV1I1I2", "EV1I1M", "EV1I1V2", "EV1I1N", "EV1LI1", "EV1LB", "EV1LI2", "EV1LM", "EV1LV2", "EV1LN", "EV1BI1", "EV1BL", "EV1BI2", "EV1BM", "EV1BV2", "EV1BN", "EV1I2I1", "EV1I2L", "EV1I2B", "EV1I2M", "EV1I2V2", "EV1I2N", "EV1MI1", "EV1ML", "EV1MB", "EV1MI2", "EV1MV2", "EV1MN", "ENV2I1", "ENV2L", "ENV2B", "ENV2I2", "ENV2M", "ENV2V1", "ENV1I1", "ENV1L", "ENV1B", "ENV1I2", "ENV1M", "ENV1V2", "ENI1V1", "ENI1L", "ENI1B", "ENI1I2", "ENI1M", "ENI1V2", "ENLV1", "ENLI1", "ENLB", "ENLI2", "ENLM", "ENLV2", "ENBV1", "ENBI1", "ENBL", "ENBI2", "ENBM", "ENBV2", "ENI2V1", "ENI2I1", "ENI2L", "ENI2B", "ENI2M", "ENI2V2", "ENMV1", "ENMI1", "ENML", "ENMB", "ENMI2", "ENMV2", "EI1V2V1", "EI1V2N", "EI1V2L", "EI1V2B", "EI1V2I2", "EI1V2M", "EI1V1V2", "EI1V1N", "EI1V1L", "EI1V1B", "EI1V1I2", "EI1V1M", "EI1NV2", "EI1NV1", "EI1NL", "EI1NB", "EI1NI2", "EI1NM", "EI1LV2", "EI1LV1", "EI1LN", "EI1LB", "EI1LI2", "EI1LM", "EI1BV2", "EI1BV1", "EI1BN", "EI1BL", "EI1BI2", "EI1BM", "EI1I2V2", "EI1I2V1", "EI1I2N", "EI1I2L", "EI1I2B", "EI1I2M", "EI1MV2", "EI1MV1", "EI1MN", "EI1ML", "EI1MB", "EI1MI2", "ELV2M", "ELV2V1", "ELV2N", "ELV2I1", "ELV2B", "ELV2I2", "ELV1M", "ELV1V2", "ELV1N", "ELV1I1", "ELV1B", "ELV1I2", "ELNM", "ELNV2", "ELNV1", "ELNI1", "ELNB", "ELNI2", "ELI1M", "ELI1V2", "ELI1V1", "ELI1N", "ELI1B", "ELI1I2", "ELBM", "ELBV2", "ELBV1", "ELBN", "ELBI1", "ELBI2", "ELI2M", "ELI2V2", "ELI2V1", "ELI2N", "ELI2I1", "ELI2B", "ELMI2", "ELMV2", "ELMV1", "ELMN", "ELMI1", "ELMB", "EBV2I2", "EBV2M", "EBV2V1", "EBV2N", "EBV2I1", "EBV2L", "EBV1I2", "EBV1M", "EBV1V2", "EBV1N", "EBV1I1", "EBV1L", "EBNI2", "EBNM", "EBNV2", "EBNV1", "EBNI1", "EBNL", "EBI1I2", "EBI1M", "EBI1V2", "EBI1V1", "EBI1N", "EBI1L", "EBLI2", "EBLM", "EBLV2", "EBLV1", "EBLN", "EBLI1", "EBI2L", "EBI2M", "EBI2V2", "EBI2V1", "EBI2N", "EBI2I1", "EBML", "EBMI2", "EBMV2", "EBMV1", "EBMN", "EBMI1", "EI2V2L", "EI2V2B", "EI2V2M", "EI2V2V1", "EI2V2N", "EI2V2I1", "EI2V1L", "EI2V1B", "EI2V1M", "EI2V1V2", "EI2V1N", "EI2V1I1", "EI2NL", "EI2NB", "EI2NM", "EI2NV2", "EI2NV1", "EI2NI1", "EI2I1L", "EI2I1B", "EI2I1M", "EI2I1V2", "EI2I1V1", "EI2I1N", "EI2LI1", "EI2LB", "EI2LM", "EI2LV2", "EI2LV1", "EI2LN", "EI2BI1", "EI2BL", "EI2BM", "EI2BV2", "EI2BV1", "EI2BN", "EI2MI1", "EI2ML", "EI2MB", "EI2MV2", "EI2MV1", "EI2MN", "EMV2I1", "EMV2L", "EMV2B", "EMV2I2", "EMV2V1", "EMV2N", "EMV1I1", "EMV1L", "EMV1B", "EMV1I2", "EMV1V2", "EMV1N", "EMNI1", "EMNL", "EMNB", "EMNI2", "EMNV2", "EMNV1", "EMI1N", "EMI1L", "EMI1B", "EMI1I2", "EMI1V2", "EMI1V1", "EMLN", "EMLI1", "EMLB", "EMLI2", "EMLV2", "EMLV1", "EMBN", "EMBI1", "EMBL", "EMBI2", "EMBV2", "EMBV1", "EMI2N", "EMI2I1", "EMI2L", "EMI2B", "EMI2V2", "EMI2V1", "EV2MN", "EV2MI1", "EV2ML", "EV2MB", "EV2MI2", "EV2MV1", "EV2V1N", "EV2V1I1", "EV2V1L", "EV2V1B", "EV2V1I2", "EV2V1M", "EV2NV1", "EV2NI1", "EV2NL", "EV2NB", "EV2NI2", "EV2NM", "EV2I1V1", "EV2I1N", "EV2I1L", "EV2I1B", "EV2I1I2", "EV2I1M", "EV2LV1", "EV2LN", "EV2LI1", "EV2LB", "EV2LI2", "EV2LM", "EV2BV1", "EV2BN", "EV2BI1", "EV2BL", "EV2BI2", "EV2BM", "EV2I2V1", "EV2I2N", "EV2I2I1", "EV2I2L", "EV2I2B", "EV2I2M"
        
    ]
    
    for intel in intelArray{
        if(intelArray.contains(intel)){
            intelSub = intelArray.firstIndex(of: intel)! + 1
        }
    }
    
    return intelSub
    
}

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
