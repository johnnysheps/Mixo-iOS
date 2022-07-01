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
    
    // Test constants:
    var userIDForSparkTest = "WobITu1KL8cSSuu86ahQ1YIRGrZ2";
    
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
        overrideLogin();
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.runBody();
        }
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
        
    func runBody() {
        var yourUID = userUID;
//        print("/****/ yourUID");
//        print(yourUID)
//        fatalError()
        var theirUID:String = "";

        
        self.TV1.text = "user ID obtained from authentication: " + userUID;
        docRef = db.collection("users").document(userUID);
        self.TV2.text = "document ID at current user document:" + docRef.documentID;
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.TV3.text = "user's field name is: " + (document.get("name") as! String)
            }
        }
        
        self.TV4.text = "user 2's document ID cannot be found. add a user whose name is 'mike'";
        let collectionRef = db.collection("users");
        collectionRef.whereField("name", isEqualTo: "mike").limit(to:1).getDocuments { (querySnapshot, error) in
            for document in querySnapshot!.documents {
                
                self.TV4.text = "user 2's document ID is: " + document.documentID;
            }
        }
        
        // Test setup
        self.TV5.text = "user 2's number of sparks: ";
        theirUID = userIDForSparkTest;
        
        // Test limits: Will only show an end of all the mixes, rather than all of them, because the text gets replaced on each for loop on the mixes
        
        // Test run
        let mixRef = db.collection("mix");
        mixRef.whereField("userID", isEqualTo: theirUID).getDocuments { (querySnapshot, error) in
                for mix in querySnapshot!.documents {
                    var sparkedByRaw = mix.get("sparkedBy") as! String;
                    let UIDsWhoSparked = sparkedByRaw.components(separatedBy:"_")
                    for uid in UIDsWhoSparked {
                        self.TV5.text = self.TV5.text + " " + uid;
                    }
                    self.TV6.text = "(" + String(UIDsWhoSparked.count) + ")"
                    
                    let sparkedByYou = UIDsWhoSparked.contains(yourUID)
                    if(sparkedByYou) {
                        self.TV7.text = "Unspark";
                    } else {
                        self.TV7.text = "Spark";
                    }
                    
                    // [ ] Test for false positive by changing it at the database
                    
                } // for each mix the user has
            }
        
        
        

    } // runBody
        


}
