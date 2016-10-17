//
//  PictureViewController.swift
//  SnapChat Clone
//
//  Created by ROHIT GUPTA on 10/16/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//

import UIKit

class PictureViewController: UIPageViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }


    @IBAction func cameraTapped(_ sender: AnyObject) {
        
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: AnyObject) {
    }
    
    

}
