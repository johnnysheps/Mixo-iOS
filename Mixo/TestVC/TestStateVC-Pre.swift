//
//  ClickToTestStateVC.swift
//  Mixo
//
//  Created by Weng on 6/30/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI // Imports UIHostingController
import FirebaseAuth
import Firebase
import FirebaseFirestore

@available(iOS 13.0, *)
class ClickToTestStateVC: UIViewController {

    
    override func viewDidLoad() {
        
    } // viewDidLoad

    @IBAction func testStatesTouchedDown(_ sender: Any) {
        
        let contentViewInHC = UIHostingController(rootView: TestStateVC())
        
        addChild(contentViewInHC)
        view.addSubview(contentViewInHC.view)
        contentViewInHC.didMove(toParent: self)
        contentViewInHC.view?.translatesAutoresizingMaskIntoConstraints = false;
        contentViewInHC.view?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true;
        contentViewInHC.view?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true;
        contentViewInHC.view?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true;
        contentViewInHC.view?.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true;
    }
    
        


}
