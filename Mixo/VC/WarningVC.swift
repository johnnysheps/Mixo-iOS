//
//  WarningVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/17/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

class WarningVC: UIViewController {

    @IBOutlet weak var outlineView: UIView!
    @IBOutlet weak var inlineView: UIView!
    @IBOutlet weak var lblWarning: UILabel!
    @IBOutlet weak var btnDismiss: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        setUpUI()
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func setUpUI() {
        
        Utilities.styleOuterView(outlineView)
        Utilities.styleInnerView(inlineView)
        
             switch warningInt {
                case 1  :
                    lblWarning.text = "You can only select 4 Heroes"
                case 2  :
                    lblWarning.text = "You can only select 4 Intelligences"
                case 3  :
                    lblWarning.text = "You can only select 4 Talents"
                case 4  :
                    lblWarning.text = "You can only select 4 Collections"
                case 5  :
                    lblWarning.text = "You must complete the \nIntelligences first"
                case 6:
                    lblWarning.text = "You must enter your birthdate"
                case 7:
                    lblWarning.text = "You must select a gender"
                case 8:
                    lblWarning.text = "You must enter a zipcode"
                 default :
                     return
             }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
