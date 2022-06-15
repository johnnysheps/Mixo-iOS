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
import SDWebImageSwiftUI

var postHeight:CGFloat = 140;
var dividerHeight:CGFloat = 5;
var rowHeight:CGFloat = 145; // Combined postHeight + dividerHeight + ...; Doing it here for maintainability

var heroImages: [String] = [] //array that holds the heroes
var intelImages: [String] = [] //array that holds the intels
var talentImages: [String] = []//array that holds the talents
var collectImages: [String] = []//array that holds the collections

//func getUserData(_ userUID:String) async throws -> String  {
func getUserData(_ userUID:String) {
    let docRef = db.collection("users").document(userUID)

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
            
//            response["user_name"] = user_name;
//            response["user_pic"] = user_pic;
//            response["user_city"] = user_city;
//            response["user_state"] = user_state;
//            response["user_location"] = user_location;
//            response["user_dob"] = user_dob;
            
       
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
            response["user_age_year"] = String(ageYear!);
            
            // get user pic
            let storage = Storage.storage()
            var reference: StorageReference!
            let imgRef = "gs://mixotype-4a74b.appspot.com/" + user_pic
            response["gsImgRef"] = imgRef;
        
            let imgRefWillPart = imgRef.replacingOccurrences(of: "gs://", with: "")
            let imgRefParted = imgRefWillPart.components(separatedBy: "/")

            let domain = imgRefParted[0];
            var subPathsArr:Array<String> = [];

            for i in 2...imgRefParted.count {
                subPathsArr.append(imgRefParted[i-1])
            }

            let trailingPath = subPathsArr.joined(separator: "%2F");
            let publicUrl = "https://firebasestorage.googleapis.com/v0/b/\(domain)/o/\(trailingPath)?alt=media";
            response["httpsImgRef"] = publicUrl;
            
            
            //check the users dones
            response["roleDone"] = document.get("role_done") as? String;
            response["intelDone"] = document.get("intel_done") as? String;
            response["talentDone"] = document.get("intel_done") as? String;
            response["collectDone"] = document.get("collect_done") as? String;
            

            //heroes
            if response["roleDone"] == "Y"{
                //get the users hero data
                guard let role_nest = document.get("role_nest")  as? String else {return};
                guard let role_basket_nest = document.get("role_basket_nest") as? String else {return};
                
                response["role_nest_1"] = role_nest[0]
                response["role_basket_nest_1"] = role_basket_nest[0]
                response["role_basket_nest_2"] = role_basket_nest[1]
                response["role_basket_nest_3"] = role_basket_nest[2]
                response["role_basket_nest_4"] = role_basket_nest[3]
    
            } // if

            //intels
            if response["intelDone"]  == "Y"{
                //get the users intel data
                guard let intel_nest = document.get("intel_nest")  as? String else {return}
                response["intel_nest_1"] = intel_nest[0]
                response["intel_nest_2"] = intel_nest[1]
                response["intel_nest_3"] = intel_nest[2]
                response["intel_nest_4"] = intel_nest[3]
            }
            
            //talents
            if response["talentDone"]  == "Y"{
                //get the users talent choices
                guard let talent_nest = document.get("talent_nest")  as? String else {return}
                guard let talent_basket_nest = document.get("talent_basket_nest") as? String else {return}
                let talent_nestArr = talent_nest.components(separatedBy: "_")
                response["talent_nest_1"] = talent_nestArr[0]
                response["talent_basket_nest_1"] = talent_basket_nest[0]
                response["talent_basket_nest_2"] = talent_basket_nest[1]
                response["talent_basket_nest_3"] = talent_basket_nest[2]
                response["talent_basket_nest_4"] = talent_basket_nest[3]

            }
            
            //collections
            if response["collectDone"]  == "Y"{
                //get the users collection choices
                guard let collect_nest = document.get("collect_nest") as? String else {return}
                guard let collect_basket_nest = document.get("collect_basket_nest") as? String else {return}
                response["collect_nest_1"] = collect_nest[0]
                response["collect_basket_nest_1"] = collect_basket_nest[0]
                response["collect_basket_nest_2"] = collect_basket_nest[1]
                response["collect_basket_nest_3"] = collect_basket_nest[2]
                response["collect_basket_nest_4"] = collect_basket_nest[3]
            }
        } else {
            print("Document does not exist")
        }
    }
    
} // getUserData

func setupAvatars() {
    
    //heroes
    heroImages.append("actornb")
    heroImages.append("leadernb")
    heroImages.append("philosophernb")
    heroImages.append("athletenb")
    heroImages.append("musiciannb")
    heroImages.append("scientistnb")
    heroImages.append("designernb")
    heroImages.append("naturalistnb")
    heroImages.append("selfreflectornb")
    
    //intels
    intelImages.append("verbalnb")
    intelImages.append("naturalisticnb")
    intelImages.append("interpersonalnb")
    intelImages.append("logicalnb")
    intelImages.append("bodilynb")
    intelImages.append("intrapersonalnb")
    intelImages.append("musicalnb")
    intelImages.append("visualnb")
    intelImages.append("existentialnb")
    
    //talents
    talentImages.append("v1img1nb") //Verbal - 1 - [0]
    talentImages.append("v1img2nb") //Verbal - 2 - [1]
    talentImages.append("v1img3nb") //Verbal - 3 - [2]
    talentImages.append("v1img4nb") //Verbal - 4 - [3]
    talentImages.append("nimg1nb") //Naturalistic - 5 - [4]
    talentImages.append("nimg2nb") //Naturalistic - 6 - [5]
    talentImages.append("nimg3nb") //Naturalistic - 7 - [6]
    talentImages.append("nimg4nb") //Naturalistic - 8 - [7]
    talentImages.append("i1img1nb") //Interpersonal - 9 - [8]
    talentImages.append("i1img2nb") //Interpersonal - 10 - [9]
    talentImages.append("i1img3nb") //Interpersonal - 11 - [10]
    talentImages.append("i1img4nb") //Interpersonal - 12 - [11]
    talentImages.append("limg1nb") //Logical - 13 - [12]
    talentImages.append("limg2nb") //Logical - 14 - [13]
    talentImages.append("limg3nb") //Logical - 15 - [14]
    talentImages.append("limg4nb") //Logical - 16 - [15]
    talentImages.append("bimg1nb") //Bodily - 17 - [16]
    talentImages.append("bimg2nb") //Bodily - 18 - [17]
    talentImages.append("bimg3nb") //Bodily - 19 - [18]
    talentImages.append("bimg4nb") //Bodily - 20 - [19]
    talentImages.append("i2img1nb") //Intrapersonal - 21 - [20]
    talentImages.append("i2img2nb") //Intrapersonal - 22 - [21]
    talentImages.append("i2img3nb") //Intrapersonal - 23 - [22]
    talentImages.append("i2img4nb") //Intrapersonal - 24 - [23]
    talentImages.append("mimg1nb") //Musical - 25 - [24]
    talentImages.append("mimg2nb") //Musical - 26 - [25]
    talentImages.append("mimg3nb") //Musical - 27 - [26]
    talentImages.append("mimg4nb") //Musical - 28 - [27]
    talentImages.append("v2img1nb") //Visual - 29 - [28]
    talentImages.append("v2img2nb") //Visual - 30 - [29]
    talentImages.append("v2img3nb") //Visual - 31 - [30]
    talentImages.append("v2img4nb") //Visual - 32 - [31]
    talentImages.append("eimg1nb") //Existential - 33 - [32]
    talentImages.append("eimg2nb") //Existential - 34 - [33]
    talentImages.append("eimg3nb") //Existential - 35 - [34]
    talentImages.append("eimg4nb") //Existential - 36 - [35]
    
    //collecitons
    collectImages.append("socialactivitiesnb")
    collectImages.append("musicnb")
    collectImages.append("heirloomsnb")
    collectImages.append("fitnessnb")
    collectImages.append("aestheticsnb")
    collectImages.append("naturenb")
    collectImages.append("technologynb")
    collectImages.append("theatricalnb")
    collectImages.append("selfimprovementnb")
}



struct ProfilePic: View {
    var responseIndex:Int;
    var screenWidth:CGFloat;
    var avatarQuadrantWidth:CGFloat;
    var midX:CGFloat;
    var midY:CGFloat;
    
    var body: some View {
        // WebImage(url: URL(string: "https://engine.mixotype.com/mobile/ios/graphics/profile-pic-placeholder.png"))
        WebImage(url: URL(string: MVMConverters.to(responses![responseIndex], MVMc.profile_pic)))
        // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
        .onSuccess { image, data, cacheType in
            // Success
            // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
        }
        .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
        .placeholder(Image(systemName: "profile-pic-placeholder")) // Placeholder Image
        // Supports ViewBuilder as well
        .placeholder {
            Rectangle().foregroundColor(Color.gray)
        }
        .indicator(.activity) // Activity Indicator
        .transition(.fade(duration: 0.5)) // Fade Transition with duration
        .scaledToFill()
        .frame(width: self.avatarQuadrantWidth*2, height: self.avatarQuadrantWidth*2, alignment: .center)
        .cornerRadius(avatarQuadrantWidth)
        .position(x: self.midX, y: self.midY)
        .overlay(
            GeometryReader { geo in
                Text( MVMConverters.to(responses![responseIndex], MVMc.name) )
                    .frame(width: self.screenWidth/2, height: avatarQuadrantWidth)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY+avatarQuadrantWidth+13)
            } // Geo
        ) // Overlay
        
    }
    init(responseIndex:Int, screenWidth:CGFloat, avatarQuadrantWidth:CGFloat, midX:CGFloat, midY:CGFloat) {
        self.responseIndex = responseIndex;
        self.screenWidth = screenWidth;
        self.avatarQuadrantWidth = avatarQuadrantWidth;
        self.midX = midX;
        self.midY = midY;
    }
}

struct Row: View {
    let responseIndex: Int;
    var screenWidth: CGFloat;
    var avatarQuadrantWidth:CGFloat = 45;
    
    var body: some View {
        VStack(alignment:.leading, spacing:0) {

            HStack(alignment:.top, spacing:0) {
                
                VStack(alignment:.leading, spacing:0) {
                    GeometryReader { geo in
                        
                        ProfilePic.init(responseIndex: responseIndex, screenWidth: self.screenWidth, avatarQuadrantWidth: self.avatarQuadrantWidth, midX: geo.frame(in: .local).midX, midY: geo.frame(in: .local).midY)
                            .cornerRadius(50)
                    } // Geometry Reader
                    
                    
                }.frame(width: self.screenWidth/2, height: postHeight)
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    GeometryReader { geo in
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: self.screenWidth/2, height: postHeight)
                            .overlay(
                                // Top left quadrant: Hero/Role
                                Image(MVMConverters.to(responses![responseIndex], MVMc.role_nest))
                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                    .scaledToFill()
                                    .frame(width: avatarQuadrantWidth, height: avatarQuadrantWidth)
                                    .position(x: geo.frame(in: .local).midX - avatarQuadrantWidth/2, y: geo.frame(in: .local).midY - avatarQuadrantWidth/2)
                                        .overlay(
                                            ZStack {
                                                // TLC
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.role_basket_nest_1))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - (avatarQuadrantWidth/2), y: -avatarQuadrantWidth/4 - (avatarQuadrantWidth/2))
                                                // TRC
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.role_basket_nest_2))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - 0, y: -avatarQuadrantWidth/4 - (avatarQuadrantWidth/2))
                                                // BLC
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.role_basket_nest_3))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - (avatarQuadrantWidth/2), y: -avatarQuadrantWidth/4 - 0)
                                                // BRC
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.role_basket_nest_4))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - 0, y: -avatarQuadrantWidth/4 - 0)
                                            } // Zstack
                                        ) // overlay
                            ).overlay(
                                // Bottom left quadrant: Talent
                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                    .scaledToFill()
                                    .frame(width: avatarQuadrantWidth, height: avatarQuadrantWidth)
                                    .position(x: geo.frame(in: .local).midX - avatarQuadrantWidth/2, y: geo.frame(in: .local).midY + avatarQuadrantWidth/2)
                                        .overlay(
                                            ZStack {
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - (avatarQuadrantWidth/2), y: -avatarQuadrantWidth/4 + (avatarQuadrantWidth/2))
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - 0, y: -avatarQuadrantWidth/4 + (avatarQuadrantWidth/2))
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - (avatarQuadrantWidth/2), y: -avatarQuadrantWidth/4 + (2*avatarQuadrantWidth/2))
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: -avatarQuadrantWidth/4 - 0, y: -avatarQuadrantWidth/4 + (2*avatarQuadrantWidth/2))
                                            } // Z Stack
                                        ) // Overlay
                            ).overlay(
                                // Top right quadrant: Intel
                                Image(MVMConverters.to(responses![responseIndex], MVMc.intel_nest))
                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                    .scaledToFill()
                                    .frame(width: avatarQuadrantWidth, height: avatarQuadrantWidth)
                                    .position(x: geo.frame(in: .local).midX + avatarQuadrantWidth/2, y: geo.frame(in: .local).midY - avatarQuadrantWidth/2)
                                        .overlay(
                                            ZStack {
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: avatarQuadrantWidth/4 + 0, y: avatarQuadrantWidth/4 - (2*avatarQuadrantWidth/2))
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: avatarQuadrantWidth/4 + (avatarQuadrantWidth/2), y: avatarQuadrantWidth/4 - (2*avatarQuadrantWidth/2))
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: avatarQuadrantWidth/4 + 0, y: avatarQuadrantWidth/4 - (avatarQuadrantWidth/2))
                                                Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                    .scaledToFill()
                                                    .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                    .offset(x: avatarQuadrantWidth/4 + (avatarQuadrantWidth/2), y: avatarQuadrantWidth/4 - (avatarQuadrantWidth/2))
                                            }
                                        )
                            ).overlay(
                                // Bottom right quadrant: Collection
                                Image(MVMConverters.to(responses![responseIndex], MVMc.collect_nest))
                                    .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                    .scaledToFill()
                                    .frame(width: avatarQuadrantWidth, height: avatarQuadrantWidth)
                                    .position(x: geo.frame(in: .local).midX + avatarQuadrantWidth/2, y: geo.frame(in: .local).midY + avatarQuadrantWidth/2)
                                    .overlay(
                                        ZStack {
                                            Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                .scaledToFill()
                                                .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                .offset(x: avatarQuadrantWidth/4 + 0, y: avatarQuadrantWidth/4 + 0)
                                            Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                .scaledToFill()
                                                .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                .offset(x: avatarQuadrantWidth/4 + (avatarQuadrantWidth/2), y: avatarQuadrantWidth/4 + 0)
                                            Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                .scaledToFill()
                                                .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                .offset(x: avatarQuadrantWidth/4, y: avatarQuadrantWidth/4 + (avatarQuadrantWidth/2))
                                            Image(MVMConverters.to(responses![responseIndex], MVMc.talent_nest))
                                                .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                                .scaledToFill()
                                                .frame(width: avatarQuadrantWidth/2, height: avatarQuadrantWidth/2)
                                                .offset(x: avatarQuadrantWidth/4 + (avatarQuadrantWidth/2), y: avatarQuadrantWidth/4 + (avatarQuadrantWidth/2))
                                        }
                                    )
                            ) // overlay
                    } // Geometry reader
                }.frame(width: self.screenWidth/2, height: postHeight) // VStack
                
                
            }.frame(width: self.screenWidth, height: postHeight) // top horizontal - main content
            
            Image("loadingbg")
                    .resizable()
                    .frame(width: self.screenWidth, height: dividerHeight)
        
        }.frame(width: self.screenWidth).padding(0)
    
    } // View
                    
    init(_ index:Int) {
        print("responseIndex: \(index)")
        self.responseIndex = index;
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
                    ForEach((0...responses!.count-1), id:\.self) {
                            // let _ = print("Iterator \($0)");
//                        let _ = print(MVMConverters.to(responses![$0], "name"));
                        Row.init($0)
                    }
                }.frame(width: UIScreen.main.bounds.width).padding(0)
            }.frame(width: UIScreen.main.bounds.width).padding(0)
        } // GeometryReader
    } // body
    
    init() {
        setupAvatars();
        
        /** The .fixed is the row height! */
        self.rows = Array(repeating: GridItem(.fixed(rowHeight), spacing:0), count:responses!.count);
        
        // getUserData(userUID);
    } // init

    
} // DisoveryVC
