//
//  DashboardVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/11/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import SwiftUI // Needed to open a SwiftUI screen from Discovery button
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
//import FirebaseUI
//import FirebaseAuthUI
//import FirebaseDatabaseUI

@available(iOS 13.0, *)
class DashboardVC: UIViewController {
    
    var menuActive = false;
    var originalHeightMenuItems:CGFloat = 0;
    
    @IBOutlet weak var btnDiscovery: UIButton!
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var lblNameAge: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var menuIcon: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var menuItems: UIStackView!
    @IBOutlet weak var stackViewHeight: NSLayoutConstraint!
    
    //hero mixo
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var imgHTLC: UIImageView!
    @IBOutlet weak var imgHTRC: UIImageView!
    @IBOutlet weak var imgHBLC: UIImageView!
    @IBOutlet weak var imgHBRC: UIImageView!
    
    //intel mixo
    @IBOutlet weak var imgIntel: UIImageView!
    @IBOutlet weak var imgITLC: UIImageView!
    @IBOutlet weak var imgITRC: UIImageView!
    @IBOutlet weak var imgIBLC: UIImageView!
    @IBOutlet weak var imgIBRC: UIImageView!
    
    //talent mixo
    @IBOutlet weak var imgTalent: UIImageView!
    @IBOutlet weak var imgTTLC: UIImageView!
    @IBOutlet weak var imgTTRC: UIImageView!
    @IBOutlet weak var imgTBLC: UIImageView!
    @IBOutlet weak var imgTBRC: UIImageView!
    
    //collect mixo
    @IBOutlet weak var imgCollect: UIImageView!
    @IBOutlet weak var imgCTLC: UIImageView!
    @IBOutlet weak var imgCTRC: UIImageView!
    @IBOutlet weak var imgCBLC: UIImageView!
    @IBOutlet weak var imgCBRC: UIImageView!
    
    //Top Nav buttons
    @IBOutlet weak var btnMixoType: UIButton!
    @IBOutlet weak var btnSettings: UIButton!
    
    
    func signOut() {
            try! Auth.auth().signOut()

    //        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    //        let mixoStart = mainSB.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    //        self.present(mixoStart, animated: false, completion: nil)
            
            
            let mainVC = mainSB.instantiateViewController(withIdentifier: "MainVC") as! ViewController
            self.present(mainVC, animated: true, completion: nil)
    }
    @IBAction func btnMixoType(_ sender: Any) {
        
    }
    
    
    var heroImages: [String] = [] //array that holds the heroes
    var intelImages: [String] = [] //array that holds the intels
    var talentImages: [String] = []//array that holds the talents
    var collectImages: [String] = []//array that holds the collections
    
    
    @IBAction func discoveryClicked(_ sender: Any)  {
        
        
        
        let docRef = db.collection("users").getDocuments(completion: { FIRQuerySnapshot, Error in
            // Used reference at:
            // https://firebase.google.com/docs/reference/swift/firebasefirestore/api/reference/Classes/QueryDocumentSnapshot
            
            // print("/****/ query {")
            // print(FIRQuerySnapshot!.query)
            
                    
            for i in 0...min(FIRQuerySnapshot!.documents.count-1, 2-1) {
                // print("/****/ document<?>");
                // print(document); // Confirmed documents is type QueryDocumentSnapshot
                var doc = FIRQuerySnapshot!.documents[i];
                var data = doc.data();
                // print("/****/ document.data() RET")
                // print(data);
                
                print("/****/ responses count :| runtime")
                print(responses!.count);
                
                responses!.append(data)
                //if(i==1) {
                //    print("/****/ responses")
                //    print(responses!);
                //}
                
                /** Render Discover **/
                let contentViewInHC = UIHostingController(rootView: DiscoveryVC())
                self.addChild(contentViewInHC)
                self.view.addSubview(contentViewInHC.view)
                contentViewInHC.didMove(toParent: self)
                contentViewInHC.view?.translatesAutoresizingMaskIntoConstraints = false;
                contentViewInHC.view?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true;
                contentViewInHC.view?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true;
                contentViewInHC.view?.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
                contentViewInHC.view?.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
            }
        })
        

    }
    
    fileprivate func setupHCConstraints() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHCConstraints()

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
        
        setUpUI()
        getUserData()
    }
    
    func setUpUI() {
        setupProfilePic();
        setUpMenuIcon();
    }
    
    func setupProfilePic() {
        profilePic.layer.masksToBounds = true
        profilePic.layer.cornerRadius = profilePic.bounds.width / 2
    }
    
    func setUpMenuIcon() {
        // Prepare menu icon clicked height
        originalHeightMenuItems = stackViewHeight.constant
        
        // Collapsed menu initially
        menuItems.isHidden = true;
        stackViewHeight.constant = 0;
        menuItems.layoutIfNeeded()
        
    }

    @IBAction func menuIconClicked(_ sender: Any) {
        if(menuActive) {
            menuItems.isHidden = true;
            menuActive=false;
            stackViewHeight.constant = 0;
            menuItems.layoutIfNeeded();
        } else {
            menuItems.isHidden = false;
            menuActive=true;
            stackViewHeight.constant = originalHeightMenuItems;
            menuItems.layoutIfNeeded();
        }
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        signOut();
    }
    
    
    func getUserData() {
        //get the users choices
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                //user profile data
                print(document);
                
                let user_name = document.get("name") as! String
                let user_pic = document.get("profile_pic") as! String
                let user_city = document.get("city") as! String
                let user_state = document.get("state") as! String
                let user_location = user_city + ", " + user_state
                let user_dob = document.get("dob") as! String
                
                // inspect failed dob
                if(user_dob=="incomplete" || user_pic == "incomplete" || user_city == "incomplete" || user_state == "incomplete"){
                    let profileScene1NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene1NVC") as! ProfileScene1NVC
                    self.present(profileScene1NVC, animated:true, completion:nil)
                    
                } else {
                    //calcualte age of user
                    let today = Date()
                    
                    //convert user_dob to Date
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    let date = dateFormatter.date(from: user_dob)!
                    
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.year, .month, .day], from: date, to:today)
                    
                    let ageYear = components.year
                    
                    self.lblNameAge.text = user_name + ", " + String(ageYear!)
                    self.lblLocation.text = user_location
                    
                    let storage = Storage.storage()
                    var reference: StorageReference!
                    let imgRef = "gs://mixotype-4a74b.appspot.com/" + user_pic
                    reference = storage.reference(forURL: imgRef)
                    reference.downloadURL { (url, err) in
                        if(url != nil) {
                            let data = NSData(contentsOf: url!)
                            let image = UIImage(data: data! as Data)
                            self.profilePic.image = image
                        }
                    }
                    
                    
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
                        self.imgHero.image = UIImage(named: self.heroImages[Int(role_nest_1)! - 1])

                        //set the corners
                        //tlc
                        switch role_basket_nest_1{
                            case "1":
                                self.imgHTLC.image = UIImage(named: "ktlc")
                                break
                            case "2":
                                self.imgHTLC.image = UIImage(named: "wtlc")
                                break
                            case "3":
                                self.imgHTLC.image = UIImage(named: "mtlc")
                                break
                            case "4":
                                self.imgHTLC.image = UIImage(named: "ltlc")
                                break
                            default:
                                break
                        }

                        //trc
                        switch role_basket_nest_2{
                            case "1":
                                self.imgHTRC.image = UIImage(named: "ktrc")
                                break
                            case "2":
                                self.imgHTRC.image = UIImage(named: "wtrc")
                                break
                            case "3":
                                self.imgHTRC.image = UIImage(named: "mtrc")
                                break
                            case "4":
                                self.imgHTRC.image = UIImage(named: "ltrc")
                                break
                            default:
                                break
                        }

                        //blc
                        switch role_basket_nest_3{
                            case "1":
                                self.imgHBLC.image = UIImage(named: "kblc")
                                break
                            case "2":
                                self.imgHBLC.image = UIImage(named: "wblc")
                                break
                            case "3":
                                self.imgHBLC.image = UIImage(named: "mblc")
                                break
                            case "4":
                                self.imgHBLC.image = UIImage(named: "lblc")
                                break
                            default:
                                break
                        }

                        //brc
                        switch role_basket_nest_4{
                            case "1":
                                self.imgHBRC.image = UIImage(named: "kbrc")
                                break
                            case "2":
                                self.imgHBRC.image = UIImage(named: "wbrc")
                                break
                            case "3":
                                self.imgHBRC.image = UIImage(named: "mbrc")
                                break
                            case "4":
                                self.imgHBRC.image = UIImage(named: "lbrc")
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

                        //set Intel to the first intel choice
                        self.imgIntel.image = UIImage(named: self.intelImages[Int(intel_nest_1)! - 1])

                        //set the corners
                        //tlc
                        switch intel_nest_1{
                            case "1":
                                self.imgITLC.image = UIImage(named: "verbaltlc")
                                break
                            case "2":
                                self.imgITLC.image = UIImage(named: "naturalistictlc")
                                break
                            case "3":
                                self.imgITLC.image = UIImage(named: "interpersonaltlc")
                                break
                            case "4":
                                self.imgITLC.image = UIImage(named: "ilogicaltlc")
                                break
                            case "5":
                                self.imgITLC.image = UIImage(named: "bodilytlc")
                                break
                            case "6":
                                self.imgITLC.image = UIImage(named: "intrapersonaltlc")
                                break
                            case "7":
                                self.imgITLC.image = UIImage(named: "musicaltlc")
                                break
                            case "8":
                                self.imgITLC.image = UIImage(named: "visualtlc")
                                break
                            case "9":
                                self.imgITLC.image = UIImage(named: "existentialtlc")
                                break
                            default:
                                break
                        }

                        //trc
                        switch intel_nest_2{
                            case "1":
                                self.imgITRC.image = UIImage(named: "verbaltrc")
                                break
                            case "2":
                                self.imgITRC.image = UIImage(named: "naturalistictrc")
                                break
                            case "3":
                                self.imgITRC.image = UIImage(named: "interpersonaltrc")
                                break
                            case "4":
                                self.imgITRC.image = UIImage(named: "ilogicaltrc")
                                break
                            case "5":
                                self.imgITRC.image = UIImage(named: "bodilytrc")
                                break
                            case "6":
                                self.imgITRC.image = UIImage(named: "intrapersonaltrc")
                                break
                            case "7":
                                self.imgITRC.image = UIImage(named: "musicaltrc")
                                break
                            case "8":
                                self.imgITRC.image = UIImage(named: "visualtrc")
                                break
                            case "9":
                                self.imgITRC.image = UIImage(named: "existentialtrc")
                                break
                            default:
                                break
                        }

                        //blc
                        switch intel_nest_3{
                            case "1":
                                self.imgIBLC.image = UIImage(named: "verbalblc")
                                break
                            case "2":
                                self.imgIBLC.image = UIImage(named: "naturalisticblc")
                                break
                            case "3":
                                self.imgIBLC.image = UIImage(named: "interpersonalblc")
                                break
                            case "4":
                                self.imgIBLC.image = UIImage(named: "ilogicalblc")
                                break
                            case "5":
                                self.imgIBLC.image = UIImage(named: "bodilyblc")
                                break
                            case "6":
                                self.imgIBLC.image = UIImage(named: "intrapersonalblc")
                                break
                            case "7":
                                self.imgIBLC.image = UIImage(named: "musicalblc")
                                break
                            case "8":
                                self.imgIBLC.image = UIImage(named: "visualblc")
                                break
                            case "9":
                                self.imgIBLC.image = UIImage(named: "existentialblc")
                                break
                            default:
                                break
                        }

                        //brc
                        switch intel_nest_4{
                            case "1":
                                self.imgIBRC.image = UIImage(named: "verbalbrc")
                                break
                            case "2":
                                self.imgIBRC.image = UIImage(named: "naturalisticbrc")
                                break
                            case "3":
                                self.imgIBRC.image = UIImage(named: "interpersonalbrc")
                                break
                            case "4":
                                self.imgIBRC.image = UIImage(named: "ilogicalbrc")
                                break
                            case "5":
                                self.imgIBRC.image = UIImage(named: "bodilybrc")
                                break
                            case "6":
                                self.imgIBRC.image = UIImage(named: "intrapersonalbrc")
                                break
                            case "7":
                                self.imgIBRC.image = UIImage(named: "musicalbrc")
                                break
                            case "8":
                                self.imgIBRC.image = UIImage(named: "visualbrc")
                                break
                            case "9":
                                self.imgIBRC.image = UIImage(named: "existentialbrc")
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

                        //set Talent to the first talent choice
                        self.imgTalent.image = UIImage(named: self.talentImages[Int(talent_nest_1)! - 1])

                        //set the corners
                            //tlc
                            switch talent_basket_nest_1{
                                case "1":
                                    self.imgTTLC.image = UIImage(named: "physicaltlc")
                                    break
                                case "2":
                                    self.imgTTLC.image = UIImage(named: "spiritualtlc")
                                    break
                                case "3":
                                    self.imgTTLC.image = UIImage(named: "logicaltlc")
                                    break
                                case "4":
                                    self.imgTTLC.image = UIImage(named: "creativetlc")
                                    break
                                default:
                                    break
                            }

                            //trc
                            switch talent_basket_nest_2{
                                case "1":
                                    self.imgTTRC.image = UIImage(named: "physicaltrc")
                                    break
                                case "2":
                                    self.imgTTRC.image = UIImage(named: "spiritualtrc")
                                    break
                                case "3":
                                    self.imgTTRC.image = UIImage(named: "logicaltrc")
                                    break
                                case "4":
                                    self.imgTTRC.image = UIImage(named: "creativetrc")
                                    break
                                default:
                                    break
                            }

                            //blc
                            switch talent_basket_nest_3{
                                case "1":
                                    self.imgTBLC.image = UIImage(named: "physicalblc")
                                    break
                                case "2":
                                    self.imgTBLC.image = UIImage(named: "spiritualblc")
                                    break
                                case "3":
                                    self.imgTBLC.image = UIImage(named: "logicalblc")
                                    break
                                case "4":
                                    self.imgTBLC.image = UIImage(named: "creativeblc")
                                    break
                                default:
                                    break
                            }

                            //brc
                            switch talent_basket_nest_4{
                                case "1":
                                    self.imgTBRC.image = UIImage(named: "physicalbrc")
                                    break
                                case "2":
                                    self.imgTBRC.image = UIImage(named: "spiritualbrc")
                                    break
                                case "3":
                                    self.imgTBRC.image = UIImage(named: "logicalbrc")
                                    break
                                case "4":
                                    self.imgTBRC.image = UIImage(named: "creativebrc")
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

                        //set Collect to the first collection choice
                        self.imgCollect.image = UIImage(named: self.collectImages[Int(collect_nest_1)! - 1])

                        //set the corners
                            //tlc
                            switch collect_basket_nest_1{
                                case "1":
                                    self.imgCTLC.image = UIImage(named: "physicaltlc")
                                    break
                                case "2":
                                    self.imgCTLC.image = UIImage(named: "spiritualtlc")
                                    break
                                case "3":
                                    self.imgCTLC.image = UIImage(named: "logicaltlc")
                                    break
                                case "4":
                                    self.imgCTLC.image = UIImage(named: "creativetlc")
                                    break
                                default:
                                    break
                            }

                            //trc
                            switch collect_basket_nest_2{
                                case "1":
                                    self.imgCTRC.image = UIImage(named: "physicaltrc")
                                    break
                                case "2":
                                    self.imgCTRC.image = UIImage(named: "spiritualtrc")
                                    break
                                case "3":
                                    self.imgCTRC.image = UIImage(named: "logicaltrc")
                                    break
                                case "4":
                                    self.imgCTRC.image = UIImage(named: "creativetrc")
                                    break
                                default:
                                    break
                            }

                            //brc
                            switch collect_basket_nest_3{
                                case "1":
                                    self.imgCBLC.image = UIImage(named: "physicalblc")
                                    break
                                case "2":
                                    self.imgCBLC.image = UIImage(named: "spiritualblc")
                                    break
                                case "3":
                                    self.imgCBLC.image = UIImage(named: "logicalblc")
                                    break
                                case "4":
                                    self.imgCBLC.image = UIImage(named: "creativeblc")
                                    break
                                default:
                                    break
                            }

                            //blc
                            switch collect_basket_nest_4{
                                case "1":
                                    self.imgCBRC.image = UIImage(named: "physicalbrc")
                                    break
                                case "2":
                                    self.imgCBRC.image = UIImage(named: "spiritualbrc")
                                    break
                                case "3":
                                    self.imgCBRC.image = UIImage(named: "logicalbrc")
                                    break
                                case "4":
                                    self.imgCBRC.image = UIImage(named: "creativebrc")
                                    break
                                default:
                                    break
                            }
                    }
                    
                }
                
                
            } else {
                print("Document does not exist")
            }
        }
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
