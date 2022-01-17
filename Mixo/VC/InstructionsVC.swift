//
//  InstructionsVC.swift
//  Mixo
//
//  Created by Sean Hall on 4/26/21.
//  Copyright © 2021 Sean Hall. All rights reserved.
//

import UIKit
import SwiftGifOrigin

@available(iOS 13.0, *)
class InstructionsVC: UIViewController{
    
    @IBOutlet weak var ivInstructions: UIImageView!
//    @IBOutlet weak var btnLoadEngine: UIButton!
    
    @IBOutlet weak var btnContinueNext: UIButton!
    @IBOutlet var uiView: UIView!
//    @IBOutlet weak var swipeText: UITextView!
//    @IBOutlet weak var arrowText: UITextView!
    
    let imageList = ["instructions1", "instructions2", "instructions3", "instructions4", "instructions5"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpUI()
        
//        let SwipeLeft = UISwipeGestureRecognizer()
//        let SwipeRight = UISwipeGestureRecognizer()
        
//        SwipeLeft.direction = .left
//        SwipeRight.direction = .right
//
//        self.uiView.addGestureRecognizer(SwipeLeft)
//        self.uiView.addGestureRecognizer(SwipeRight)
//
//        SwipeLeft.addTarget(self, action: #selector(Swipe(sender:)))
//        SwipeRight.addTarget(self, action: #selector(Swipe(sender:)))
        
        
    }
    
//    @objc func Swipe(sender: UISwipeGestureRecognizer){
//        switch sender.direction{
//            case .left:
//                if index < imageList.count - 1 {
//                    index = index + 1
//                    ivInstructions.loadGif(name: imageList[index])
//                }
//                if index < 4 {
//                    btnLoadEngine.alpha = 0
//                } else {
//                    btnLoadEngine.alpha = 1
//                    swipeText.alpha = 0
//                    arrowText.alpha = 0
//                }
//            case .right:
//                if index > 0 {
//                    index = index - 1
//                    ivInstructions.loadGif(name: imageList[index])
//                }
//
//                if index < 4 {
//                    btnLoadEngine.alpha = 0
//                } else {
//                    btnLoadEngine.alpha = 1
//                }
//            default:
//                break
//        }
//    }
    
    func setUpUI() {
        
        btnContinueNext.setTitle("Continue", for: .normal)
        ivInstructions.loadGif(name: imageList[0])
        
    }
    
    @IBAction func btnContinueNext(_ sender: Any) {

        index = index + 1
        if(index < 5) {
            btnContinueNext.setTitle("Continue", for: .normal)
            ivInstructions.loadGif(name: imageList[index])
        } else if (index == 5) {
            let mixoEngineLoad = mainSB.instantiateViewController(withIdentifier: "EngineLoadVC") as! EngineLoadVC
            self.present(mixoEngineLoad, animated: true, completion: nil)
        } else {
            ivInstructions.loadGif(name: imageList[index])
        }
        
    }
}
