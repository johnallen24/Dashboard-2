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
   
    let tableView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let coilView1: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView2: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView3: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView4: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView5: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView6: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView7: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView8: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let coilView9: UIImageView = {
        let view = UIImageView()
        view.isHighlighted = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         var timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        tableView.image = UIImage(named: "tablesquare")
        view.addSubview(tableView)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
//        view.addSubview(coilView1)
        
        coilView1.image = UIImage(named: "BareCoil")
        coilView2.image = UIImage(named: "BareCoil")
        coilView3.image = UIImage(named: "BareCoil")
        coilView4.image = UIImage(named: "BareCoil")
        coilView5.image = UIImage(named: "BareCoil")
        coilView6.image = UIImage(named: "BareCoil")
        coilView7.image = UIImage(named: "BareCoil")
        coilView8.image = UIImage(named: "BareCoil")
        coilView9.image = UIImage(named: "BareCoil")
        
        coilView1.image = coilView1.image?.imageWithColor(color1: UIColor.yellow)
        

        
        let topStackView = UIStackView(arrangedSubviews: [coilView1, coilView2, coilView3])
        topStackView.distribution = .fillEqually
        topStackView.axis = .horizontal
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        let middleStackView = UIStackView(arrangedSubviews: [coilView4, coilView5, coilView6])
        middleStackView.axis = .horizontal
        middleStackView.distribution = .fillEqually
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        let bottomStackView = UIStackView(arrangedSubviews: [coilView7, coilView8, coilView9])
        bottomStackView.distribution = .fillEqually
       bottomStackView.axis = .horizontal
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let totalStackView = UIStackView(arrangedSubviews: [topStackView,middleStackView,bottomStackView])
        totalStackView.axis = .vertical
        totalStackView.distribution = .fillEqually
        totalStackView.translatesAutoresizingMaskIntoConstraints = false 
        
//        view.addSubview(topStackView)
//        view.addSubview(middleStackView)
//        view.addSubview(bottomStackView)
        view.addSubview(totalStackView)
        
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            totalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            totalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            totalStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
            ])
        
//        NSLayoutConstraint.activate([
//            middleStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 0),
//            middleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            middleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            middleStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.333)
//            ])
//
//        NSLayoutConstraint.activate([
//            bottomStackView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 0),
//            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
//            ])
       
        
//        coilView.image = coilImage
//        coilView.image = coilView.image?.imageWithColor(color1: UIColor.brown)
//
       // coilView.frame = CGRect(x: 200, y: 200, width: 400, height: 400)

            NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
            ])
        
        
//        
//        NSLayoutConstraint.activate([
//            coilView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
//            coilView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 350),
//            coilView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -350),
//            coilView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -300)
//            ])
//

        
        
        
        
        
    
    
    
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

