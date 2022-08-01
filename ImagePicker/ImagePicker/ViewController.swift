//
//  ViewController.swift
//  ImagePicker
//
//  Created by 김준엽 on 2022/07/28.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpSelectImageButton(_ sender: UIButton){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    //MARK: When picking canceled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        print("The process was canceled successfully")
    }
    
    //MARK: When picking done
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
            print("The selected photo is uploaded successfully")
        }
        
        self.dismiss(animated: true, completion: nil)
    }

}

