//
//  TestDrivenVC.swift
//  Mixo
//
//  Created by Weng on 6/30/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

@available(iOS 13.0, *)
class TestSparkVC: UIViewController {
    
    /**
     * Test Summary: Test sparking (aka liking) of mixes (aka events) of users
     *
     * Required setup:
     *  An user whose ID "WobITu1KL8cSSuu86ahQ1YIRGrZ2" must exist
     *  And there should be mix or mixes that belong to user "WobITu1KL8cSSuu86ahQ1YIRGrZ2"
     *
     */

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var TV1: UITextView!
    @IBOutlet weak var TV2: UITextView!
    @IBOutlet weak var TV3: UITextView!
    @IBOutlet weak var TV4: UITextView!
    @IBOutlet weak var TV5: UITextView!
    @IBOutlet weak var TV6: UITextView!
    @IBOutlet weak var TV7: UITextView!
    @IBOutlet weak var TV8: UITextView!
    @IBOutlet weak var TV9: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Why dispatch queue? Wait to request Spark info because had to authenticate you
        overrideLogin();
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.requestMixesList(yourUID:userUID, theirUID: "WobITu1KL8cSSuu86ahQ1YIRGrZ2");
        }
        
        // Setup UI
        label1.adjustsFontSizeToFitWidth = true;
        TV1.font = .systemFont(ofSize: 9.0);
        TV2.font = .systemFont(ofSize: 9.0);
    } // viewDidLoad

    
    func overrideLogin() {
        Auth.auth().signIn(withEmail: "donotremove@mixotype.com", password: "DoNotRemove1!") { (result, error) in
            if error != nil {
                //couldnt sign in
                print("Error: Your test account for development mode's automatic login failed. Please make sure to create an account donotremove@mixotype.com:DoNotRemove1!")
//                    fatalError("App purposely crashed")
            } else {
                //check if users are finished the generator before going any further
                userUID = result!.user.uid
            }
        }
    } // overrideLogin
    
    
        
    func requestMixesList(yourUID:String, theirUID: String) {

        // The mixes an user owns
        let mixRef = db.collection("mix");
        mixRef.whereField("userID", isEqualTo: theirUID).getDocuments { (querySnapshot, error) in
            let mixCount = querySnapshot!.documents.count;
            
            // Get name and number of mixes - Mixes header
            let docRef = db.collection("users").document(theirUID);
            docRef.getDocument { (document, error) in
                if let userDoc = document, userDoc.exists {
//                    self.TV3.text = "user's field name is: " + (document.get("name") as! String)
                    self.TV1.text = "\( userDoc.get("name") as! String ) has \( String(mixCount) ) mixes";
                }
            }
            
            // A Mix accordion row
            for mixDoc in querySnapshot!.documents {
                let UIDSWhoSparkedString = (mixDoc.get("sparkedBy") as! String)
                let UIDsWhoSparked = UIDSWhoSparkedString.components(separatedBy:"_")
                let howManySparked = UIDsWhoSparked.count;

                if(UIDsWhoSparked.count==0 || UIDsWhoSparked.count==1) {
                    self.TV2.text = "\(mixDoc.get("name") as! String): \(mixDoc.get("desc") as! String)\n\(howManySparked) Spark";
                } else {
                    self.TV2.text = "\(mixDoc.get("name") as! String): \(mixDoc.get("desc") as! String)\n\(howManySparked) Sparks";
                }
            } // for
            

//            Next is it unspark or spark? Think unlikable or likable. Make modular.
//                for mix in querySnapshot!.documents {
//                    var sparkedByRaw = mix.get("sparkedBy") as! String;
//                    let UIDsWhoSparked = sparkedByRaw.components(separatedBy:"_")
//                    for uid in UIDsWhoSparked {
//                        self.TV5.text = self.TV5.text + " " + uid;
//                    }
//                    self.TV6.text = "(" + String(UIDsWhoSparked.count) + ")"
//
//                    let sparkedByYou = UIDsWhoSparked.contains(yourUID)
//                    if(sparkedByYou) {
//                        self.TV7.text = "Unspark";
//                    } else {
//                        self.TV7.text = "Spark";
//                    }
//
//
//                } // for each mix the user has
            
            } // mixRef.whereField("userID"

    } // requestMixesList
        


}
