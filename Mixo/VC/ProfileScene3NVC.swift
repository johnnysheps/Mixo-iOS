//
//  ProfileScene4VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

struct Location : Decodable {
    let city: String
    let state: String
}

var city = String()
var state = String()

@available(iOS 13.0, *)
class ProfileScene3NVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtZipCode: UITextField!
    @IBOutlet weak var lblCityState: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    
    var zipCode = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        lblCityState.isHidden = true
        txtZipCode.delegate = self
        txtZipCode.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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
            urlComponents.host = "mixotype.com"
            urlComponents.path = "/app/webapis/ios/zipcode.php"
            urlComponents.setQueryItems(with: queryParams)
            let urlString = urlComponents.url?.absoluteString
            
            guard let url = URL(string: urlString!) else {return}
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard let data = data else { return }
                
                do {
                    
                    let decoder = JSONDecoder()
                    let info = try decoder.decode([Location].self, from: data)
                    
                    city = info[0].city
                    state = info[0].state
                    
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
        
    }
    

}
