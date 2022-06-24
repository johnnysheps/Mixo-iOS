//
//  SignUpVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/11/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

@available(iOS 13.0, *)
class SignUpVC: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var errored = false
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var signInAltText: UITextView!
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        guard textView == signInAltText else {
            return true
        }
        
        let loginVC = mainSB.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present(loginVC, animated: true, completion: nil)
        
        return false
    }
    
    override func viewDidLoad() {
        signInAltText.delegate = self;
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpUI()
        
        txtName.delegate = self
        txtLastName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
        
    }
    
    func setUpUI() {
        
        //hide the error label
        lblError.alpha = 0
        
        //style the text fields
        //Utilities.styleTextField(txtName)
        //Utilities.styleTextField(txtEmail)
        //Utilities.styleTextField(txtPassword)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {

            textField.resignFirstResponder()
            return true
        }
    
    //check the fields and validate the data is correct
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        //check if password is secure
        let cleanedPassword = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is 8 characters long, contains a special character and a number."
        }
        
        //check if email exists in Firebase
        
        
        return nil
    }
    
    @IBAction func btnSignUp(_ sender: Any) {

        //validate the fields
        let error = validateFields()

        if error != nil {
            //somethign wrong, show error
            showError(error!)
            errored = true
        } else {

            //create cleaned version of the data
            let nameFirst = txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let nameLast = txtLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pass = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create the user
            Auth.auth().createUser(withEmail: email, password: pass) { (result, err) in
                
                //check for errors
                if err != nil {
                    //error creating user
                    self.showError("Error creating user.")
                    print(err!);
                    self.errored = true
                } else {
//                    user created
                    //let db = Firestore.firestore()
                    userUID = result!.user.uid
                    
                    db.collection("users").document(userUID).setData([
                        "name": nameLast + ", " + nameFirst,
                        "email": email,
                        "city": "incomplete",
                        "dob": "incomplete",
                        "gender": "incomplete",
                        "profile_pic": "incomplete",
                        "state": "incomplete",
                        "zip": "incomplete",
                        "device": "iOS",
                        "username": "incomplete",
                        "collect": "incomplete",
                        "collect_basket_nest": "incomplete",
                        "collect_done": "N",
                        "collect_img1": "incomplete",
                        "collect_img2": "incomplete",
                        "collect_img3": "incomplete",
                        "collect_img4": "incomplete",
                        "collect_nest": "incomplete",
                        "collect_sub": "incomplete",
                        "intel": "incomplete",
                        "intel_done": "N",
                        "intel_img1": "incomplete",
                        "intel_img2": "incomplete",
                        "intel_img3": "incomplete",
                        "intel_img4": "incomplete",
                        "intel_nest": "incomplete",
                        "intel_sub": "incomplete",
                        "role": "incomplete",
                        "role_basket_nest": "incomplete",
                        "role_done": "N",
                        "role_img1": "incomplete",
                        "role_img2": "incomplete",
                        "role_img3": "incomplete",
                        "role_img4": "incomplete",
                        "role_nest": "incomplete",
                        "role_sub": "incomplete",
                        "talent": "incomplete",
                        "talent_basket_nest": "incomplete",
                        "talent_done": "N",
                        "talent_img1": "incomplete",
                        "talent_img2": "incomplete",
                        "talent_img3": "incomplete",
                        "talent_img4": "incomplete",
                        "talent_nest": "incomplete",
                        "talent_sub": "incomplete"

                    ]) { (error) in
                        if error != nil {
                            self.showError("error saving user data")
                            print(error!);
                            self.errored = true
                        }
                    }
                    
                }
            }
            
            //transition to the Instructions
                if(!self.errored) {
                    let instructionsVC = mainSB.instantiateViewController(withIdentifier: "InstructionsVC") as! InstructionsVC
                    self.present(instructionsVC, animated: true, completion: nil)
            }
        }
        
        
        
        
    }
    
    func showError(_ message:String) {
        lblError.text = message
        lblError.alpha = 1
    }
    

}
