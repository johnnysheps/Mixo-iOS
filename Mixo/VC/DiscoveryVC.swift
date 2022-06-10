//
//  DiscoveryVC.swift
//  Mixo
//
//  Created by Weng on 6/4/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import FirebaseAuth


var postHeight:CGFloat = 140;
var dividerHeight:CGFloat = 5;
var rowHeight:CGFloat = 145; // Combined postHeight + dividerHeight + ...; Doing it here for maintainability


func getUserData(_ userUID:String) {
    var docRef = db.collection("users").document(userUID)
    
    
    var response = [
        "user_name":"",
        "user_pic":"",
        "user_city":"",
        "user_state":"",
        "user_location":"",
        "user_dob":""
        "age_year":""
    ]
    
    
    
    //get the users choices
    docRef.getDocument { (document, error) in
        if let document = document, document.exists {
            
            //user profile data
            
            let user_name = document.get("name") as! String
            let user_pic = document.get("profile_pic") as! String
            let user_city = document.get("city") as! String
            let user_state = document.get("state") as! String
            let user_location = user_city + ", " + user_state
            let user_dob = document.get("dob") as! String
            
            response["user_name"] = user_name;
            response["user_pic"] = user_pic;
            response["user_city"] = user_city;
            response["user_state"] = user_state;
            response["user_location"] = user_location;
            response["user_dob"] = user_dob;
            
           
                //calcualte age of user
                let today = Date()
                
                //convert user_dob to Date,
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: user_dob)!
                let calendar = Calendar.current
                let components = calendar.dateComponents([.year, .month, .day], from: date, to:today)
            
                let ageYear = components.year;
                response["user_dob"] = user_dob;
                response["age_year"] = ageYear;
                
                // get user pic
                let storage = Storage.storage()
                var reference: StorageReference!
                let imgRef = "gs://mixotype-4a74b.appspot.com/" + user_pic
                print("// User pic URL")
                print(imgRef)
            
//                reference = storage.reference(forURL: imgRef)
//                reference.downloadURL { (url, err) in
//                    if(url != nil) {
//                        let data = NSData(contentsOf: url!)
//                        let image = UIImage(data: data! as Data)
//                        self.profilePic.image = image
//                    }
//                }
                
                
                //check the users dones
                guard let roleDone = document.get("role_done") as? String else {return}
                guard let intelDone = document.get("intel_done") as? String else {return}
                guard let talentDone = document.get("talent_done") as? String else {return}
                guard let collectDone = document.get("collect_done") as? String else {return}
                

                //heroes
                if roleDone == "Y"{
                    //get the users hero data
                    guard let role_nest = document.get("role_nest")  as? String else {return}
                    guard let role_basket_nest = document.get("role_basket_nest") as? String else {return}
                    
                    let role_nest_1 = role_nest[0]
                    let role_basket_nest_1 = role_basket_nest[0]
                    let role_basket_nest_2 = role_basket_nest[1]
                    let role_basket_nest_3 = role_basket_nest[2]
                    let role_basket_nest_4 = role_basket_nest[3]

                    print(role_nest_1)
                    //set mixo1 to the first hero choice
                    self.imgHero.image = UIImage(named: self.heroImages[Int(role_nest_1)! - 1])

                    //set the corners
                    //tlc
                    switch role_basket_nest_1{
                        case "1":
                            self.imgHTLC.image = UIImage(named: "ktlc")
                            break
                        case "2":
                            self.imgHTLC.image = UIImage(named: "wtlc")
                            break
                        case "3":
                            self.imgHTLC.image = UIImage(named: "mtlc")
                            break
                        case "4":
                            self.imgHTLC.image = UIImage(named: "ltlc")
                            break
                        default:
                            break
                    }

                    //trc
                    switch role_basket_nest_2{
                        case "1":
                            self.imgHTRC.image = UIImage(named: "ktrc")
                            break
                        case "2":
                            self.imgHTRC.image = UIImage(named: "wtrc")
                            break
                        case "3":
                            self.imgHTRC.image = UIImage(named: "mtrc")
                            break
                        case "4":
                            self.imgHTRC.image = UIImage(named: "ltrc")
                            break
                        default:
                            break
                    }

                    //blc
                    switch role_basket_nest_3{
                        case "1":
                            self.imgHBLC.image = UIImage(named: "kblc")
                            break
                        case "2":
                            self.imgHBLC.image = UIImage(named: "wblc")
                            break
                        case "3":
                            self.imgHBLC.image = UIImage(named: "mblc")
                            break
                        case "4":
                            self.imgHBLC.image = UIImage(named: "lblc")
                            break
                        default:
                            break
                    }

                    //brc
                    switch role_basket_nest_4{
                        case "1":
                            self.imgHBRC.image = UIImage(named: "kbrc")
                            break
                        case "2":
                            self.imgHBRC.image = UIImage(named: "wbrc")
                            break
                        case "3":
                            self.imgHBRC.image = UIImage(named: "mbrc")
                            break
                        case "4":
                            self.imgHBRC.image = UIImage(named: "lbrc")
                            break
                        default:
                            break
                    }
                }

                //intels
                if intelDone == "Y"{
                    //get the users intel data
                    guard let intel_nest = document.get("intel_nest")  as? String else {return}
                    let intel_nest_1 = intel_nest[0]
                    let intel_nest_2 = intel_nest[1]
                    let intel_nest_3 = intel_nest[2]
                    let intel_nest_4 = intel_nest[3]

                    //set Intel to the first intel choice
                    self.imgIntel.image = UIImage(named: self.intelImages[Int(intel_nest_1)! - 1])

                    //set the corners
                    //tlc
                    switch intel_nest_1{
                        case "1":
                            self.imgITLC.image = UIImage(named: "verbaltlc")
                            break
                        case "2":
                            self.imgITLC.image = UIImage(named: "naturalistictlc")
                            break
                        case "3":
                            self.imgITLC.image = UIImage(named: "interpersonaltlc")
                            break
                        case "4":
                            self.imgITLC.image = UIImage(named: "ilogicaltlc")
                            break
                        case "5":
                            self.imgITLC.image = UIImage(named: "bodilytlc")
                            break
                        case "6":
                            self.imgITLC.image = UIImage(named: "intrapersonaltlc")
                            break
                        case "7":
                            self.imgITLC.image = UIImage(named: "musicaltlc")
                            break
                        case "8":
                            self.imgITLC.image = UIImage(named: "visualtlc")
                            break
                        case "9":
                            self.imgITLC.image = UIImage(named: "existentialtlc")
                            break
                        default:
                            break
                    }

                    //trc
                    switch intel_nest_2{
                        case "1":
                            self.imgITRC.image = UIImage(named: "verbaltrc")
                            break
                        case "2":
                            self.imgITRC.image = UIImage(named: "naturalistictrc")
                            break
                        case "3":
                            self.imgITRC.image = UIImage(named: "interpersonaltrc")
                            break
                        case "4":
                            self.imgITRC.image = UIImage(named: "ilogicaltrc")
                            break
                        case "5":
                            self.imgITRC.image = UIImage(named: "bodilytrc")
                            break
                        case "6":
                            self.imgITRC.image = UIImage(named: "intrapersonaltrc")
                            break
                        case "7":
                            self.imgITRC.image = UIImage(named: "musicaltrc")
                            break
                        case "8":
                            self.imgITRC.image = UIImage(named: "visualtrc")
                            break
                        case "9":
                            self.imgITRC.image = UIImage(named: "existentialtrc")
                            break
                        default:
                            break
                    }

                    //blc
                    switch intel_nest_3{
                        case "1":
                            self.imgIBLC.image = UIImage(named: "verbalblc")
                            break
                        case "2":
                            self.imgIBLC.image = UIImage(named: "naturalisticblc")
                            break
                        case "3":
                            self.imgIBLC.image = UIImage(named: "interpersonalblc")
                            break
                        case "4":
                            self.imgIBLC.image = UIImage(named: "ilogicalblc")
                            break
                        case "5":
                            self.imgIBLC.image = UIImage(named: "bodilyblc")
                            break
                        case "6":
                            self.imgIBLC.image = UIImage(named: "intrapersonalblc")
                            break
                        case "7":
                            self.imgIBLC.image = UIImage(named: "musicalblc")
                            break
                        case "8":
                            self.imgIBLC.image = UIImage(named: "visualblc")
                            break
                        case "9":
                            self.imgIBLC.image = UIImage(named: "existentialblc")
                            break
                        default:
                            break
                    }

                    //brc
                    switch intel_nest_4{
                        case "1":
                            self.imgIBRC.image = UIImage(named: "verbalbrc")
                            break
                        case "2":
                            self.imgIBRC.image = UIImage(named: "naturalisticbrc")
                            break
                        case "3":
                            self.imgIBRC.image = UIImage(named: "interpersonalbrc")
                            break
                        case "4":
                            self.imgIBRC.image = UIImage(named: "ilogicalbrc")
                            break
                        case "5":
                            self.imgIBRC.image = UIImage(named: "bodilybrc")
                            break
                        case "6":
                            self.imgIBRC.image = UIImage(named: "intrapersonalbrc")
                            break
                        case "7":
                            self.imgIBRC.image = UIImage(named: "musicalbrc")
                            break
                        case "8":
                            self.imgIBRC.image = UIImage(named: "visualbrc")
                            break
                        case "9":
                            self.imgIBRC.image = UIImage(named: "existentialbrc")
                            break
                        default:
                            break
                    }
                }
                
                //talents
                if talentDone == "Y"{
                    //get the users talent choices
                    guard let talent_nest = document.get("talent_nest")  as? String else {return}
                    guard let talent_basket_nest = document.get("talent_basket_nest") as? String else {return}
                    let talent_nestArr = talent_nest.components(separatedBy: "_")
                    let talent_nest_1 = talent_nestArr[0]
                    let talent_basket_nest_1 = talent_basket_nest[0]
                    let talent_basket_nest_2 = talent_basket_nest[1]
                    let talent_basket_nest_3 = talent_basket_nest[2]
                    let talent_basket_nest_4 = talent_basket_nest[3]

                    //set Talent to the first talent choice
                    self.imgTalent.image = UIImage(named: self.talentImages[Int(talent_nest_1)! - 1])

                    //set the corners
                        //tlc
                        switch talent_basket_nest_1{
                            case "1":
                                self.imgTTLC.image = UIImage(named: "physicaltlc")
                                break
                            case "2":
                                self.imgTTLC.image = UIImage(named: "spiritualtlc")
                                break
                            case "3":
                                self.imgTTLC.image = UIImage(named: "logicaltlc")
                                break
                            case "4":
                                self.imgTTLC.image = UIImage(named: "creativetlc")
                                break
                            default:
                                break
                        }

                        //trc
                        switch talent_basket_nest_2{
                            case "1":
                                self.imgTTRC.image = UIImage(named: "physicaltrc")
                                break
                            case "2":
                                self.imgTTRC.image = UIImage(named: "spiritualtrc")
                                break
                            case "3":
                                self.imgTTRC.image = UIImage(named: "logicaltrc")
                                break
                            case "4":
                                self.imgTTRC.image = UIImage(named: "creativetrc")
                                break
                            default:
                                break
                        }

                        //blc
                        switch talent_basket_nest_3{
                            case "1":
                                self.imgTBLC.image = UIImage(named: "physicalblc")
                                break
                            case "2":
                                self.imgTBLC.image = UIImage(named: "spiritualblc")
                                break
                            case "3":
                                self.imgTBLC.image = UIImage(named: "logicalblc")
                                break
                            case "4":
                                self.imgTBLC.image = UIImage(named: "creativeblc")
                                break
                            default:
                                break
                        }

                        //brc
                        switch talent_basket_nest_4{
                            case "1":
                                self.imgTBRC.image = UIImage(named: "physicalbrc")
                                break
                            case "2":
                                self.imgTBRC.image = UIImage(named: "spiritualbrc")
                                break
                            case "3":
                                self.imgTBRC.image = UIImage(named: "logicalbrc")
                                break
                            case "4":
                                self.imgTBRC.image = UIImage(named: "creativebrc")
                                break
                            default:
                                break
                        }
                    }
                
                //collections
                if collectDone == "Y"{
                    //get the users collection choices
                    guard let collect_nest = document.get("collect_nest") as? String else {return}
                    guard let collect_basket_nest = document.get("collect_basket_nest") as? String else {return}
                    let collect_nest_1 = collect_nest[0]
                    let collect_basket_nest_1 = collect_basket_nest[0]
                    let collect_basket_nest_2 = collect_basket_nest[1]
                    let collect_basket_nest_3 = collect_basket_nest[2]
                    let collect_basket_nest_4 = collect_basket_nest[3]

                    //set Collect to the first collection choice
                    self.imgCollect.image = UIImage(named: self.collectImages[Int(collect_nest_1)! - 1])

                    //set the corners
                        //tlc
                        switch collect_basket_nest_1{
                            case "1":
                                self.imgCTLC.image = UIImage(named: "physicaltlc")
                                break
                            case "2":
                                self.imgCTLC.image = UIImage(named: "spiritualtlc")
                                break
                            case "3":
                                self.imgCTLC.image = UIImage(named: "logicaltlc")
                                break
                            case "4":
                                self.imgCTLC.image = UIImage(named: "creativetlc")
                                break
                            default:
                                break
                        }

                        //trc
                        switch collect_basket_nest_2{
                            case "1":
                                self.imgCTRC.image = UIImage(named: "physicaltrc")
                                break
                            case "2":
                                self.imgCTRC.image = UIImage(named: "spiritualtrc")
                                break
                            case "3":
                                self.imgCTRC.image = UIImage(named: "logicaltrc")
                                break
                            case "4":
                                self.imgCTRC.image = UIImage(named: "creativetrc")
                                break
                            default:
                                break
                        }

                        //brc
                        switch collect_basket_nest_3{
                            case "1":
                                self.imgCBLC.image = UIImage(named: "physicalblc")
                                break
                            case "2":
                                self.imgCBLC.image = UIImage(named: "spiritualblc")
                                break
                            case "3":
                                self.imgCBLC.image = UIImage(named: "logicalblc")
                                break
                            case "4":
                                self.imgCBLC.image = UIImage(named: "creativeblc")
                                break
                            default:
                                break
                        }

                        //blc
                        switch collect_basket_nest_4{
                            case "1":
                                self.imgCBRC.image = UIImage(named: "physicalbrc")
                                break
                            case "2":
                                self.imgCBRC.image = UIImage(named: "spiritualbrc")
                                break
                            case "3":
                                self.imgCBRC.image = UIImage(named: "logicalbrc")
                                break
                            case "4":
                                self.imgCBRC.image = UIImage(named: "creativebrc")
                                break
                            default:
                                break
                        }
                }
            
            
        } else {
            print("Document does not exist")
        }
    }
    
} // getUserData


struct Row: View {
    let age: Int;
    var screenWidth: CGFloat;
    var avatarQuadrant:CGFloat = 45;
    
    var body: some View {
        VStack(alignment:.leading, spacing:0) {

            HStack(alignment:.top, spacing:0) {
                
                VStack(alignment:.leading, spacing:0) {
                    GeometryReader { geo in
                        Rectangle()
                            .fill(Color.yellow)
                            .overlay(
                                Image("maleicon")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: 0, y: 0)
                                    .overlay(
                                        GeometryReader { geo in
                                            Text("FN LN")
                                                .frame(width: self.screenWidth/2, height: 20)
                                                .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).maxY+10)
                                        } // Geo
                                    ) // Overlay
                            ).frame(width: avatarQuadrant*2, height: avatarQuadrant*2, alignment: .center)
                            .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    } // Geometry Reader
                    
                    
                }.frame(width: self.screenWidth/2, height: postHeight)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    GeometryReader { geo in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: self.screenWidth/2, height: postHeight)
                            .overlay(
                                Rectangle()
                                    .fill(Color.red)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX - avatarQuadrant/2, y: geo.frame(in: .local).midY - avatarQuadrant/2)
                                        .overlay(
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.green)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 - (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 - (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.black)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 - 0)
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 - 0)
                                            }
                                        )
                            ).overlay(
                                Rectangle()
                                    .fill(Color.orange)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX - avatarQuadrant/2, y: geo.frame(in: .local).midY + avatarQuadrant/2)
                                        .overlay(
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.green)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 + (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 + (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.black)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - (avatarQuadrant/2), y: -avatarQuadrant/4 + (2*avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: -avatarQuadrant/4 - 0, y: -avatarQuadrant/4 + (2*avatarQuadrant/2))
                                            }
                                        )
                            ).overlay(
                                Rectangle()
                                    .fill(Color.purple)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX + avatarQuadrant/2, y: geo.frame(in: .local).midY - avatarQuadrant/2)
                                        .overlay(
                                            ZStack {
                                                Rectangle()
                                                    .fill(Color.green)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + 0, y: avatarQuadrant/4 - (2*avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.yellow)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 - (2*avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(Color.black)
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + 0, y: avatarQuadrant/4 - (avatarQuadrant/2))
                                                Rectangle()
                                                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                    .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                    .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 - (avatarQuadrant/2))
                                            }
                                        )
                            ).overlay(
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(width: avatarQuadrant, height: avatarQuadrant)
                                    .position(x: geo.frame(in: .local).midX + avatarQuadrant/2, y: geo.frame(in: .local).midY + avatarQuadrant/2)
                                    .overlay(
                                        ZStack {
                                            Rectangle()
                                                .fill(Color.green)
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4 + 0, y: avatarQuadrant/4 + 0)
                                            Rectangle()
                                                .fill(Color.yellow)
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 + 0)
                                            Rectangle()
                                                .fill(Color.black)
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4, y: avatarQuadrant/4 + (avatarQuadrant/2))
                                            Rectangle()
                                                .fill(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                                                .frame(width: avatarQuadrant/2, height: avatarQuadrant/2)
                                                .offset(x: avatarQuadrant/4 + (avatarQuadrant/2), y: avatarQuadrant/4 + (avatarQuadrant/2))
                                        }
                                    )
                            )
                    }
                }.frame(width: self.screenWidth/2, height: postHeight)
                
                
            }.frame(width: self.screenWidth, height: postHeight) // top horizontal - main content
            
            Image("loadingbg")
                    .resizable()
                    .frame(width: self.screenWidth, height: dividerHeight)
        
        }.frame(width: self.screenWidth).padding(0)
    
    } // View
                    
    init(age: Int) {
        print("Person age: \(age)")
        self.age = age;
        self.screenWidth = UIScreen.main.bounds.width;
    }
}

class Person {
    var age: Int;
    init(age:Int) {
        self.age = age;
    }
}

struct DiscoveryVC: View {
    var rows:Array<GridItem> = Array();
    var persons:Array<Person> = Array()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyHGrid(rows: rows, alignment: .center, spacing:0, pinnedViews: []) {
                    ForEach((0...persons.count-1), id:\.self) {
                        Row.init(age: persons[$0].age)
                    }
                }.frame(width: UIScreen.main.bounds.width).padding(0)
            }.frame(width: UIScreen.main.bounds.width).padding(0)
        } // GeometryReader
    } // body
    
    init() {
        print("/*");
        print(userUID);
        print(getUserData(userUID));
        print("*/");
        self.persons.append(Person.init(age: 20))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        self.persons.append(Person.init(age: 22))
        /** The .fixed is the row height! */
        self.rows = Array(repeating: GridItem(.fixed(rowHeight), spacing:0), count:persons.count);
    }
}

struct DiscoveryVC_Previews: PreviewProvider {
    static var previews: some View {
        DiscoveryVC()
    }
}
