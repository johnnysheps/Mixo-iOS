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
    var dateString = String()

    @IBOutlet weak var btnNext: UIButton!

    // Transition to three dropdowns
    @IBOutlet weak var ddYear: UIView!
    @IBOutlet weak var ddYearButton: UIButton!
    @IBOutlet weak var chevron1: UITextView!
    
    @IBOutlet weak var ddMonth: UIView!
    @IBOutlet weak var ddMonthButton: UIButton!
    @IBOutlet weak var chevron2: UITextView!
    
    @IBOutlet weak var ddDay: UIView!
    @IBOutlet weak var ddDayButton: UIButton!
    @IBOutlet weak var chevron3: UITextView!
    
    
    let dropDown1 = DropDown()
    let dropDown2 = DropDown()
    let dropDown3 = DropDown()
    
    var decidedYear = false;
    var decidedMonth = false;
    var decidedDay = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ddYear.layer.borderWidth = 2
        ddYear.layer.borderColor = UIColor.black.cgColor
        ddYear.backgroundColor = UIColor.white
        ddYear.layer.cornerRadius = 10
        ddYear.layer.masksToBounds = true
        
        ddMonth.layer.borderWidth = 2
        ddMonth.layer.borderColor = UIColor.black.cgColor
        ddMonth.backgroundColor = UIColor.white
        ddMonth.layer.cornerRadius = 10
        ddMonth.layer.masksToBounds = true
        
        ddDay.layer.borderWidth = 2
        ddDay.layer.borderColor = UIColor.black.cgColor
        ddDay.backgroundColor = UIColor.white
        ddDay.layer.cornerRadius = 10
        ddDay.layer.masksToBounds = true
        
        chevron1.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron1.text = String.fontAwesomeIcon(name: FontAwesome.chevronDown)
        chevron2.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron2.text = String.fontAwesomeIcon(name: FontAwesome.chevronDown)
        chevron3.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron3.text = String.fontAwesomeIcon(name: FontAwesome.chevronDown)
        
        // Action triggered on selection
        dropDown1.selectionAction = { [unowned self] (index: Int, item: String) in
            ddYearButton.setTitle(item, for: .normal)
            decidedYear = true
        }

        dropDown2.selectionAction = { [unowned self] (index: Int, item: String) in
            ddMonthButton.setTitle(item, for: .normal)
            decidedMonth = true
        }

        dropDown3.selectionAction = { [unowned self] (index: Int, item: String) in
            ddDayButton.setTitle(item, for: .normal)
            decidedDay = true
        }

        
        dropDown1.anchorView = ddYear
        dropDown1.bottomOffset = CGPoint(x: 0, y:(dropDown1.anchorView?.plainView.bounds.height)!)
        dropDown1.dataSource = ["2022", "2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014", "2013", "2012", "2011", "2010", "2009", "2008", "2007", "2006", "2005", "2004", "2003", "2002", "2001", "2000", "1999", "1998", "1997", "1996", "1995", "1994", "1993", "1992", "1991", "1990", "1989", "1988", "1987", "1986", "1985", "1984", "1983", "1982", "1981", "1980", "1979", "1978", "1977", "1976", "1975", "1974", "1973", "1972", "1971", "1970", "1969", "1968", "1967", "1966", "1965", "1964", "1963", "1962", "1961", "1960", "1959", "1958", "1957", "1956", "1955", "1954", "1953", "1952", "1951", "1950", "1949", "1948", "1947", "1946", "1945", "1944", "1943", "1942", "1941", "1940", "1939", "1938", "1937", "1936", "1935"]
        
        dropDown2.anchorView = ddMonth
        dropDown2.bottomOffset = CGPoint(x: 0, y:(dropDown2.anchorView?.plainView.bounds.height)!)
        dropDown2.dataSource = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        
        dropDown3.anchorView = ddMonth
        dropDown3.bottomOffset = CGPoint(x: 0, y:(dropDown3.anchorView?.plainView.bounds.height)!)
        dropDown3.dataSource = ["1",  "2",  "3",  "4",  "5",  "6",  "7",  "8",  "9",  "10",  "11",  "12",  "13",  "14",  "15",  "16",  "17",  "18",  "19",  "20",  "21",  "22",  "23",  "24",  "25",  "26",  "27",  "28",  "29",  "30", "31"]
        
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        dateString = formatter.string(from: dpBirthday.date)
        print("Raw: \(dpBirthday.date); Converted dateString: \(dateString)")
        // Raw: 2022-03-12 06:28:00 +0000; Converted dateString: 2022-03-11
    
    }
    
    @IBAction func showDdYearOptions(_ sender:Any) {
        dropDown1.show()
    }
    @IBAction func showDdMonthOptions(_ sender:Any) {
        dropDown2.show()
    }
    @IBAction func showDdDayOptions(_ sender:Any) {
        dropDown3.show()
    }
    
    @IBAction func btnNext(_ sender: Any) {

        if !decidedYear || !decidedMonth || !decidedDay {
            warningInt = 6
            let warningVC = warningSB.instantiateViewController(withIdentifier: "WarningVC") as! WarningVC
            self.present(warningVC, animated:true, completion:nil)
        } else {
            
            let yyyy = ddYearButton.title(for: .normal)!;
            let mm_prior = ddMonthButton.title(for: .normal)!;
            var mm:String!
            var dd = ddDayButton.title(for: .normal)!
            
            switch(mm_prior) {
                case "January":
                    mm = "01";
                case "February":
                    mm = "02";
                case "March":
                    mm = "03";
                case "April":
                    mm = "04";
                case "May":
                    mm = "05";
                case "June":
                    mm = "06";
                case "July":
                    mm = "07";
                case "August":
                    mm = "08";
                case "September":
                    mm = "09";
                case "October":
                    mm = "10";
                case "November":
                    mm = "11";
                case "December":
                    mm = "12";
                default:
                    mm = "Error";
            }
            
            if(dd.length==1) {
                dd = "0" + dd;
            }
            dateString = yyyy + "-" + mm + "-" + dd
            print("Converted dateString: \(dateString)")
            
            // Raw: 2022-03-12 06:28:00 +0000; Converted dateString: 2022-03-11
            
//            //save the users birthdate to Firebase
//            docRef.updateData([
//                "dob": dateString,
//            ]) { err in
//                if let err = err {
//                    print("Error updating document: \(err)")
//                } else {
//                    let profileScene2NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene2NVC") as! ProfileScene2NVC
//                    self.present(profileScene2NVC, animated:true, completion:nil)
//                }
//            }
        }
        
        
    } // btnNext
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
