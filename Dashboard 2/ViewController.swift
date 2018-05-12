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
    
    
   
    var newViewHeight: CGFloat {
        get {
            let tabBarHeight = self.tabBarController?.tabBar.frame.size.height
            return UIScreen.main.bounds.height - tabBarHeight!
            
            
        }
    }
    
    
    var newView: UIView!
        
        //let rect = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
    
    
    
   var fullScreenView: GraphView!
    
   var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    
    var effect:UIVisualEffect!
    
    
    var oldHeight:CGFloat = 0
    
    let graphView1: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.graphName = .battery
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let graphView2: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.graphName = .voltage
        view.backgroundColor = UIColor.white
        return view
    }()
    
    let graphView3: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
         view.graphName = .battery
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    let graphView4: GraphView = {
        let view = GraphView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.graphName = .voltage
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    let topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let middleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    var tap: UITapGestureRecognizer!

    
    
    var topStackView: UIStackView!
    var bottomStackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
        
// NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    view.backgroundColor = colorWithHexString(hexString: "f0f0f0") //f0f0f0
        //view.setGradientBackground(colorOne: colorWithHexString(hexString: "f0f0f0"), colorTwo: colorWithHexString(hexString: "4d4b4e"))
        setupViews()
    }
    
    
    func setupViews() {
        
        graphView1.alpha = 1
        topStackView = UIStackView(arrangedSubviews: [graphView1, graphView2])
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView = UIStackView(arrangedSubviews: [graphView3, graphView4])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topStackView.distribution = .fillEqually
        //topStackView.alignment = .center
        topStackView.axis = .horizontal
        topStackView.spacing = 20
        bottomStackView.distribution = .fillEqually
        //bottomStackView.alignment = .center
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 20
        
        
        
        //topStackView.backgroundColor = UIColor.blue
        //bottomStackView.backgroundColor = UIColor.green
        topContainer.backgroundColor = colorWithHexString(hexString: "4d4b4e")
        middleContainer.backgroundColor = colorWithHexString(hexString: "4d4b4e")
        
        
        //view.addSubview(topContainer)
        view.addSubview(topStackView)
        //view.addSubview(middleContainer)
        view.addSubview(bottomStackView)
        
        
        
        //        NSLayoutConstraint.activate([
        //            topContainer.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0),
        //            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        //            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //            topContainer.heightAnchor.constraint(equalToConstant: 40)
        //        ])
        
        tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        graphView1.addGestureRecognizer(tap)
        
        
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60)
            ])
        
        //        NSLayoutConstraint.activate([
        //            middleContainer.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 0),
        //            middleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        //            middleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //            middleContainer.heightAnchor.constraint(equalToConstant: 40),
        //            //middleContainer.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: 0)
        //            ])
        
        
        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40),
            
            //bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
            
            ])
        
        oldHeight = newViewHeight
        
        
        
    }
    
    
    @objc func didTap() {
        
        print("hey")
        
        graphView1.removeFromSuperview()
        graphView2.removeFromSuperview()
        graphView3.removeFromSuperview()
        graphView4.removeFromSuperview()
        
        topStackView.removeFromSuperview()
        bottomStackView.removeFromSuperview()
        

        self.view.addSubview(graphView1)
        //fullScreenView = graphView1
        //fullScreenView.center = self.view.center
        //NSLayoutConstraint.deactivate(fullScreenView.constraints)


        //fullScreenView.isUserInteractionEnabled = true


        NSLayoutConstraint.activate([
        graphView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
        graphView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        graphView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        graphView1.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)
        ])

        graphView1.transform = CGAffineTransform.init(translationX: -100, y: -100)
        graphView1.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        graphView1.alpha = 0
        //graphView1.layer.zPosition = 1;
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.graphView1.alpha = 1
            self.graphView1.transform = CGAffineTransform.identity
            self.graphView1.transform = CGAffineTransform(translationX: 100, y: 100)
        }
        
        graphView1.removeGestureRecognizer(tap)
        tap = UITapGestureRecognizer(target: self, action: #selector(didTapAgain))
        graphView1.addGestureRecognizer(tap)

        //fullScreenView.graphWasTapped(controller: self)
    }
    
    @objc func didTapAgain() {
        print("johnny")
        UIView.animate(withDuration: 0.3, animations: {
            self.graphView1.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.graphView1.alpha = 0
            
            self.visualEffectView.effect = nil
            
        }) { (success:Bool) in
            self.graphView1.removeFromSuperview()
            self.graphView1.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            self.setupViews()
        }
    }
    
    
    @objc func rotated() {
        
//        NSLayoutConstraint.deactivate([topStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60),
//            bottomStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60)])
        
        NSLayoutConstraint.deactivate([
              topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topStackView.heightAnchor.constraint(equalToConstant: (oldHeight/2) - 60)
            ])
        
        NSLayoutConstraint.deactivate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomStackView.heightAnchor.constraint(equalToConstant: (oldHeight/2) - 60),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40)])
        
        oldHeight = newViewHeight
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            topStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60)
            ])
        

        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             bottomStackView.heightAnchor.constraint(equalToConstant: (newViewHeight/2) - 60),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -40),
            
            //bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 40),
           
            ])
        
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
