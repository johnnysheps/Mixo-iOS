//
//  Constants.swift
//  Mixo
//
//  Created by Sean Hall on 10/11/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

var userUID = String();
var db = Firestore.firestore()

struct Constants {
    
    struct Storyboard {
        static let dashboardVC = "DashboardVC"
        static let introVC = "IntroVC"
        
        //new scene format
        static let mixoScene1VC = "MixoScene1VC"
        static let mixoScene2aVC = "MixoScene2aVC"
        static let mixoScene2bVC = "MixoScene2bVC"
        static let mixoScene3VC = "MixoScene3VC"
        static let mixoScene4aVC = "MixoScene4aVC"
        static let mixoScene4bVC = "MixoScene4bVC"
        static let mixoScene5VC = "MixoScene5VC"
        static let resultsVC = "ResultsVC"
        static let profileScene1NVC = "ProfileScene1NVC"
        static let profileScene2NVC = "ProfileScene2NVC"
        static let profileScene3NVC = "ProfileScene3NVC"
        static let profileScene4NVC = "ProfileScene4NVC"
        static let profileScene5NVC = "ProfileScene5NVC"
    }
    
}
