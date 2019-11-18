//
//  ImageStore.swift
//  Practica4-Quiz10
//
//  Created by g939 DIT UPM on 18/11/2019.
//  Copyright © 2019 IWEB. All rights reserved.
//

import UIKit


var imageCache = [URL: UIImage]()

func image(url: URL) -> UIImage {
    
    if let img = imageCache[url]{
        return img
    }
    
    if let data = try? Data(contentsOf: url),
    
        let img = UIImage(data: data) {
        imageCache[url] = img
        return img
    }
    
    
    return UIImage(named: "error")!
    
}
