//
//  LoginVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/11/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

//var userUID = String()
//let db = Firestore.firestore()
// ERRORED? Document path must not be empty? Delete the user you're receating at both the Firestore and Authentication
var docRef = db.collection("users").document(userUID)

@available(iOS 13.0, *)
class LoginVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var altSignUpBtn: UIButton!
    
    
    @IBAction func altSignUpTouched(_ sender: Any) {
        let signupVC = mainSB.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.present(signupVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
//
//        }
//        print(db.collection("users"));
        

        // Do any additional setup after loading the view.
        
        setUpUI()
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        self.txtPassword.delegate = self
        
//        Utilities.logFirebaseError(message: "Test Firebase Logger");
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setUpUI() {
        
        //hide the error label
        lblError.alpha = 0
        
        //solving text clipping
        lblError.baselineAdjustment = .none
        lblError.lineBreakMode = .byCharWrapping
        
        // let unconstrainedSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        // lblError.heightAnchor.constraint(equalToConstant: label.sizeThatFits(unconstrainedSize).height).isActive = true

        //style the text fields
        //Utilities.styleTextField(txtEmail)
        //Utilities.styleTextField(txtPassword)
        
    }
    
    //check the fields and validate the data is correct
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        return nil
    }
    
    

    
    @IBAction func btnLogin(_ sender: Any) {
        
        //validate the text fields
        let error = validateFields()
        
        if error != nil {
            //somethign wrong, show error
            showError(error!)
        } else {
            
            //cleaned variable
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pass = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //signing in the user
            Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
                if error != nil {
                    //couldnt sign in
                    self.lblError.text = error!.localizedDescription
                    self.lblError.alpha = 1
                } else {
                    //check if users are finished the generator before going any further
                    userUID = result!.user.uid
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
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
            
        }
        
        
    }
    
    func showError(_ message:String) {
        lblError.text = message
        lblError.alpha = 1
        
        //solving text clipping
//        let lines = message.length / 60 // about 60 chars a line
//        lblError.numberOfLines = lines+1
        
//        lblError.numberOfLines = 0;
//        lblError.text = message;
//        lblError.sizeThatFits(CGSize)
//        lblError.preferredMaxLayoutWidth = self.frame.size.width;
    }
    
    
    
    func transitionToDashboardVC(){
        let dashboardVC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.dashboardVC) as? DashboardVC
        
        
        view.window?.rootViewController = dashboardVC
        view.window?.makeKeyAndVisible()
    }
    
    func transitionToMixoScene1VC(){
        let mixoScene1VC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.mixoScene1VC) as? MixoScene1VC
        
        
        view.window?.rootViewController = mixoScene1VC
        view.window?.makeKeyAndVisible()
    }
    
    func transitionToMixoScene5VC(){
        mixoState = 5
        let mixoScene5VC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.mixoScene5VC) as? MixoScene5VC
        
    
        view.window?.rootViewController = mixoScene5VC
        view.window?.makeKeyAndVisible()
    }

}
