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
    static var roleBasketNest1 = "roleBasketNest1";
    static var roleBasketNest2 = "roleBasketNest2";
    static var roleBasketNest3 = "roleBasketNest3";
    static var roleBasketNest4 = "roleBasketNest4";

    static var intelNest1 = "intelNest1";
    static var intelNest2 = "intelNest2";
    static var intelNest3 = "intelNest3";
    static var intelNest4 = "intelNest4";

    static var talentNest1 = "talentNest1";
    static var talentBasketNest1 = "talentBasketNest1";
    static var talentBasketNest2 = "talentBasketNest2";
    static var talentBasketNest3 = "talentBasketNest3";
    static var talentBasketNest4 = "talentBasketNest4";

    static var collectNest1 = "collectNest1";
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
            role_nest_1 = role_nest_1.substring(toIndex: 0);
            // Numerical values from the database not 0th-starting
            return heroImages[Int(role_nest_1)! - 1]
            
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
