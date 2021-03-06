//
//  ProfileScene4VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FontAwesome_swift

struct Location : Decodable {
    let city: String
    let state: String
}

var city = String()
var state = String()

@available(iOS 13.0, *)
class ProfileScene3NVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var chevron: UITextView!
    
    // Multistep progress bar
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    // Buttons
    
    @IBOutlet weak var txtZipCode: UITextField!
    @IBOutlet weak var lblCityState: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    var zipCode = String()
    override func viewDidLoad() {
        chevron.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron.text = String.fontAwesomeIcon(name: FontAwesome.chevronRight)
        super.viewDidLoad()

        lblCityState.isHidden = true
        txtZipCode.delegate = self
        txtZipCode.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {

            textField.resignFirstResponder()
            return true
        }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if txtZipCode.text!.count == 5{
            
            zipCode = txtZipCode.text!
            
            //get the city and state from database
            let queryParams: [String: String] = [
                "zipcode": zipCode,
            ]
            
            var urlComponents = URLComponents()
            urlComponents.scheme = "http"
            urlComponents.host = "engine.mixotype.com"
            urlComponents.path = "/app/webapis/ios/zipcode.php"
            urlComponents.setQueryItems(with: queryParams)
            let urlString = urlComponents.url?.absoluteString
            
            guard let url = URL(string: urlString!) else {return}
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard let data = data else { return }
                
                do {
                    
                    let decoder = JSONDecoder()
                    let info = try decoder.decode([Location].self, from: data)
                    
//                    print(self.zipCode);
//                    print(data);
//                    print(city);
                    
                    if(info.indices.contains(0)) {
                        city = info[0].city
                        state = info[0].state
                    } else {
                        city = "";
                        state = "";
                    }
                    
                    DispatchQueue.main.async {
                        
                        self.lblCityState.text = city + ", " + state
                        self.lblCityState.isHidden = false
                    }
                } catch {
                    print("JSONSerialization error:", error)
                }
            }.resume()
        } else {
            lblCityState.isHidden = true
        }
    }
    
//go to ProfileScene5
//    func transitionToProfileScene5VC(){
//        let profileScene4NVC = storyboard?.instantiateViewController(identifier: Constants.Storyboard.profileScene4NVC) as? ProfileScene4NVC
//        
//        view.window?.rootViewController = profileScene4NVC
//        view.window?.makeKeyAndVisible()
//    }
    

    @IBAction func btnNext(_ sender: Any) {
        if zipCode == ""{
            warningInt = 8
            let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
            self.present(warningVC, animated:true, completion:nil)
        } else {
            //save the users zip, city and state to Firebase
            docRef.updateData([
                "zip": zipCode,
                "city": city,
                "state": state,
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
//                    let dashboardVC = mainSB.instantiateViewController(withIdentifier: "DashboardVC") as! DashboardVC
//                    self.present(dashboardVC, animated:true, completion:nil)
                    let profileScene4NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene4NVC") as! ProfileScene4NVC
                    self.present(profileScene4NVC, animated:true, completion:nil)
                }
            }
            
        }
    }
    
    
    func setUpUI() {
        
        //hide the error label
        lblCityState.isHidden = true
        
        //style the text fields
        Utilities.styleTextField(txtZipCode)
        
        // Progess indicators - Render appropriately
        ivProgressIndicator0.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator1.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator2.image = UIImage(named:"progress-indicator-purple")
        ivProgressIndicator3.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator4.image = UIImage(named:"progress-indicator-gray")
            
        
    }
    

}
