//
//  GameViewController.swift
//  GameCollector
//
//  Created by Mohammed Al-Khonaizi on 2/24/17.
//  Copyright © 2017 Mohammed Al-Khonaizi. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var gameImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var imagePicker = UIImagePickerController()
    
    var game : Game? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        if game != nil {
            print("We have a game")
            
            gameImageView.image = UIImage (data: game!.image as! Data)
            
            titleTextField.text = game!.title
            
            addUpdateButton.setTitle("Update", for: .normal)
            
            
        } else {
            
            print("We dont have a game")
            
            deleteButton.isHidden = true
            
            
            
        }
    }

    @IBAction func cameraTapped(_ sender: Any) {
    }

    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let game = Game (context: context)
        
        game.title = titleTextField.text
        
        game.image = UIImagePNGRepresentation(gameImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popToRootViewController(animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }
    
}
