//
//  AnyUser.swift
//  Mixo
//
//  Created by Weng on 6/13/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import Foundation

class MVMc {
    static var name = "name";
    static var profile_pic = "profile_pic";
    static var userId = "userId";
    static var userName = "userName";
    static var userCity = "userCity";
    static var userState = "userState";
    static var userLocation = "userLocation";
    static var userDob = "userDob";
    static var userAgeYear = "userAgeYear";

//    static var gsImgRef = "gsImgRef";
//    static var httpsImgRef = "httpsImgRef";

    static var roleDone = "roleDone";
    static var intelDone = "intelDone";
    static var talentDone = "talentDone";
    static var collectDone = "collectDone";

    static var role_nest = "role_nest";
    static var role_basket_nest_1 = "role_basket_nest_1";
    static var role_basket_nest_2 = "role_basket_nest_2";
    static var role_basket_nest_3 = "role_basket_nest_3";
    static var role_basket_nest_4 = "role_basket_nest_4";

    static var intel_nest = "intel_nest";
    static var intelNest1 = "intelNest1";
    static var intelNest2 = "intelNest2";
    static var intelNest3 = "intelNest3";
    static var intelNest4 = "intelNest4";

    static var talent_nest = "talent_nest";
    static var talentBasketNest1 = "talentBasketNest1";
    static var talentBasketNest2 = "talentBasketNest2";
    static var talentBasketNest3 = "talentBasketNest3";
    static var talentBasketNest4 = "talentBasketNest4";

    static var collect_nest = "collect_nest";
    static var collectBasketNest1 = "collectBasketNest1";
    static var collectBasketNest2 = "collectBasketNest2";
    static var collectBasketNest3 = "collectBasketNest3";
    static var collectBasketNest4 = "collectBasketNest4"
}

class MVMConverters {
    static func to(_ response:[String:Any], _ type:String) -> String {
        switch type {

        case "name":
            return String(describing: response["name"]!);
            
        case "profile_pic":
            
            if String(describing: response["profile_pic"]!)=="incomplete" {
                return "https://engine.mixotype.com/mobile/ios/graphics/profile-pic-placeholder.png";
            }
            
            let imgRef = "gs://mixotype-4a74b.appspot.com/" + String(describing: response["profile_pic"]!);

            let imgRefWillPart = imgRef.replacingOccurrences(of: "gs://", with: "")
            let imgRefParted = imgRefWillPart.components(separatedBy: "/")
            
//            print("/****/ imgRefParted")
//            print(imgRefParted)
            
            let domain = imgRefParted[0];
            var subPathsArr:Array<String> = [];
//            print("/****/ domain")
//            print(domain)
            
            for i in 2...imgRefParted.count {
                subPathsArr.append(imgRefParted[i-1])
            }
            
//            print("/****/ subPathsArr")
//            print(subPathsArr)

            let trailingPath = subPathsArr.joined(separator: "%2F");
            let publicUrl = "https://firebasestorage.googleapis.com/v0/b/\(domain)/o/\(trailingPath)?alt=media";
//            print("/****/ publicUrl")
//            print(publicUrl)
            return publicUrl;
            
        case "role_nest": // eg. 2453 that represents your most to least looked up heroes / role models
            var role_nest_1 = String(describing: response["role_nest"]!);
//            print("/*****/ role_nest_1")
//            print(role_nest_1)
            role_nest_1 = role_nest_1.substring(toIndex: 1);
//            print("/*****/ role_nest_1 char")
//            print(role_nest_1)
            // Numerical values from the database not 0th-starting
//            print("/****/ heroImages XCode image name")
//            print(heroImages[Int(role_nest_1)! - 1])
            
            return heroImages[Int(role_nest_1)! - 1]

        case "role_basket_nest_1": // eg. 2453 that represents your most to least looked up heroes / role models
            let role_basket_nest_1 = String(describing: response["role_basket_nest"]!);
//            print("/*****/ role_basket_nest")
//            print(role_basket_nest_1)
            let char = role_basket_nest_1[role_basket_nest_1.index(role_basket_nest_1.startIndex, offsetBy: 0)]
//            print("/*****/ role_basket_nest_1 char")
//            print(role_basket_nest_1)
            // Numerical values from the database not 0th-starting
//            print("/****/ heroImages XCode image name")
//            print(heroImages[Int(role_nest_1)! - 1])
            
            switch char {
                case "1":
                    return "ktlc"
                case "2":
                    return "wtlc"
                case "3":
                    return "mtlc"
                case "4":
                    return "ltlc"
                default:
                    return ""
            }

        case "role_basket_nest_2": // eg. 2453 that represents your most to least looked up heroes / role models
            let role_basket_nest_2 = String(describing: response["role_basket_nest"]!);
//                    print("/*****/ role_basket_nest")
//                    print(role_basket_nest_2)
            let char = role_basket_nest_2[role_basket_nest_2.index(role_basket_nest_2.startIndex, offsetBy: 1)]
//                    print("/*****/ role_basket_nest_2 char")
//                    print(role_basket_nest_2)
            
            switch char {
                case "1":
                    return "ktrc"
                case "2":
                    return "wtrc"
                case "3":
                    return "mtrc"
                case "4":
                    return "ltrc"
                default:
                    return ""
            }
                    
        case "role_basket_nest_3": // eg. 2453 that represents your most to least looked up heroes / role models
            let role_basket_nest_3 = String(describing: response["role_basket_nest"]!);
//                    print("/*****/ role_basket_nest")
//                    print(role_basket_nest_3)
            let char = role_basket_nest_3[role_basket_nest_3.index(role_basket_nest_3.startIndex, offsetBy: 2)]
//                    print("/*****/ role_basket_nest_3 char")
//                    print(role_basket_nest_3)
            
            switch char {
                case "1":
                    return "kblc"
                case "2":
                    return "wblc"
                case "3":
                    return "mblc"
                case "4":
                    return "lblc"
                default:
                    return ""
            }

            
        case "role_basket_nest_4": // eg. 2453 that represents your most to least looked up heroes / role models
            let role_basket_nest_4 = String(describing: response["role_basket_nest"]!);
//                    print("/*****/ role_basket_nest")
//                    print(role_basket_nest_4)
            let char = role_basket_nest_4[role_basket_nest_4.index(role_basket_nest_4.startIndex, offsetBy: 3)]
//                    print("/*****/ role_basket_nest_4 char")
//                    print(role_basket_nest_4)
            
            switch char {
                case "1":
                    return "kbrc"
                case "2":
                    return "wbrc"
                case "3":
                    return "mbrc"
                case "4":
                    return "lbrc"
                default:
                    return ""
            }
        
            
        case "intel_nest":
            var intel_nest_1 = String(describing: response["intel_nest"]!);
//            print("/*****/ role_nest_1")
//            print(role_nest_1)
            intel_nest_1 = intel_nest_1.substring(toIndex: 1);
//            print("/*****/ role_nest_1 char")
//            print(role_nest_1)
            // Numerical values from the database not 0th-starting
//            print("/****/ heroImages XCode image name")
//            print(heroImages[Int(role_nest_1)! - 1])
            
            return intelImages[Int(intel_nest_1)! - 1]

        case "talent_nest":
            var talent_nest_1 = String(describing: response["talent_nest"]!);
//            print("/*****/ role_nest_1")
//            print(role_nest_1)
            talent_nest_1 = talent_nest_1.components(separatedBy: "_")[0]
//            print("/*****/ role_nest_1 char")
//            print(role_nest_1)
            // Numerical values from the database not 0th-starting
//            print("/****/ heroImages XCode image name")
//            print(heroImages[Int(role_nest_1)! - 1])
            
            return talentImages[Int(talent_nest_1)! - 1]
       
        case "collect_nest":
            var collect_nest_1 = String(describing: response["collect_nest"]!);
//            print("/*****/ role_nest_1")
//            print(role_nest_1)
              collect_nest_1 = collect_nest_1.substring(toIndex: 1);
//            print("/*****/ role_nest_1 char")
//            print(role_nest_1)
            // Numerical values from the database not 0th-starting
//            print("/****/ heroImages XCode image name")
//            print(heroImages[Int(role_nest_1)! - 1])
            
            return talentImages[Int(collect_nest_1)! - 1]
       
            
            
        default:
            return "Error: None found";
            // print(MVMConverters.to(responses[0], "name"));


        }
    }
}

var responses:[[String:Any]]? = []
//var responses: [Dictionary<String, Any>] = []

var response = [
    "city":"",
    "collect":"",
    "collect_basket_nest":"",
    "collect_done":"",
    "collect_img1":"",
    "collect_img2":"",
    "collect_img3":"",
    "collect_img4":"",
    "collect_nest":"",
    "collect_sub":"",
    "device":"",
    "dob":"",
    "email":"",
    "gender":"",
    "intel":"",
    "intel_done":"",
    "intel_img1":"",
    "intel_img2":"",
    "intel_img3":"",
    "intel_img4":"",
    "intel_nest":"",
    "intel_sub":"",
    "name":"",
    "profile_pic":"",
    "role":"",
    "role_basket_nest":"",
    "role_done":"",
    "role_basket_img1":"",
    "role_basket_img2":"",
    "role_basket_img3":"",
    "role_basket_img4":"",
    "role_nest":"",
    "role_sub":"",
    "state":"",
    "talent":"",
    "talent_basket_nest":"",
    "talent_done":"",
    "talent_img1":"",
    "talent_img2":"",
    "talent_img3":"",
    "talent_img4":"",
    "talent_sub":"",
    "username":"",
    "zip":""
]
