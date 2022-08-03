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
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var altSignInBtn: UIButton!
    
    @IBAction func altSignInTouched(_ sender: Any) {
        let loginVC = mainSB.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present(loginVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpUI()
        
        txtName.delegate = self
        txtLastName.delegate = self
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func setUpUI() {
        
        //hide the error label
        lblError.alpha = 0
        
        //style the text fields
        //Utilities.styleTextField(txtName)
        //Utilities.styleTextField(txtEmail)
        //Utilities.styleTextField(txtPassword)
    }
    
    //check the fields and validate the data is correct
    func validateFields() -> String? {
        
        //check that all fields are filled in
        if txtName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        // check if email is valid
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
        let cleanedEmail = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if(!isValidEmail(cleanedEmail)) {
            return "Invalid email format. Follow email format ***@***.***, Eg. some.user@gmail.com"
        }
        
        
        //check if password is strong
        let cleanedPassword = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        func contains(_ subject:String, _ possible:String) -> Bool {
            let charset = CharacterSet(charactersIn: possible)
            if subject.rangeOfCharacter(from: charset) != nil {
                return true;
            } else {
                return false;
            }
        }

        func isPasswordStrong(_ password:String) -> String {
            if(password.count<8) { return "Please make sure your password is 8 characters long"; }
            else if(!contains(cleanedPassword, "0123456789")) { return "Please make sure your password has a number 0-9"; }
            else if(!contains(cleanedPassword, ".*[$@$#!%*?& ]")) { return "Please make sure your password has a special character like:.*[$@$#!%*?& ]"; }
            else {return "PASSED";}
        } // isPasswordFailed
                        
        if(!(isPasswordStrong(cleanedPassword)=="PASSED")) {
            return("Weak password. " + isPasswordStrong(cleanedPassword));
        }
        
        
        return nil
    }
    
    @IBAction func btnSignUp(_ sender: Any) {

        //validate the fields
        let error = validateFields()

        if error != nil {
            //somethign wrong, show error
            showError(error!) // The error validating textfields is pretty reliable that it'll be human friendly to read
        } else {

            //create cleaned version of the data
            let nameFirst = txtName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let nameLast = txtLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pass = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //create the user
            Auth.auth().createUser(withEmail: email, password: pass) { (result, err) in
                
//                print("/***/ email")
//                print(email)
//
//                print("/***/ result")
//                print(result)
                
                //check for errors
                if result == nil {
                    // error creating user
                    var errorCreatingAuth = "Error creating user. ";
                    if(err.debugDescription.contains("ERROR_EMAIL_ALREADY_IN_USE")) {
                        errorCreatingAuth = errorCreatingAuth + "This email already exists.";
                    }
                    else if(err.debugDescription.contains("ERROR_INVALID_EMAIL")) {
                        errorCreatingAuth = errorCreatingAuth + "Email address is not correct format";
                    }
                    else if(err.debugDescription.contains("ERROR_TOO_MANY_REQUESTS")) {
                        errorCreatingAuth = errorCreatingAuth + "Too many requests";
                    }
                    else {
                        errorCreatingAuth = errorCreatingAuth + "Please contact us.";
                        print("/***/ Error signing up");
                        print(err.debugDescription);
                    }
                    
                    self.showError(errorCreatingAuth)
                    
                } else {
//                  User created
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
                            self.showError("Error saving user data. Please contact us.")
                            print("/***/ Error saving user data")
                            print(error!);
                        } else {
                            self.goNextScene();
                        }
                    }
                    
                }
            }
        }
        
        
        
        
    } // btnSignUp
    
    
    func goNextScene() {
        let instructionsVC = mainSB.instantiateViewController(withIdentifier: "InstructionsVC") as! InstructionsVC
        self.present(instructionsVC, animated: true, completion: nil)
    }
    
    func showError(_ message:String) {
        lblError.text = message
        lblError.alpha = 1
        // lblError.translatesAutoresizingMaskIntoConstraints = false;
        // lblError.heightAnchor.constraint(equalToConstant: 200).isActive = true;
    }
}
