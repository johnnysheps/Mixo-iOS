//
//  DefinitionsVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/15/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class DefinitionsVC: UIViewController {

    
    @IBOutlet weak var viewOutline: UIView!
    @IBOutlet weak var inlineView: UIView!
    @IBOutlet weak var imgDefImage: UIImageView!
    @IBOutlet weak var lblDefTitle: UILabel!
    @IBOutlet weak var lblDefText: UILabel!
    
    @IBOutlet weak var btnDismiss: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }
    
    func setUpUI() {
        Utilities.styleOuterView(viewOutline)
        Utilities.styleInnerView(inlineView)
        switch alertInt {
            case 1  :
                lblDefTitle.text = archTitle
                lblDefText.text = archText
                imgDefImage.image = UIImage(named: archImage)
            default :
                return
        }
        
        
        
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        
        dismiss(animated: true)
    }
    

}
