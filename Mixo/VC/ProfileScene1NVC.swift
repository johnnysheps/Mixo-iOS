//
//  ProfileScene2VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/31/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

// TODO(WENG): Validation for setting all dropdowns
//

import UIKit
import DropDown
import FontAwesome_swift

@available(iOS 13.0, *)
class ProfileScene1NVC: UIViewController {

    @IBOutlet weak var dpBirthday: UIDatePicker!
    @IBOutlet weak var btnNext: UIButton!
    
    // Transition to three dropdowns
    @IBOutlet weak var ddYear: UIView!
    @IBOutlet weak var ddYearButton: UIButton!
    @IBOutlet weak var chevron1: UITextView!
    
    var dateString = String()
    let dropDown = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ddYear.layer.borderWidth = 2
        ddYear.layer.borderColor = UIColor.black.cgColor
        ddYear.backgroundColor = UIColor.white
        ddYear.layer.cornerRadius = 10
        ddYear.layer.masksToBounds = true
        
        chevron1.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron1.text = String.fontAwesomeIcon(name: FontAwesome.chevronDown)
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            ddYearButton.setTitle(item, for: .normal)
        }

        
        
        dropDown.anchorView = ddYear
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.dataSource = ["2022",
                               "2021",
                               "2020",
                               "2019",
                               "2018",
                               "2017",
                               "2016",
                               "2015",
                               "2014",
                               "2013",
                               "2012",
                               "2011",
                               "2010",
                               "2009",
                               "2008",
                               "2007",
                               "2006",
                               "2005",
                               "2004",
                               "2003",
                               "2002",
                               "2001",
                               "2000",
                               "1999",
                               "1998",
                               "1997",
                               "1996",
                               "1995",
                               "1994",
                               "1993",
                               "1992",
                               "1991",
                               "1990",
                               "1989",
                               "1988",
                               "1987",
                               "1986",
                               "1985",
                               "1984",
                               "1983",
                               "1982",
                               "1981",
                               "1980",
                               "1979",
                               "1978",
                               "1977",
                               "1976",
                               "1975",
                               "1974",
                               "1973",
                               "1972",
                               "1971",
                               "1970",
                               "1969",
                               "1968",
                               "1967",
                               "1966",
                               "1965",
                               "1964",
                               "1963",
                               "1962",
                               "1961",
                               "1960",
                               "1959",
                               "1958",
                               "1957",
                               "1956",
                               "1955",
                               "1954",
                               "1953",
                               "1952",
                               "1951",
                               "1950",
                               "1949",
                               "1948",
                               "1947",
                               "1946",
                               "1945",
                               "1944",
                               "1943",
                               "1942",
                               "1941",
                               "1940",
                               "1939",
                               "1938",
                               "1937",
                               "1936",
                               "1935"]
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        dateString = formatter.string(from: dpBirthday.date)
    
    }
    
    @IBAction func showDdYearOptions(_ sender:Any) {
        dropDown.show()
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
                    let profileScene2NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene2NVC") as! ProfileScene2NVC
                    self.present(profileScene2NVC, animated:true, completion:nil)
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
