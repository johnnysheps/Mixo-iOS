// STORYBOARD: Start is the starting screen where user chooses Login or Signup.
// NAMESAKED: User starts their interactions
// POSITIONED before login/signup
//
//  StartVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/11/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

var mixoState: Int = 0

@available(iOS 13.0, *)
class StartVC: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Utilities.roundedCorner(btnLogin)
        Utilities.roundedCorner(btnSignUp)
        
        /*
         
         https://mixotype.com/rosalind-server/test-firebase-ios/?test-firebase-ios?access_token=abc&message=hello
         */
        let url = URL(string: "https://mixotype.com/rosalind-server/server/logger-firebase-ios/?access_token=abc&message=ios")!

        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {                                              // check for fundamental networking error
                print("error", error ?? "Unknown error")
                return
            }

            guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                print("statusCode should be 2xx, but is \(response.statusCode)")
                print("response = \(response)")
                return
            }

            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
        }

        task.resume()
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
