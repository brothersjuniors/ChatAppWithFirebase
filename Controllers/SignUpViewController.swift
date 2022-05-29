//
//  SignUpViewController.swift
//  ChatApp WithFirebase
//
//  Created by 近江伸一 on 2022/05/29.
//

import UIKit
class SignUpViewController:UIViewController{
    
    @IBOutlet weak var profileImageButom: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var allreadyHasButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageButom.layer.cornerRadius = 85
        profileImageButom.layer.borderWidth = 1
        profileImageButom.layer.borderColor = UIColor.rgb(red: 240, green: 240, blue: 240, alpha: 1).cgColor
        registerButton.layer.cornerRadius = 15
        
    }
    
    @IBAction func tappedProfileButton(_ sender: UIButton) {
        
        // imagePickerControllerを使う
    
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
        
        
        
    }
    
}
extension SignUpViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    //写真を受け取るコード
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editImage = info[.editedImage] as? UIImage{profileImageButom.setImage(editImage.withRenderingMode(.alwaysOriginal),for: .normal)
            
        }else if let originalImage = info[.originalImage] as? UIImage {
            profileImageButom.setTitle("", for: .normal)
            profileImageButom.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
            profileImageButom.imageView?.contentMode = .scaleAspectFill
            profileImageButom.contentHorizontalAlignment = .fill
            profileImageButom.contentVerticalAlignment = .fill
            
            profileImageButom.clipsToBounds = true
        }
        dismiss(animated: true,completion: nil)
    }
    

}
