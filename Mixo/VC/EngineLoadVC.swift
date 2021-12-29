//
//  EngineLoad.swift
//  Mixo
//
//  Created by Weng on 12/21/21.
//  Copyright © 2021 Sean Hall. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 13.0, *)
class EngineLoadVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            let mixoIntro = mainSB.instantiateViewController(withIdentifier: "IntroVC") as! IntroVC
            self.present(mixoIntro, animated: true, completion: nil)
        }
    }
}
