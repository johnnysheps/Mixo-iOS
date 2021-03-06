//
//  ProfileScene1VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/30/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FirebaseStorage
import FontAwesome_swift

@available(iOS 13.0, *)
class ProfileScene4NVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {
    @IBOutlet weak var chevron: UITextView!
    
    // Multistep progress bar
    @IBOutlet weak var ivProgressIndicator0: UIImageView!
    @IBOutlet weak var ivProgressIndicator1: UIImageView!
    @IBOutlet weak var ivProgressIndicator2: UIImageView!
    @IBOutlet weak var ivProgressIndicator3: UIImageView!
    @IBOutlet weak var ivProgressIndicator4: UIImageView!
    
    // Buttons
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        chevron.font = UIFont.fontAwesome(ofSize: 20, style: .solid)
        chevron.text = String.fontAwesomeIcon(name: FontAwesome.chevronRight)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        btnNext.isHidden = true
        btnNext.isEnabled = false
        
        
        // Do any additional setup after loading the view.
        setUpUI()
    }
    
    @IBAction func btnCamera(_ sender: Any) {
        
       let alert = UIAlertController(title: "Choose Option", message: "Where would you like to get your Profile Picture From?", preferredStyle: .actionSheet)
       alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
           self.getImage(fromSourceType: .camera)
       }))
       alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
           self.getImage(fromSourceType: .photoLibrary)
       }))
       alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        if let popoverController = alert.popoverPresentationController {
          popoverController.sourceView = self.view
          popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
          popoverController.permittedArrowDirections = []
        }
        
        
         self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imgProfilePic.contentMode = .scaleAspectFill
            imgProfilePic.image = pickedImage
            
            btnNext.isHidden = false
            btnNext.isEnabled = true
        }
     
        dismiss(animated: true, completion: nil)
    }
    
    //get image from source type
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {

        //Check is source type available
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {

            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = sourceType
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
            
            
            
        }
    }
    
    @IBAction func btnNext(_ sender: Any) {
        
        //upload picture to FireStorage
        
        //create a UUID
        let identifier = UUID().uuidString
        let stringPath = "profile_pics/" + userUID + "/" + identifier + ".jpeg"
        
        if let uploadData = imgProfilePic.image?.jpegData(compressionQuality: 0.75){
            //upload image to FireStore
            let storageRef = Storage.storage().reference().child(stringPath)
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                if error != nil {
                    print(error!)
                    return
                }
                print(metadata!)
            }
        }
        
        //save picture url to Firestore
        docRef.updateData([
            "profile_pic": stringPath,
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                let profileScene5NVC = mainSB.instantiateViewController(withIdentifier: "ProfileScene5NVC") as! ProfileScene5NVC
                self.present(profileScene5NVC, animated:true, completion:nil)
            }
        }
        
    }
    
    
    func setUpUI() {
        
        // Progess indicators - Render appropriately
        ivProgressIndicator0.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator1.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator2.image = UIImage(named:"progress-indicator-gray")
        ivProgressIndicator3.image = UIImage(named:"progress-indicator-purple")
        ivProgressIndicator4.image = UIImage(named:"progress-indicator-gray")
    }

}


