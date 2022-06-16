//
//  ResultsVC.swift
//  Mixo
//
//  Created by Sean Hall on 10/28/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit

struct Result : Decodable {
    let text: String
}

var htText1 = String()
var htText2 = String()
var htText3 = String()
var htText4 = String()
var iText1 = String()
var iText2 = String()
var iText3 = String()
var iText4 = String()
var tmText1 = String()
var tmText2 = String()
var tmText3 = String()
var tmText4 = String()
var cmText1 = String()
var cmText2 = String()
var cmText3 = String()
var cmText4 = String()

@available(iOS 13.0, *)
class ResultsVC: UIViewController {
    var previousScreen:(()->Void)?

    @IBOutlet weak var hero1: UIImageView!
    @IBOutlet weak var hero2: UIImageView!
    @IBOutlet weak var hero3: UIImageView!
    @IBOutlet weak var hero4: UIImageView!
    @IBOutlet weak var temp1: UIImageView!
    @IBOutlet weak var temp2: UIImageView!
    @IBOutlet weak var temp3: UIImageView!
    @IBOutlet weak var temp4: UIImageView!
    @IBOutlet weak var htresults1: UILabel!
    @IBOutlet weak var htresults2: UILabel!
    @IBOutlet weak var htresults3: UILabel!
    @IBOutlet weak var htresults4: UILabel!
    
    @IBOutlet weak var intel1: UIImageView!
    @IBOutlet weak var intel2: UIImageView!
    @IBOutlet weak var intel3: UIImageView!
    @IBOutlet weak var intel4: UIImageView!
    @IBOutlet weak var intelresults1: UILabel!
    @IBOutlet weak var intelresults2: UILabel!
    @IBOutlet weak var intelresults3: UILabel!
    @IBOutlet weak var intelresults4: UILabel!
    
    @IBOutlet weak var talent1: UIImageView!
    @IBOutlet weak var talent2: UIImageView!
    @IBOutlet weak var talent3: UIImageView!
    @IBOutlet weak var talent4: UIImageView!
    @IBOutlet weak var tmod1: UIImageView!
    @IBOutlet weak var tmod2: UIImageView!
    @IBOutlet weak var tmod3: UIImageView!
    @IBOutlet weak var tmod4: UIImageView!
    @IBOutlet weak var tmresults1: UILabel!
    @IBOutlet weak var tmresults2: UILabel!
    @IBOutlet weak var tmresults3: UILabel!
    @IBOutlet weak var tmresults4: UILabel!
    
    @IBOutlet weak var collect1: UIImageView!
    @IBOutlet weak var collect2: UIImageView!
    @IBOutlet weak var collect3: UIImageView!
    @IBOutlet weak var collect4: UIImageView!
    @IBOutlet weak var cmod1: UIImageView!
    @IBOutlet weak var cmod2: UIImageView!
    @IBOutlet weak var cmod3: UIImageView!
    @IBOutlet weak var cmod4: UIImageView!
    @IBOutlet weak var cmresults1: UILabel!
    @IBOutlet weak var cmresults2: UILabel!
    @IBOutlet weak var cmresults3: UILabel!
    @IBOutlet weak var cmresults4: UILabel!
    
    @IBOutlet weak var btnDismiss: UIButton!
    
    var heroImages: [String] = [] //array that holds the heroes
    var intelImages: [String] = [] //array that holds the intels
    var talentImages: [String] = []//array that holds the talents
    var collectImages: [String] = []//array that holds the collections
    var temperamentImages: [String] = []//array that holds the temperaments
    var modalityImages: [String] = []//array that holds the modalities
    
    var ht1String = String()
    var ht2String = String()
    var ht3String = String()
    var ht4String = String()
    var i1String = String()
    var i2String = String()
    var i3String = String()
    var i4String = String()
    var tm1String = String()
    var tm2String = String()
    var tm3String = String()
    var tm4String = String()
    var cm1String = String()
    var cm2String = String()
    var cm3String = String()
    var cm4String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //heroes
        heroImages.append("actoras")
        heroImages.append("leaderas")
        heroImages.append("philosopheras")
        heroImages.append("athleteas")
        heroImages.append("musicianas")
        heroImages.append("scientistas")
        heroImages.append("designeras")
        heroImages.append("naturalistas")
        heroImages.append("selfreflectoras")
        
        //intels
        intelImages.append("verbalas")
        intelImages.append("naturalisticas")
        intelImages.append("interpersonalas")
        intelImages.append("logicalas")
        intelImages.append("bodilyas")
        intelImages.append("intrapersonalas")
        intelImages.append("musicalas")
        intelImages.append("visualas")
        intelImages.append("existentialas")
        
        //talents
        talentImages.append("v1img1as") //Verbal - 1 - [0]
        talentImages.append("v1img2as") //Verbal - 2 - [1]
        talentImages.append("v1img3as") //Verbal - 3 - [2]
        talentImages.append("v1img4as") //Verbal - 4 - [3]
        talentImages.append("nimg1as") //Naturalistic - 5 - [4]
        talentImages.append("nimg2as") //Naturalistic - 6 - [5]
        talentImages.append("nimg3as") //Naturalistic - 7 - [6]
        talentImages.append("nimg4as") //Naturalistic - 8 - [7]
        talentImages.append("i1img1as") //Interpersonal - 9 - [8]
        talentImages.append("i1img2as") //Interpersonal - 10 - [9]
        talentImages.append("i1img3as") //Interpersonal - 11 - [10]
        talentImages.append("i1img4as") //Interpersonal - 12 - [11]
        talentImages.append("limg1as") //Logical - 13 - [12]
        talentImages.append("limg2as") //Logical - 14 - [13]
        talentImages.append("limg3as") //Logical - 15 - [14]
        talentImages.append("limg4as") //Logical - 16 - [15]
        talentImages.append("bimg1as") //Bodily - 17 - [16]
        talentImages.append("bimg2as") //Bodily - 18 - [17]
        talentImages.append("bimg3as") //Bodily - 19 - [18]
        talentImages.append("bimg4as") //Bodily - 20 - [19]
        talentImages.append("i2img1as") //Intrapersonal - 21 - [20]
        talentImages.append("i2img2as") //Intrapersonal - 22 - [21]
        talentImages.append("i2img3as") //Intrapersonal - 23 - [22]
        talentImages.append("i2img4as") //Intrapersonal - 24 - [23]
        talentImages.append("mimg1as") //Musical - 25 - [24]
        talentImages.append("mimg2as") //Musical - 26 - [25]
        talentImages.append("mimg3as") //Musical - 27 - [26]
        talentImages.append("mimg4as") //Musical - 28 - [27]
        talentImages.append("v2img1as") //Visual - 29 - [28]
        talentImages.append("v2img2as") //Visual - 30 - [29]
        talentImages.append("v2img3as") //Visual - 31 - [30]
        talentImages.append("v2img4as") //Visual - 32 - [31]
        talentImages.append("eimg1as") //Existential - 33 - [32]
        talentImages.append("eimg2as") //Existential - 34 - [33]
        talentImages.append("eimg3as") //Existential - 35 - [34]
        talentImages.append("eimg4as") //Existential - 36 - [35]
        
        //collecitons
        collectImages.append("socialactivitiesas")
        collectImages.append("musicas")
        collectImages.append("heirloomsas")
        collectImages.append("fitnessas")
        collectImages.append("aestheticsas")
        collectImages.append("natureas")
        collectImages.append("technologyas")
        collectImages.append("theatricalas")
        collectImages.append("selfimprovementas")
        
        //temperaments
        temperamentImages.append("king")
        temperamentImages.append("warrior")
        temperamentImages.append("magician")
        temperamentImages.append("lover")
        
        //modalities
        modalityImages.append("physical")
        modalityImages.append("spiritual")
        modalityImages.append("logical")
        modalityImages.append("creative")
        
        getUserData()
    }
    
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.previousScreen!()
    }
    
    func getUserData(){
        //get the users choices
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                
                //heroes
                let role_nest = document.get("role_nest")  as! String
                let role_basket_nest = document.get("role_basket_nest") as! String
                    
                //add the strings to the heroBlurb array
                htText1 = role_nest[0] + role_basket_nest[0]
                htText2 = role_nest[1] + role_basket_nest[1]
                htText3 = role_nest[2] + role_basket_nest[2]
                htText4 = role_nest[3] + role_basket_nest[3]
                
                //set the images
                self.hero1.image = UIImage(named: self.heroImages[Int(role_nest[0])! - 1])
                self.hero2.image = UIImage(named: self.heroImages[Int(role_nest[1])! - 1])
                self.hero3.image = UIImage(named: self.heroImages[Int(role_nest[2])! - 1])
                self.hero4.image = UIImage(named: self.heroImages[Int(role_nest[3])! - 1])
                self.temp1.image = UIImage(named: self.temperamentImages[Int(role_basket_nest[0])! - 1])
                self.temp2.image = UIImage(named: self.temperamentImages[Int(role_basket_nest[1])! - 1])
                self.temp3.image = UIImage(named: self.temperamentImages[Int(role_basket_nest[2])! - 1])
                self.temp4.image = UIImage(named: self.temperamentImages[Int(role_basket_nest[3])! - 1])
                
                //intels
                let intel_nest = document.get("intel_nest")  as! String
                    
                //add the strings to the intelBlurb array
                iText1 = intel_nest[0] + "1"
                iText2 = intel_nest[1] + "2"
                iText3 = intel_nest[2] + "3"
                iText4 = intel_nest[3] + "4"
                    
                //set the images
                self.intel1.image = UIImage(named: self.intelImages[Int(intel_nest[0])! - 1])
                self.intel2.image = UIImage(named: self.intelImages[Int(intel_nest[1])! - 1])
                self.intel3.image = UIImage(named: self.intelImages[Int(intel_nest[2])! - 1])
                self.intel4.image = UIImage(named: self.intelImages[Int(intel_nest[3])! - 1])
                
                //talents
                let talent_nest = document.get("talent_nest")  as! String
                let talent_basket_nest = document.get("talent_basket_nest") as! String
                let talent_nestArr = talent_nest.components(separatedBy: "_")
                
                //add the strings to the talentBlurb array
                tmText1 = talent_nestArr[0] + talent_basket_nest[0]
                tmText2 = talent_nestArr[1] + talent_basket_nest[1]
                tmText3 = talent_nestArr[2] + talent_basket_nest[2]
                tmText4 = talent_nestArr[3] + talent_basket_nest[3]
                    
                //set the images
                self.talent1.image = UIImage(named: self.talentImages[Int(talent_nestArr[0])! - 1])
                self.talent2.image = UIImage(named: self.talentImages[Int(talent_nestArr[1])! - 1])
                self.talent3.image = UIImage(named: self.talentImages[Int(talent_nestArr[2])! - 1])
                self.talent4.image = UIImage(named: self.talentImages[Int(talent_nestArr[3])! - 1])
                self.tmod1.image = UIImage(named: self.modalityImages[Int(talent_basket_nest[0])! - 1])
                self.tmod2.image = UIImage(named: self.modalityImages[Int(talent_basket_nest[1])! - 1])
                self.tmod3.image = UIImage(named: self.modalityImages[Int(talent_basket_nest[2])! - 1])
                self.tmod4.image = UIImage(named: self.modalityImages[Int(talent_basket_nest[3])! - 1])
                
                //collections
                let collect_nest = document.get("collect_nest")  as! String
                let collect_basket_nest = document.get("collect_basket_nest") as! String
                    
                //add the strings to the collectBlurb array
                cmText1 = collect_nest[0] + collect_basket_nest[0]
                cmText2 = collect_nest[1] + collect_basket_nest[1]
                cmText3 = collect_nest[2] + collect_basket_nest[2]
                cmText4 = collect_nest[3] + collect_basket_nest[3]
                    
                //set the images
                self.collect1.image = UIImage(named: self.collectImages[Int(collect_nest[0])! - 1])
                self.collect2.image = UIImage(named: self.collectImages[Int(collect_nest[1])! - 1])
                self.collect3.image = UIImage(named: self.collectImages[Int(collect_nest[2])! - 1])
                self.collect4.image = UIImage(named: self.collectImages[Int(collect_nest[3])! - 1])
                self.cmod1.image = UIImage(named: self.modalityImages[Int(collect_basket_nest[0])! - 1])
                self.cmod2.image = UIImage(named: self.modalityImages[Int(collect_basket_nest[1])! - 1])
                self.cmod3.image = UIImage(named: self.modalityImages[Int(collect_basket_nest[2])! - 1])
                self.cmod4.image = UIImage(named: self.modalityImages[Int(collect_basket_nest[3])! - 1])
                
                //get the results from the server
                //heroes
                self.getHeroResults(blurbID: htText1, pos: 1)
                self.getHeroResults(blurbID: htText2, pos: 2)
                self.getHeroResults(blurbID: htText3, pos: 3)
                self.getHeroResults(blurbID: htText4, pos: 4)
                //intels
                self.getIntelResults(blurbID: iText1, pos: 1)
                self.getIntelResults(blurbID: iText2, pos: 2)
                self.getIntelResults(blurbID: iText3, pos: 3)
                self.getIntelResults(blurbID: iText4, pos: 4)
                //talents
                self.getTalentResults(blurbID: tmText1, pos: 1)
                self.getTalentResults(blurbID: tmText2, pos: 2)
                self.getTalentResults(blurbID: tmText3, pos: 3)
                self.getTalentResults(blurbID: tmText4, pos: 4)
                //collections
                self.getCollectResults(blurbID: cmText1, pos: 1)
                self.getCollectResults(blurbID: cmText2, pos: 2)
                self.getCollectResults(blurbID: cmText3, pos: 3)
                self.getCollectResults(blurbID: cmText4, pos: 4)
                
                
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func getHeroResults(blurbID: String, pos: Int){
        let queryParams: [String: String] = [
            "id": blurbID,
            "type": "hero",
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "mixotype.com"
        urlComponents.path = "/app/webapis/ios/getalldefsios.php"
        urlComponents.setQueryItems(with: queryParams)
        let urlString = urlComponents.url?.absoluteString
            
        guard let url = URL(string: urlString!) else {return}
        
        switch pos {
            case 1:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.htresults1.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 2:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.htresults2.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 3:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.htresults3.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 4:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.htresults4.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            default:
                break
        }
        
        
    }
    
    func getIntelResults(blurbID: String, pos: Int){
        let queryParams: [String: String] = [
            "id": blurbID,
            "type": "intel",
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "mixotype.com"
        urlComponents.path = "/app/webapis/ios/getalldefsios.php"
        urlComponents.setQueryItems(with: queryParams)
        let urlString = urlComponents.url?.absoluteString
            
        guard let url = URL(string: urlString!) else {return}
        
        switch pos {
            case 1:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.intelresults1.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 2:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.intelresults2.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 3:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.intelresults3.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 4:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.intelresults4.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            default:
                break
        }
        
        
    }
    
    func getTalentResults(blurbID: String, pos: Int){
        let queryParams: [String: String] = [
            "id": blurbID,
            "type": "tal",
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "mixotype.com"
        urlComponents.path = "/app/webapis/ios/getalldefsios.php"
        urlComponents.setQueryItems(with: queryParams)
        let urlString = urlComponents.url?.absoluteString
            
        guard let url = URL(string: urlString!) else {return}
        
        switch pos {
            case 1:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.tmresults1.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 2:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.tmresults2.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 3:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.tmresults3.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 4:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.tmresults4.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            default:
                break
        }
        
        
    }
    
    func getCollectResults(blurbID: String, pos: Int){
        let queryParams: [String: String] = [
            "id": blurbID,
            "type": "col",
        ]
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = "mixotype.com"
        urlComponents.path = "/app/webapis/ios/getalldefsios.php"
        urlComponents.setQueryItems(with: queryParams)
        let urlString = urlComponents.url?.absoluteString
            
        guard let url = URL(string: urlString!) else {return}
        
        switch pos {
            case 1:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.cmresults1.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 2:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.cmresults2.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 3:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.cmresults3.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            case 4:
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                        
                    guard let data = data else { return }
                        
                    do {
                            
                        let decoder = JSONDecoder()
                        let mixo = try decoder.decode([Result].self, from: data)
                        
                        DispatchQueue.main.async {
                            
                            self.cmresults4.text = mixo[0].text
                        }
                            
                    } catch {
                        print("JSONSerialization error:", error)
                    }
                }.resume()
                break
            default:
                break
        }
        
        
    }
    
    @IBAction func btnDismiss(_ sender: Any) {
        let mixoScene5VC = mainSB.instantiateViewController(withIdentifier: "MixoScene5VC") as! MixoScene5VC
        self.present(mixoScene5VC, animated:true, completion:nil)
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
