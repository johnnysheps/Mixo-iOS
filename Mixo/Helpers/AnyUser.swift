//
//  AnyUser.swift
//  Mixo
//
//  Created by Weng on 6/13/22.
//  Copyright © 2022 Sean Hall. All rights reserved.
//

import Foundation

class MVMc {
    static var city = "city";
    static var device = "device";
    static var dob = "dob";
    static var email = "email";
    static var gender = "gender";
    static var name = "name";
    static var profile_pic = "profile_pic";
    static var state = "state";
    static var username = "username";
    static var zip = "zip";

//    static var gsImgRef = "gsImgRef";
//    static var httpsImgRef = "httpsImgRef";

    static var role_done = "role_done";
    static var intel_done = "intel_done";
    static var talent_done = "talent_done";
    static var collect_done = "collect_done";

    static var role_nest = "role_nest";
    static var role_basket_nest_1 = "role_basket_nest_1";
    static var role_basket_nest_2 = "role_basket_nest_2";
    static var role_basket_nest_3 = "role_basket_nest_3";
    static var role_basket_nest_4 = "role_basket_nest_4";

    static var intel_nest = "intel_nest";
    static var intel_nest_1 = "intel_nest_1";
    static var intel_nest_2 = "intel_nest_2";
    static var intel_nest_3 = "intel_nest_3";
    static var intel_nest_4 = "intel_nest_4";

    static var talent_nest = "talent_nest";
    static var talent_basket_nest_1 = "talent_basket_nest_1";
    static var talent_basket_nest_2 = "talent_basket_nest_2";
    static var talent_basket_nest_3 = "talent_basket_nest_3";
    static var talent_basket_nest_4 = "talent_basket_nest_4";

    static var collect_nest = "collect_nest";
    static var collect_basket_nest_1 = "collect_basket_nest_1";
    static var collect_basket_nest_2 = "collect_basket_nest_2";
    static var collect_basket_nest_3 = "collect_basket_nest_3";
    static var collect_basket_nest_4 = "collect_basket_nest_4";
}

class MVMConverters {
    static func to(_ response:[String:Any], _ type:String) -> String {
        switch type {

            case "name":
                if(response["name"]==nil) { return "incomplete"; }
                return String(describing: response["name"]!);
                
            case "profile_pic":
                print("/****/ profile_pic **DEBUG** If crash this was the last user ID")
                print(response["flattened_user_id"]);
                if(response["profile_pic"]==nil) { return "incomplete"; }
                    
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
                if(response["role_nest"]==nil) { return "incomplete"; }
                var role_nest_1 = String(describing: response["role_nest"]!);
                if(role_nest_1=="incomplete") {
                    return "incomplete";
                }
                role_nest_1 = role_nest_1.substring(toIndex: 1);
                
                return heroImages[Int(role_nest_1)! - 1]

            case "role_basket_nest_1":
                if(response["role_basket_nest"]==nil) { return "incomplete"; }
                let role_basket_nest_1 = String(describing: response["role_basket_nest"]!);
                if(role_basket_nest_1=="incomplete") {
                    return "incomplete";
                }
                let char = role_basket_nest_1[role_basket_nest_1.index(role_basket_nest_1.startIndex, offsetBy: 0)]
                
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
                        return "incomplete"
                }

            case "role_basket_nest_2":
                if(response["role_basket_nest"]==nil) { return "incomplete"; }
                let role_basket_nest_2 = String(describing: response["role_basket_nest"]!);
                if(role_basket_nest_2=="incomplete") {
                    return "incomplete";
                }
                let char = role_basket_nest_2[role_basket_nest_2.index(role_basket_nest_2.startIndex, offsetBy: 1)]
                
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
                        return "incomplete"
                }
                        
            case "role_basket_nest_3":
                if(response["role_basket_nest"]==nil) { return "incomplete"; }
                let role_basket_nest_3 = String(describing: response["role_basket_nest"]!);
                if(role_basket_nest_3=="incomplete") {
                    return "incomplete";
                }
                let char = role_basket_nest_3[role_basket_nest_3.index(role_basket_nest_3.startIndex, offsetBy: 2)]
                
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
                        return "incomplete"
                }

                
            case "role_basket_nest_4":
                if(response["role_basket_nest"]==nil) { return "incomplete"; }
                let role_basket_nest_4 = String(describing: response["role_basket_nest"]!);
                if(role_basket_nest_4=="incomplete") {
                    return "incomplete";
                }
                let char = role_basket_nest_4[role_basket_nest_4.index(role_basket_nest_4.startIndex, offsetBy: 3)]
                
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
                        return "incomplete"
                }
            
                
            case "intel_nest":
                if(response["intel_nest"]==nil) { return "incomplete"; }
                var intel_nest_1 = String(describing: response["intel_nest"]!);
                if(intel_nest_1=="incomplete") {
                    return "incomplete";
                }
                intel_nest_1 = intel_nest_1.substring(toIndex: 1);
                
                return intelImages[Int(intel_nest_1)! - 1]
                
            case "intel_nest_1":
                if(response["intel_nest"]==nil) { return "incomplete"; }
                let intel_nest_1 = String(describing: response["intel_nest"]!);
                if(intel_nest_1=="incomplete") {
                    return "incomplete";
                }
                let char = intel_nest_1[intel_nest_1.index(intel_nest_1.startIndex, offsetBy: 0)]
                
                switch char {
                    case "1":
                        return "verbaltlc"
                    case "2":
                        return "naturalistictlc"
                    case "3":
                        return "interpersonaltlc"
                    case "4":
                        return "ilogicaltlc"
                    case "5":
                        return "bodilytlc"
                    case "6":
                        return "intrapersonaltlc"
                    case "7":
                        return "musicaltlc"
                    case "8":
                        return "visualtlc"
                    case "9":
                        return "existentialtlc"
                    default:
                        return "incomplete"
                }

            case "intel_nest_2":
                if(response["intel_nest"]==nil) { return "incomplete"; }
                let intel_nest_2 = String(describing: response["intel_nest"]!);
                if(intel_nest_2=="incomplete") {
                    return "incomplete";
                }
                let char = intel_nest_2[intel_nest_2.index(intel_nest_2.startIndex, offsetBy: 1)]
                
                switch char {
                    case "1":
                        return "verbaltrc"
                    case "2":
                        return "naturalistictrc"
                    case "3":
                        return "interpersonaltrc"
                    case "4":
                        return "ilogicaltrc"
                    case "5":
                        return "bodilytrc"
                    case "6":
                        return "intrapersonaltrc"
                    case "7":
                        return "musicaltrc"
                    case "8":
                        return "visualtrc"
                    case "9":
                        return "existentialtrc"
                    default:
                        return "incomplete"
                }
                
            case "intel_nest_3":
                if(response["intel_nest"]==nil) { return "incomplete"; }
                let intel_nest_3 = String(describing: response["intel_nest"]!);
                if(intel_nest_3=="incomplete") {
                    return "incomplete";
                }
                let char = intel_nest_3[intel_nest_3.index(intel_nest_3.startIndex, offsetBy: 2)]
                
                switch char {
                    case "1":
                        return "verbalblc"
                    case "2":
                        return "naturalisticblc"
                    case "3":
                        return "interpersonalblc"
                    case "4":
                        return "ilogicalblc"
                    case "5":
                        return "bodilyblc"
                    case "6":
                        return "intrapersonalblc"
                    case "7":
                        return "musicalblc"
                    case "8":
                        return "visualblc"
                    case "9":
                        return "existentialblc"
                    default:
                        return "incomplete"
                }
                
            case "intel_nest_4":
                if(response["intel_nest"]==nil) { return "incomplete"; }
                let intel_nest_4 = String(describing: response["intel_nest"]!);
                if(intel_nest_4=="incomplete") {
                    return "incomplete";
                }
                let char = intel_nest_4[intel_nest_4.index(intel_nest_4.startIndex, offsetBy: 3)]
                
                switch char {
                    case "1":
                        return "verbalbrc"
                    case "2":
                        return "naturalisticbrc"
                    case "3":
                        return "interpersonalbrc"
                    case "4":
                        return "ilogicalbrc"
                    case "5":
                        return "bodilybrc"
                    case "6":
                        return "intrapersonalbrc"
                    case "7":
                        return "musicalbrc"
                    case "8":
                        return "visualbrc"
                    case "9":
                        return "existentialbrc"
                    default:
                        return "incomplete"
                }
            case "talent_nest":
                if(response["talent_nest"]==nil) { return "incomplete"; }
                var talent_nest_1 = String(describing: response["talent_nest"]!);
                if(talent_nest_1=="incomplete") {
                    return "incomplete";
                }
                talent_nest_1 = talent_nest_1.components(separatedBy: "_")[0]
                

                return talentImages[Int(talent_nest_1)! - 1]

            case "talent_basket_nest_1":
                if(response["talent_basket_nest"]==nil) { return "incomplete"; }
                let talent_basket_nest_1 = String(describing: response["talent_basket_nest"]!);
                if(talent_basket_nest_1=="incomplete") {
                    return "incomplete";
                }
                let char = talent_basket_nest_1[talent_basket_nest_1.index(talent_basket_nest_1.startIndex, offsetBy: 0)]
                
                switch char {
                    case "1":
                        return "physicaltlc"
                    case "2":
                        return "spiritualtlc"
                    case "3":
                        return "logicaltlc"
                    case "4":
                        return "creativetlc"
                    default:
                        return "incomplete"
                }
                
            case "talent_basket_nest_2":
                if(response["talent_basket_nest"]==nil) { return "incomplete"; }
                let talent_basket_nest_2 = String(describing: response["talent_basket_nest"]!);
                if(talent_basket_nest_2=="incomplete") {
                    return "incomplete";
                }
                let char = talent_basket_nest_2[talent_basket_nest_2.index(talent_basket_nest_2.startIndex, offsetBy: 1)]
                
                switch char {
                    case "1":
                        return "physicaltrc"
                    case "2":
                        return "spiritualtrc"
                    case "3":
                        return "logicaltrc"
                    case "4":
                        return "creativetrc"
                    default:
                        return "incomplete"
                }
                
            case "talent_basket_nest_3":
                if(response["talent_basket_nest"]==nil) { return "incomplete"; }
                let talent_basket_nest_3 = String(describing: response["talent_basket_nest"]!);
                if(talent_basket_nest_3=="incomplete") {
                    return "incomplete";
                }
                let char = talent_basket_nest_3[talent_basket_nest_3.index(talent_basket_nest_3.startIndex, offsetBy: 2)]
                
                switch char {
                    case "1":
                        return "physicalblc"
                    case "2":
                        return "spiritualblc"
                    case "3":
                        return "logicalblc"
                    case "4":
                        return "creativeblc"
                    default:
                        return "incomplete"
                }
     
            case "talent_basket_nest_4":
                if(response["talent_basket_nest"]==nil) { return "incomplete"; }
                let talent_basket_nest_4 = String(describing: response["talent_basket_nest"]!);
                if(talent_basket_nest_4=="incomplete") {
                    return "incomplete";
                }
                let char = talent_basket_nest_4[talent_basket_nest_4.index(talent_basket_nest_4.startIndex, offsetBy: 3)]
                
                switch char {
                    case "1":
                        return "physicalbrc"
                    case "2":
                        return "spiritualbrc"
                    case "3":
                        return "logicalbrc"
                    case "4":
                        return "creativebrc"
                    default:
                        return "incomplete"
                }
            
                
            case "collect_nest":
                if(response["collect_nest"]==nil) { return "incomplete"; }
                var collect_nest_1 = String(describing: response["collect_nest"]!);
                if(collect_nest_1=="incomplete") {
                    return "incomplete";
                }
                collect_nest_1 = collect_nest_1.substring(toIndex: 1);
                
                return talentImages[Int(collect_nest_1)! - 1]
           
     
            case "collect_basket_nest_1":
                if(response["collect_basket_nest"]==nil) { return "incomplete"; }
                let collect_basket_nest_1 = String(describing: response["collect_basket_nest"]!);
                if(collect_basket_nest_1=="incomplete") {
                    return "incomplete";
                }
                let char = collect_basket_nest_1[collect_basket_nest_1.index(collect_basket_nest_1.startIndex, offsetBy: 0)]
                
                switch char {
                    case "1":
                        return "physicaltlc"
                    case "2":
                        return "spiritualtlc"
                    case "3":
                        return "logicaltlc"
                    case "4":
                        return "creativetlc"
                    default:
                        return "incomplete"
                }

                
           case "collect_basket_nest_2":
                if(response["collect_basket_nest"]==nil) { return "incomplete"; }
               let collect_basket_nest_2 = String(describing: response["collect_basket_nest"]!);
               if(collect_basket_nest_2=="incomplete") {
                   return "incomplete";
               }
               let char = collect_basket_nest_2[collect_basket_nest_2.index(collect_basket_nest_2.startIndex, offsetBy: 1)]
               
               switch char {
                   case "1":
                       return "physicaltrc"
                   case "2":
                       return "spiritualtrc"
                   case "3":
                       return "logicaltrc"
                   case "4":
                       return "creativetrc"
                   default:
                       return "incomplete"
               }
                
            case "collect_basket_nest_3":
                if(response["collect_basket_nest"]==nil) { return "incomplete"; }
                let collect_basket_nest_3 = String(describing: response["collect_basket_nest"]!);
                if(collect_basket_nest_3=="incomplete") {
                    return "incomplete";
                }
                let char = collect_basket_nest_3[collect_basket_nest_3.index(collect_basket_nest_3.startIndex, offsetBy: 2)]
                
                switch char {
                    case "1":
                        return "physicalblc"
                    case "2":
                        return "spiritualblc"
                    case "3":
                        return "logicalblc"
                    case "4":
                        return "creativeblc"
                    default:
                        return "incomplete"
                }
                 
            case "collect_basket_nest_4":
                if(response["collect_basket_nest"]==nil) { return "incomplete"; }
                let collect_basket_nest_4 = String(describing: response["collect_basket_nest"]!);
                if(collect_basket_nest_4=="incomplete") {
                    return "incomplete";
                }
                let char = collect_basket_nest_4[collect_basket_nest_4.index(collect_basket_nest_4.startIndex, offsetBy: 3)]
                
                switch char {
                    case "1":
                        return "physicalbrc"
                    case "2":
                        return "spiritualbrc"
                    case "3":
                        return "logicalbrc"
                    case "4":
                        return "creativebrc"
                    default:
                        return "incomplete"
                }
        
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
