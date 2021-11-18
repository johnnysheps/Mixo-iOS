//
//  ProfileScene3VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ProfileScene3VC: UIViewController {

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
                    let profileScene4VC = mainSB.instantiateViewController(withIdentifier: "ProfileScene4VC") as! ProfileScene4VC
                    self.present(profileScene4VC, animated:true, completion:nil)
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
