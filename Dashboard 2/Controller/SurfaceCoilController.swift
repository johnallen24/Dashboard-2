//
//  SurfaceCoilController.swift
//  Dashboard 2
//
//  Created by John Allen on 5/14/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import AVFoundation


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
    
    var timer: Timer?
    
    override func viewWillAppear(_ animated: Bool) {
         timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
            ])
        
    }
    
    var speechSynthesizer = AVSpeechSynthesizer()
    
    
    @objc func update() {
        
        let speechUtterance: AVSpeechUtterance
        let coilColor = colorWithHexString(hexString: "#fdf959")
        
        coilView1.image = UIImage(named: "BareCoil")
        coilView2.image = UIImage(named: "BareCoil")
        coilView3.image = UIImage(named: "BareCoil")
        coilView4.image = UIImage(named: "BareCoil")
        coilView5.image = UIImage(named: "BareCoil")
        coilView6.image = UIImage(named: "BareCoil")
        coilView7.image = UIImage(named: "BareCoil")
        coilView8.image = UIImage(named: "BareCoil")
        coilView9.image = UIImage(named: "BareCoil")
        
        
        let number = Double(arc4random_uniform(9) + 1)
        print(number)
        switch number {
        case 1:
              speechUtterance = AVSpeechUtterance(string: "Coil 1")
              coilView1.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 2:
             speechUtterance = AVSpeechUtterance(string: "Coil 2")
            coilView2.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 3:
              speechUtterance = AVSpeechUtterance(string: "Coil 3")
            coilView3.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 4:
              speechUtterance = AVSpeechUtterance(string: "Coil 4")
            coilView4.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 5:
               speechUtterance = AVSpeechUtterance(string: "Coil 5")
            coilView5.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 6:
               speechUtterance = AVSpeechUtterance(string: "Coil 6")
            coilView6.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 7:
               speechUtterance = AVSpeechUtterance(string: "Coil 7")
            coilView7.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 8:
               speechUtterance = AVSpeechUtterance(string: "Coil 8")
            coilView8.image = coilView1.image?.imageWithColor(color1: coilColor)
        case 9:
               speechUtterance = AVSpeechUtterance(string: "Coil 9")
              coilView9.image = coilView1.image?.imageWithColor(color1: coilColor)
        default:
            speechUtterance = AVSpeechUtterance(string: "Error")
        }
        
        speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 2.0
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(speechUtterance)
    }
    
    
    func colorWithHexString(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        timer?.invalidate()
        timer = nil
        
        coilView1.image = UIImage(named: "BareCoil")
        coilView2.image = UIImage(named: "BareCoil")
        coilView3.image = UIImage(named: "BareCoil")
        coilView4.image = UIImage(named: "BareCoil")
        coilView5.image = UIImage(named: "BareCoil")
        coilView6.image = UIImage(named: "BareCoil")
        coilView7.image = UIImage(named: "BareCoil")
        coilView8.image = UIImage(named: "BareCoil")
        coilView9.image = UIImage(named: "BareCoil")
    }
    
}




extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

