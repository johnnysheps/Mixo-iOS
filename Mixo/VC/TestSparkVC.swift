//
//  TestDrivenVC.swift
//  Mixo
//
//  Created by Weng on 6/30/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import Foundation
import UIKit


class TestSparkVC: UIViewController
{
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var TV1: UITextView!
    @IBOutlet weak var TV2: UITextView!
    @IBOutlet weak var TV3: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TV1.text = "Changed Text"
        
    }



}
