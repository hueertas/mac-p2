//
//  QuizzesTableViewController.swift
//  Practica4-Quiz10
//
//  Created by g939 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import UIKit

class QuizzesTableViewController: UITableViewController {
    
    var quiz10Model = Quiz10Model()
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quiz10Model.download() //cambias el contenido de la tabla con el download ( se lo asignas l objeto quiz10model)
        tableView.reloadData() //tableview:variable que proporciona los viewtable controler y ejecuta la tabla.En este caso 
        //se carga la tabla con sus filas...

    }
    
    
    @IBSegueAction func showQuizDetails(_ coder: NSCoder) -> QuizViewController? {
        
        let qvc = QuizViewController(coder: coder)!
        
        let row = tableView.indexPathForSelectedRow!.row
        
        qvc.quiz = quiz10Model.quizzes[row]
        
        
        return qvc
    }
    
    
    @IBAction func recargar(_ sender: UIBarButtonItem) {
        
        quiz10Model.download()
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    //las preguntas del data source y la tabla se implementa y se pinta a partir de aqui
    //hay que rellenar los metodos del data source 
    
    
    
    
    // Esta tableview m esta preguntando cuantas seciones hay y como se van a poner todas las preguntas seguidas,
    //solo hay una seccion (return 1)
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    
    
    // Esta tableview m esta preguntando cuantas filas hay en la seccion --> quizzes es el array con tods las preguntas ( hay 77 preg)
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz10Model.quizzes.count
    }

   //este tableview me dice dame una celda para ponerlo en el idexPath -->siempre mismo patron  
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Quiz Cell", for: indexPath) as! QuizCell
        
        
        // saco una celda que tienes que identificar siempre 
        // Configure the cell...
        
        let row = indexPath.row
        let quiz = quiz10Model.quizzes[row]
        
        cell.qLabel.text = quiz.question
        cell.imgView.image = UIImage(named: "none")
        if let url = quiz.attachment?.url {
         let img = image(url: url) 
            cell.imgView?.image = img
        }
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
