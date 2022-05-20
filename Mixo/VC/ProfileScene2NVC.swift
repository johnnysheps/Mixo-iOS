//
//  ProfileScene3VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ProfileScene2NVC: UIViewController {

    // Multistep progress bar
    
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    // Buttons

    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnOther: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var imgCheck1: UIImageView!
    @IBOutlet weak var imgCheck2: UIImageView!
    @IBOutlet weak var imgCheck3: UIImageView!
    
    var gender = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        imgCheck1.isHidden = true
        imgCheck2.isHidden = true
        imgCheck3.isHidden = true
        
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    func setUpUI() {
        
        // Progess indicators - Render appropriately
        ivProgressIndicator0.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator1.image = UIImage(named:"progress-indicator-purple")
        ivProgressIndicator2.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator3.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator4.image = UIImage(named:"progress-indicator-gray")
        
    }

    @IBAction func btnMale(_ sender: Any) {
        if(imgCheck1.isHidden == false){
            imgCheck1.isHidden = true
            gender = "";
        } else if(imgCheck2.isHidden == false) {
            imgCheck2.isHidden = true
            imgCheck1.isHidden = false
            gender = "M";
        } else if(imgCheck3.isHidden == false){
            imgCheck3.isHidden = true;
            imgCheck1.isHidden = false
            gender = "M";
        } else {
            imgCheck1.isHidden = false
            gender="M";
        }
    }
    
    @IBAction func btnOther(_ sender: Any) {
        if(imgCheck2.isHidden == false){
            imgCheck2.isHidden = true
            gender = "";
        } else if(imgCheck1.isHidden == false) {
            imgCheck1.isHidden = true
            imgCheck2.isHidden = false
            gender = "O";
        } else if(imgCheck3.isHidden == false){
            imgCheck3.isHidden = true;
            imgCheck2.isHidden = false
            gender = "O";
        } else {
            imgCheck2.isHidden = false
            gender="O";
        }
    }
    
    @IBAction func btnFemale(_ sender: Any) {
        if(imgCheck3.isHidden == false){
            imgCheck3.isHidden = true
            gender = "";
        } else if(imgCheck2.isHidden == false) {
            imgCheck2.isHidden = true
            imgCheck3.isHidden = false
            gender = "F";
        } else if(imgCheck1.isHidden == false){
            imgCheck1.isHidden = true;
            imgCheck3.isHidden = false
            gender = "F";
        } else {
            imgCheck3.isHidden = false
            gender="F";
        }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        if gender == ""{
            warningInt = 7
            let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
            self.present(warningVC, animated:true, completion:nil)
        } else {
            //save the users gender to Firebase
            docRef.updateData([
                "gender": gender,
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    let profileScene3NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene3NVC") as! ProfileScene3NVC
                    self.present(profileScene3NVC, animated:true, completion:nil)
                }
            }
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
