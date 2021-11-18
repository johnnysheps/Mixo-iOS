//
//  ProfileScene1VC.swift
//  Mixo
//
//  Created by Sean Hall on 10/30/19.
//  Copyright © 2019 Sean Hall. All rights reserved.
//

import UIKit
import FirebaseStorage

@available(iOS 13.0, *)
class ProfileScene1VC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate {

    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var btnNext: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
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
        
        if let uploadData = imgProfilePic.image!.jpegData(compressionQuality: 0.75){
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
                let profileScene2VC = mainSB.instantiateViewController(withIdentifier: "ProfileScene2VC") as! ProfileScene2VC
                self.present(profileScene2VC, animated:true, completion:nil)
            }
        }
        
    }
    
    
    

}


