//
//  ViewController.swift
//  Dashboard
//
//  Created by John Allen on 5/10/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit


class dashBoardController: UIViewController, UIGestureRecognizerDelegate{
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var viewCenter: CGPoint {
        get {
            let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
            let centerY: CGFloat = (view.bounds.height - tabBarHeight!)/2.0
            let centerX: CGFloat = (view.bounds.width)/2.0
            let center = CGPoint(x: centerX, y: centerY)
            return center
        }
    }
   
    var newViewHeight: CGFloat {
        get {
            let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
            return UIScreen.main.bounds.height - tabBarHeight!
            
            
        }
    }
    
    
    var newView: UIView!
    
    
   var fullScreenView: GraphView!
    
   var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    
    var effect:UIVisualEffect!
    
    
    var oldHeight:CGFloat = 0
    
    let graphView1: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.graphName = .battery
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        view.graphColor = .blue
        return view
    }()
    
    let graphView2: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.graphName = .voltage
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        view.graphColor = .orange
        return view
    }()
    
    let graphView3: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.graphName = .battery
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        view.graphColor = .pink
        return view
    }()
    
    let graphView4: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.graphName = .voltage
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        view.graphColor = .purple
        return view
    }()
    
    let topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var tap1: UITapGestureRecognizer!
    var tap2: UITapGestureRecognizer!
    var tap3: UITapGestureRecognizer!
    var tap4: UITapGestureRecognizer!

    
    
    var topStackView: UIStackView!
    var bottomStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        view.backgroundColor = colorWithHexString(hexString: "f0f0f0") //f0f0f0 4d4b4e
        //view.setGradientBackground(colorOne: colorWithHexString(hexString: "f0f0f0"), colorTwo: colorWithHexString(hexString: "4d4b4e"))
        setupViews()
    }
    
    
    var topAnchor: NSLayoutConstraint?
    var bottomAnchor: NSLayoutConstraint?
    var leftAnchor: NSLayoutConstraint?
    var rightAnchor: NSLayoutConstraint?
    var widthAnchor: NSLayoutConstraint?
    
    var topAnchor3: NSLayoutConstraint?
    var bottomAnchor3: NSLayoutConstraint?
    var leftAnchor3: NSLayoutConstraint?
    var rightAnchor3: NSLayoutConstraint?
    var widthAnchor3: NSLayoutConstraint?
    
    var topAnchor32: NSLayoutConstraint?
    var bottomAnchor32: NSLayoutConstraint?
    var leftAnchor32: NSLayoutConstraint?
    var rightAnchor32: NSLayoutConstraint?
    var widthAnchor32: NSLayoutConstraint?
    
    
    
    func setupViews() {
        
      
//        topStackView = UIStackView(arrangedSubviews: [graphView1, graphView2])
//        topStackView.translatesAutoresizingMaskIntoConstraints = false
//        bottomStackView = UIStackView(arrangedSubviews: [graphView3, graphView4])
//        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
//        topStackView.distribution = .fillEqually
//        //topStackView.alignment = .center
//        topStackView.axis = .horizontal
//        topStackView.spacing = 20
//        bottomStackView.distribution = .fillEqually
//        //bottomStackView.alignment = .center
//        bottomStackView.axis = .horizontal
//        bottomStackView.spacing = 20
//
        
        
        //topStackView.backgroundColor = UIColor.blue
        //bottomStackView.backgroundColor = UIColor.green
        
        
        
        
//        view.addSubview(topStackView)
//        view.addSubview(bottomStackView)
        
        view.addSubview(topContainer)
        view.addSubview(bottomContainer)
        topContainer.addSubview(graphView1)
        topContainer.addSubview(graphView2)
        bottomContainer.addSubview(graphView3)
        bottomContainer.addSubview(graphView4)
        //graphView1.layer.zPosition = 1
        
        
        
        
        
        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topContainer.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60)
            ])
        
        NSLayoutConstraint.activate([
            bottomContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomContainer.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60),
            bottomContainer.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40),
            
            //bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
            
            ])
        
        
        tap1 = UITapGestureRecognizer(target: self, action: #selector(didTap1))
        tap2 = UITapGestureRecognizer(target: self, action: #selector(didTap2))
        tap3 = UITapGestureRecognizer(target: self, action: #selector(didTap3))
        tap4 = UITapGestureRecognizer(target: self, action: #selector(didTap4))
        graphView1.addGestureRecognizer(tap1)
        graphView2.addGestureRecognizer(tap2)
        graphView3.addGestureRecognizer(tap3)
        graphView4.addGestureRecognizer(tap4)
        
        
       
        
        
       // NSLayoutConstraint.deactivate(graphView1.constraints)
        
        
        topAnchor =  graphView1.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0)
        topAnchor?.isActive = true
        bottomAnchor = graphView1.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0)
        bottomAnchor?.isActive = true
        leftAnchor = graphView1.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 0)
        leftAnchor?.isActive = true
        widthAnchor = graphView1.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5)
        widthAnchor?.isActive = true
//        NSLayoutConstraint.activate([
//            graphView1.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0),
//            graphView1.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 0),
//            graphView1.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0),
//            graphView1.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5)
//            ])
        
        NSLayoutConstraint.activate([
            graphView2.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0),
            graphView2.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5),
            graphView2.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0),
            graphView2.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor, constant: 0)
            ])
        
        topAnchor3 =  graphView3.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 0)
        topAnchor3?.isActive = true
        bottomAnchor3 = graphView3.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0)
        bottomAnchor3?.isActive = true
        leftAnchor3 = graphView3.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 0)
        leftAnchor3?.isActive = true
        widthAnchor3 = graphView3.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.5)
        widthAnchor3?.isActive = true
        
       
        topAnchor32 = graphView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
        leftAnchor32 = graphView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        rightAnchor32 = graphView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        bottomAnchor32 = graphView3.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)
        
        
        
//        NSLayoutConstraint.activate([
//            graphView3.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 0),
//            graphView3.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 0),
//            graphView3.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0),
//            graphView3.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.5)
//            ])
        
        NSLayoutConstraint.activate([
            graphView4.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 0),
            graphView4.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.5),
            graphView4.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0),
            graphView4.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: 0)
            ])
        
        
//        NSLayoutConstraint.activate([
//            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            topStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60)
//            ])
        
        //        NSLayoutConstraint.activate([
        //            middleContainer.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 0),
        //            middleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        //            middleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //            middleContainer.heightAnchor.constraint(equalToConstant: 40),
        //            //middleContainer.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: 0)
        //            ])
        
        
//        NSLayoutConstraint.activate([
//            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            bottomStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60),
//            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40),
//
//            //bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
//
//            ])
        
        oldHeight = newViewHeight
        
         //graphView1.round(corners: [UIRectCorner.bottomLeft, UIRectCorner.bottomRight], radius: 50)
        
    }
    
    
    @objc func didTap1() {
        tapAnimate(graphView: 1)
        
    }
    
    
    @objc func didTap2() {
        tapAnimate(graphView: 2)
        
    }
    
    @objc func didTap3() {
        tapAnimate(graphView: 3)
        
    }
    
    @objc func didTap4() {
        tapAnimate(graphView: 4)
        
    }
    
    func tapAnimate(graphView: Int)
    
    {
        _ = graphView3.constraints
//        graphView1.removeFromSuperview()
//        graphView2.removeFromSuperview()
//        graphView3.removeFromSuperview()
//        graphView4.removeFromSuperview()
//        bottomContainer.removeFromSuperview()
//        topContainer.removeFromSuperview()
//
        switch graphView {
        case 1:
            //self.view.addSubview(graphView1)
            //view.layer.zPosition = 1
            topContainer.bringSubview(toFront: graphView1)
            view.bringSubview(toFront: topContainer)
            
            widthAnchor?.isActive = false
            topAnchor?.isActive = false
            leftAnchor?.isActive = false
            bottomAnchor?.isActive = false
            topAnchor = graphView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
            topAnchor?.isActive = true
            leftAnchor = graphView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            leftAnchor?.isActive = true
            rightAnchor = graphView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            rightAnchor?.isActive = true
            bottomAnchor = graphView1.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)
            bottomAnchor?.isActive = true
            
           
            
//            NSLayoutConstraint.activate([
//                graphView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//                graphView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                graphView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                graphView1.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)
//                ])
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()}, completion: nil)
           graphView1.removeGestureRecognizer(tap1)
            let tap5 = UITapGestureRecognizer(target: self, action: #selector(didTapAgain))
            graphView1.addGestureRecognizer(tap5)
   
        case 2:
            self.view.addSubview(graphView2)
            
            NSLayoutConstraint.activate([
                graphView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                graphView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                graphView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                graphView2.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)
                ])
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()}, completion: nil)
            tap2 = UITapGestureRecognizer(target: self, action: #selector(didTapAgain))
            graphView2.addGestureRecognizer(tap2)
       
        case 3:
            bottomContainer.bringSubview(toFront: graphView3)
            view.bringSubview(toFront: bottomContainer)
            widthAnchor3?.isActive = false
            topAnchor3?.isActive = false
            leftAnchor3?.isActive = false
            bottomAnchor3?.isActive = false
            //topAnchor3 = graphView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
            topAnchor32?.isActive = true
            //leftAnchor3 = graphView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            leftAnchor32?.isActive = true
            //rightAnchor3 = graphView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            rightAnchor32?.isActive = true
            //bottomAnchor3 = graphView3.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)
            bottomAnchor32?.isActive = true
            
//            NSLayoutConstraint.activate([
//                graphView3.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40),
//                 graphView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                graphView3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                graphView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//                ])
            //view.layoutIfNeeded()
            print("touche")
           
            
            UIView.animate(withDuration: 0.4, animations: {self.view.layoutIfNeeded()})
           // UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()}, completion: nil)
            tap3 = UITapGestureRecognizer(target: self, action: #selector(didTapAgain))
            graphView3.addGestureRecognizer(tap3)
            
        case 4:
            self.view.addSubview(graphView4)
              print("touche")
            NSLayoutConstraint.activate([
                graphView4.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
                graphView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                graphView4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                graphView4.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)
                ])
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()}, completion: nil)
            tap4 = UITapGestureRecognizer(target: self, action: #selector(didTapAgain))
            graphView4.addGestureRecognizer(tap4)
        default:
            print("noooo")
        }
        
        
        
    }
    
    
    
    @objc func didTapAgain() {
        print("johnny")
        print("boog")
//        graphView1.removeFromSuperview()
//        graphView2.removeFromSuperview()
//        graphView3.removeFromSuperview()
//        graphView4.removeFromSuperview()
//        bottomContainer.removeFromSuperview()
//        topContainer.removeFromSuperview()
//        view.sendSubview(toBack: topContainer)
//        topContainer.sendSubview(toBack: graphView1)
       
        
//        widthAnchor?.isActive = false
//        topAnchor?.isActive = false
//        leftAnchor?.isActive = false
//        bottomAnchor?.isActive = false
//        rightAnchor?.isActive = false
//
//        topAnchor =  graphView1.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0)
//        topAnchor?.isActive = true
//        bottomAnchor = graphView1.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0)
//        bottomAnchor?.isActive = true
//        leftAnchor = graphView1.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 0)
//        leftAnchor?.isActive = true
//        widthAnchor = graphView1.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5)
//        widthAnchor?.isActive = true
        
        widthAnchor32?.isActive = false
        topAnchor32?.isActive = false
        leftAnchor32?.isActive = false
        bottomAnchor32?.isActive = false
        rightAnchor32?.isActive = false
        
        //topAnchor3 =  graphView3.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 0)
        topAnchor3?.isActive = true
       // bottomAnchor3 = graphView3.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0)
        bottomAnchor3?.isActive = true
       // leftAnchor3 = graphView3.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 0)
        leftAnchor3?.isActive = true
        //  widthAnchor3 = graphView3.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.5)
        widthAnchor3?.isActive = true
        
        
//        NSLayoutConstraint.activate([
//            graphView1.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0),
//            graphView1.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 0),
//            graphView1.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0),
//            graphView1.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5)
//            ])
        
       // setupViews()
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()})
        //UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()}, completion: nil)
        
        }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
       // setupViews()
        UIView.animate(withDuration: 0.7, animations: {self.view.layoutIfNeeded()})
       
        //UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.view.layoutIfNeeded()}, completion: nil)
    }
    @objc func rotated() {
        
//        NSLayoutConstraint.deactivate([topStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60),
//            bottomStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60)])
        
//        graphView1.removeFromSuperview()
//        graphView2.removeFromSuperview()
//        graphView3.removeFromSuperview()
//        graphView4.removeFromSuperview()
//
//        topStackView.removeFromSuperview()
//        bottomStackView.removeFromSuperview()
        
        
        
//
//        NSLayoutConstraint.deactivate([
//              topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            topStackView.heightAnchor.constraint(equalToConstant: (oldHeight/2) - 60)
//            ])
//
//        NSLayoutConstraint.deactivate([
//            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            bottomStackView.heightAnchor.constraint(equalToConstant: (oldHeight/2) - 60),
//            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)])
        
//        oldHeight = newViewHeight
//        NSLayoutConstraint.activate([
//            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
//            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            topStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60)
//            ])
//
//
//        NSLayoutConstraint.activate([
//            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//             bottomStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60),
//            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40),
        
            //bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
           
           // ])
        
        
        print("hey")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    
}


extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
}

extension UIView
{
    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
}
