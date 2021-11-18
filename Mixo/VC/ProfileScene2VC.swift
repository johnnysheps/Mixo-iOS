//
//  ProfileScene2VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class ProfileScene2VC: UIViewController {

    @IBOutlet weak var dpBirthday: UIDatePicker!
    @IBOutlet weak var btnNext: UIButton!
    
    var dateString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        dateString = formatter.string(from: dpBirthday.date)
    
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        if dateString.isEmpty{
            warningInt = 6
            let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
            self.present(warningVC, animated:true, completion:nil)
        } else {
            //save the users birthdate to Firebase
            docRef.updateData([
                "dob": dateString,
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    let profileScene3VC = mainSB.instantiateViewController(withIdentifier: "ProfileScene3VC") as! ProfileScene3VC
                    self.present(profileScene3VC, animated:true, completion:nil)
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
