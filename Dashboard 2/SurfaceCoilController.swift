//
//  SurfaceCoilController.swift
//  Dashboard 2
//
//  Created by John Allen on 5/14/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class SurfaceCoilController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
   
    let table: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let coilView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.image = UIImage(named: "SideDesk")
        view.addSubview(table)
        
        
        let coilImage = UIImage(named: "Coil1")
        coilView.image = coilImage
    
        
      
        
      
        
       
        
        coilView.image = coilImage
        coilView.image = coilView.image?.imageWithColor(color1: UIColor.brown)
        

        view.addSubview(coilView)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            table.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            coilView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            coilView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            coilView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300),
            coilView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -350)
            ])
        

        
        
        
        
        
    
    
    
}

}


extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.destinationOver)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

