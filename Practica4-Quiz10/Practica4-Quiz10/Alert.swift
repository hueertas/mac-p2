//
//  Alert.swift
//  Practica4-Quiz10
//
//  Created by g939 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert (msg: String, completionHandler: (() -> ())? = nil) {
    print ("Alerta: \(msg)")
        let avc = UIAlertController(title :"Resultado" , message: msg,
        preferredStyle: .alert)
    
        avc.addAction(UIAlertAction(title: "0K", style: .default) { (action) in
            completionHandler?()
            })
        present(avc, animated: true)
    }}
