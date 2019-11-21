//
//  QuizViewController.swift
//  Practica4-Quiz10
//
//  Created by g939 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITextFieldDelegate {
    
    
    var quiz: QuizItem!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var attachmentImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var responseTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel.text = quiz.question
        answerLabel.text = quiz.answer
        
        attachmentImageView.image = UIImage(named: "none")!
        if let url = quiz.attachment?.url {
            attachmentImageView.image = image(url: url)
        }
        photoImageView.image = UIImage(named: "none")!
        if let url = quiz.author?.photo?.url {
            photoImageView.image = image(url: url)
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        CheckYourAnswer()
        
    }
  
    
    @IBAction func Finish(_ sender: UITextField) {
        
        let resp = sender.text
         if resp == quiz.answer{
            alert(msg: "It's correct!!!!")
         }else{
             
             alert(msg:"Answer incorrect")
         }    }
    
    
    @IBAction func CheckYourAnswer() {
        
        let resp = responseTextField.text
        if resp == quiz.answer{
            
            print("It's correct!!!!")
        }else{
            
            print("Answer incorrect")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
