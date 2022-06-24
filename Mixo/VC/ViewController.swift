//
//  ViewController.swift
//  Mixo
//
//  Created by Sean Hall on 10/11/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FontAwesome_swift
import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore


let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle:.main)
let defSB : UIStoryboard  = UIStoryboard(name: "Definitions", bundle: .main)
let warningSB : UIStoryboard = UIStoryboard(name: "Warning", bundle: .main)
let tempDefSB : UIStoryboard = UIStoryboard(name: "TMDef", bundle: .main)
let modDefSB : UIStoryboard = UIStoryboard(name: "TMDef", bundle: .main)
let resultsSB : UIStoryboard = UIStoryboard(name: "Results", bundle: .main)



@available(iOS 13.0, *)
class ViewController: UIViewController {
    @IBOutlet weak var chevron: UITextView!
    @IBOutlet weak var btnStart: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Clear Firebase cache to fix the: Document path must not be empty
//        FirebaseFirestore.instance.clearPersistence();
                
        setUpElements()
        
        if(autoLogin) {
            //signing in the user
            Auth.auth().signIn(withEmail: "donotremove@mixotype.com", password: "DoNotRemove1!") { (result, error) in
                if error != nil {
                    //couldnt sign in
                    print("Error: Your test account for development mode's automatic login failed. Please make sure to create an account donotremove@mixotype.com:DoNotRemove1!")
//                    fatalError("App purposely crashed")
                } else {
                    //check if users are finished the generator before going any further
                    userUID = result!.user.uid
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
                            
                            if(skipToScreen) {
                                self.skipToScreenAt();
                            }
                            
                            let roleDone = document.get("role_done")  as! String
                            let intelDone = document.get("intel_done")  as! String
                            let talentDone = document.get("talent_done")  as! String
                            let collectDone = document.get("collect_done")  as! String
                            
                            //combine aal the Y's into 1 string
                            let dones = roleDone + intelDone + talentDone + collectDone
                            let done: Character = "Y"
                            
                            //count how many time Y is in the string
                            let count = dones.filter { $0 == done }.count
                            
                            //if mixo isnt done
                            if count < 4 {
                                //check which section to go to
                                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                                let mixoScene1VC = storyBoard.instantiateViewController(withIdentifier: "MixoScene1VC") as! MixoScene1VC
                                                
                                //go to the heroes
                                if roleDone == "N" {
                                    mixoState = 1
                                    self.present(mixoScene1VC, animated:true, completion:nil)
                                } else if intelDone == "N" {
                                    //go to intel
                                    mixoState = 2
                                    self.present(mixoScene1VC, animated: true, completion: nil)
                                } else if talentDone == "N" {
                                    mixoState = 3
                                    //go to talents
                                    self.present(mixoScene1VC, animated: true, completion: nil)
                                } else if collectDone == "N" {
                                    mixoState = 4
                                    //go to collect
                                    self.present(mixoScene1VC, animated: true, completion: nil)
                                }
                                
                            } else {
                                
                                let dashboardVC = mainSB.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
                                self.present(dashboardVC, animated: true, completion: nil)
                                //self.transitionToMixoScene5VC()
                                //FIX THIS LATER! go to the dashboard
                                //self.transitionToDashboardVC()
                            }
                            
                        } else {
                            print("Document does not exist")
                        }
                    }
                }
            } // Auth
        } // if autoLogin

        
    }
    
    func setUpElements(){
        
        Utilities.styleFilledButton(btnStart)
        chevron.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron.text = String.fontAwesomeIcon(name: FontAwesome.chevronRight)
    }
    
    func skipToScreenAt() {
//        let profileScene5NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene5NVC") as! ProfileScene5NVC
//        self.present(profileScene5NVC, animated:true, completion:nil)
//        let discovery2VC = mainSB.instantiateViewController(withIdentifier: "Discovery2VC") as! Discovery2VC
//        self.present(discovery2VC, animated:true, completion:nil)
        
        let dashboardVC = mainSB.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
        self.present(dashboardVC, animated:true, completion:nil)
    }

    @IBAction func btnStart(_ sender: Any) {
        
        
        // Interaction required to load a screen?
        if(skipToScreen) {
            self.skipToScreenAt();
        }
    }
    
} // View Controller

