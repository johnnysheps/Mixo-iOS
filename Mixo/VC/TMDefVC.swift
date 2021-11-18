//
//  TMDefVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/18/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

class TMDefVC: UIViewController {

    
    @IBOutlet weak var outlineView: UIView!
    @IBOutlet weak var inlineView: UIView!
    
    @IBOutlet weak var imgDef1: UIImageView!
    @IBOutlet weak var imgDef2: UIImageView!
    @IBOutlet weak var imgDef3: UIImageView!
    @IBOutlet weak var imgDef4: UIImageView!
    
    @IBOutlet weak var lblDef1Title: UILabel!
    @IBOutlet weak var lblDef1Text: UILabel!
    @IBOutlet weak var lblDef2Title: UILabel!
    @IBOutlet weak var lblDef2Text: UILabel!
    @IBOutlet weak var lblDef3Title: UILabel!
    @IBOutlet weak var lblDef3Text: UILabel!
    @IBOutlet weak var lblDef4Title: UILabel!
    @IBOutlet weak var lblDef4Text: UILabel!
    
    @IBOutlet weak var btnDismiss: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    func setUpUI() {
        
        Utilities.styleOuterView(outlineView)
        Utilities.styleInnerView(inlineView)
        
        switch alertType {
            
            case "temp"  :
                lblDef1Title.text = tm1Title
                lblDef1Text.text = tm1Text
                imgDef1.image = UIImage(named: tm1Image)
                lblDef2Title.text = tm2Title
                lblDef2Text.text = tm2Text
                imgDef2.image = UIImage(named: tm2Image)
                lblDef3Title.text = tm3Title
                lblDef3Text.text = tm3Text
                imgDef3.image = UIImage(named: tm3Image)
                lblDef4Title.text = tm4Title
                lblDef4Text.text = tm4Text
                imgDef4.image = UIImage(named: tm4Image)
            case "mod"  :
                lblDef1Title.text = tm1Title
                lblDef1Text.text = tm1Text
                imgDef1.image = UIImage(named: tm1Image)
                lblDef2Title.text = tm2Title
                lblDef2Text.text = tm2Text
                imgDef2.image = UIImage(named: tm2Image)
                lblDef3Title.text = tm3Title
                lblDef3Text.text = tm3Text
                imgDef3.image = UIImage(named: tm3Image)
                lblDef4Title.text = tm4Title
                lblDef4Text.text = tm4Text
                imgDef4.image = UIImage(named: tm4Image)
            default :
                return
        }
        
        
        
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
