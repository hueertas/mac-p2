//
//  Quiz10Model.swift
//  Practica4-Quiz10
//
//  Created by g939 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import Foundation


struct QuizItem: Codable{
    let id: Int
    let question: String
    let answer: String
    let author: Author?
    let attachment: Attachment?
    let favourite: Bool
    let tips: [String]
    
    struct Author: Codable {
        let isAdmin: Bool?
        let username: String
        let photo: Attachment?
        
    }
    
    struct Attachment: Codable{
        let filename: String
        let mime: String
        let url: URL?
        
    }
}
class Quiz10Model{
    var quizzes = [QuizItem]()
    
    func download(){
        
        let surl = "https://quiz.dit.upm.es/api/quizzes/random10wa?token=c408be74597939371f45"
        
        guard let url = URL(string: surl) else {
            print("malo malo malisimo malo")
            return
        }
        
        do{
            let data = try Data(contentsOf: url)
            
          //let letra blablabla min 46
            
            let decoder = JSONDecoder()
            
            let quizzes = try decoder.decode([QuizItem].self, from: data)
            
            self.quizzes = quizzes
            
        }catch { //buscar en traspas lo q hay q poner noseq de error
            print("catapum")
        }
    }
    
    
    
}
