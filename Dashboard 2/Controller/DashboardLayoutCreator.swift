//
//  DashboardLayoutCreator.swift
//  Dashboard 2
//
//  Created by John Allen on 5/15/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

extension dashBoardController {
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateDashboard), name: Notification.Name(rawValue: "updateDashboard"), object: nil)
       
        view.addSubview(overviewContainer)
        view.addSubview(singleContainer)
        view.addSubview(topContainer)
        view.addSubview(bottomContainer)
        view.addSubview(topRightContainer)
        view.addSubview(topLeftContainer)
        view.addSubview(bottomLeftContainer)
        view.addSubview(bottomRightContainer)
        
          view.addSubview(graphView1)
          view.addSubview(graphView2)
          view.addSubview(graphView3)
          view.addSubview(graphView4)
    
        overviewContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        singleContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        topContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        bottomContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        
        NSLayoutConstraint.activate([
            overviewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            overviewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            overviewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            overviewContainer.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            singleContainer.topAnchor.constraint(equalTo: overviewContainer.topAnchor, constant: 40),
            singleContainer.leadingAnchor.constraint(equalTo: overviewContainer.leadingAnchor, constant: 20),
            singleContainer.trailingAnchor.constraint(equalTo: overviewContainer.trailingAnchor, constant: -20),
            singleContainer.bottomAnchor.constraint(equalTo: overviewContainer.bottomAnchor, constant: -40)
            ])
        
        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: overviewContainer.topAnchor, constant: 35),
            topContainer.leadingAnchor.constraint(equalTo: overviewContainer.leadingAnchor, constant: 20),
            topContainer.trailingAnchor.constraint(equalTo: overviewContainer.trailingAnchor, constant: -20),
            topContainer.heightAnchor.constraint(equalTo: overviewContainer.heightAnchor, multiplier: 0.5, constant: -60)
            ])
        
        NSLayoutConstraint.activate([
            bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 45),
            bottomContainer.leadingAnchor.constraint(equalTo: overviewContainer.leadingAnchor, constant: 20),
            bottomContainer.trailingAnchor.constraint(equalTo: overviewContainer.trailingAnchor, constant: -20),
            bottomContainer.heightAnchor.constraint(equalTo: overviewContainer.heightAnchor, multiplier: 0.5, constant: -60)
            ])
        
        
        NSLayoutConstraint.activate([
            topRightContainer.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0),
            topRightContainer.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0),
            topRightContainer.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 0),
            topRightContainer.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            topLeftContainer.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 0),
            topLeftContainer.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0),
            topLeftContainer.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor, constant: 0),
            topLeftContainer.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.5, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            bottomRightContainer.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 0),
            bottomRightContainer.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0),
            bottomRightContainer.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 0),
            bottomRightContainer.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.5, constant: -10)
            ])
        
        NSLayoutConstraint.activate([
            bottomLeftContainer.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 0),
            bottomLeftContainer.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor, constant: 0),
            bottomLeftContainer.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: 0),
            bottomLeftContainer.widthAnchor.constraint(equalTo: bottomContainer.widthAnchor, multiplier: 0.5, constant: -10)
            ])
        
        
        topRightContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        bottomLeftContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        bottomRightContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        topLeftContainer.backgroundColor = colorWithHexString(hexString: "#eaf3f9")
        
        
       
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        updateDashboard(notification: nil)
//        graphView1.frame = overviewContainer.frame
//        graphView2.frame = topLeftContainer.frame
//        graphView3.frame = bottomRightContainer.frame
//        graphView4.frame = bottomLeftContainer.frame
        
    }
   
    
    func removeGraphViews() {
        graphView1.removeFromSuperview()
        graphView2.removeFromSuperview()
        graphView3.removeFromSuperview()
        graphView4.removeFromSuperview()
    }
    

    @objc func updateDashboard(notification: Notification?) {
        print("dillion")
        
        print(OptionsController.viewsGraphTypes)
         graphView1.graphColor = graphColorsDecoder[OptionsController.viewsColorsArray[0]]
         graphView2.graphColor = graphColorsDecoder[OptionsController.viewsColorsArray[1]]
         graphView3.graphColor = graphColorsDecoder[OptionsController.viewsColorsArray[2]]
         graphView4.graphColor = graphColorsDecoder[OptionsController.viewsColorsArray[3]]
        
         graphView1.type = graphTypesDecoder[OptionsController.viewsGraphTypes[0]]
         graphView2.type = graphTypesDecoder[OptionsController.viewsGraphTypes[1]]
         graphView3.type = graphTypesDecoder[OptionsController.viewsGraphTypes[2]]
         graphView4.type = graphTypesDecoder[OptionsController.viewsGraphTypes[3]]
        
        
        var graphViews: [GraphView] = []
        
        OptionsController.viewsArray.sort(by: { $0 < $1 })
        
        var i = 0
        while i < OptionsController.viewsArray.count {
            if OptionsController.viewsArray[i] == 1
            {
            graphViews.append(graphView1)
            }
            if OptionsController.viewsArray[i] == 2
            {
            graphViews.append(graphView2)
            }
            if OptionsController.viewsArray[i] == 3
            {
            graphViews.append(graphView3)
            }
            if OptionsController.viewsArray[i] == 4
            {
            graphViews.append(graphView4)
            }
            i = i + 1
        }
        
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(goToFullScreen))
//        
//        i = 0
//       while i < graphViews.count
//       {
//        graphViews[i].addGestureRecognizer(gesture)
//        i = i + 1
//       }
        
        switch graphViews.count {
        case 0:
            removeGraphViews()
        case 1:
            removeGraphViews()
            view.addSubview(graphViews[0])
            graphViews[0].frame = singleContainer.frame
        case 2:
            removeGraphViews()
             view.addSubview(graphViews[0])
             view.addSubview(graphViews[1])
            graphViews[0].frame = topContainer.frame
            graphViews[1].frame = bottomContainer.frame
        case 3:
            removeGraphViews()
             view.addSubview(graphViews[0])
             view.addSubview(graphViews[1])
             view.addSubview(graphViews[2])
            graphViews[0].frame = topRightContainer.frame
            graphViews[1].frame = topLeftContainer.frame
            graphViews[2].frame = bottomContainer.frame
        case 4:
            removeGraphViews()
             view.addSubview(graphViews[0])
             view.addSubview(graphViews[1])
             view.addSubview(graphViews[2])
             view.addSubview(graphViews[3])
            graphViews[0].frame = topRightContainer.frame
            graphViews[1].frame = topLeftContainer.frame
            graphViews[2].frame = bottomLeftContainer.frame
            graphViews[3].frame = bottomRightContainer.frame
        default:
            print("error")
        }
        
        
    }
    
    @objc func goToFullScreen(_ gesture: UIGestureRecognizer) {
    
        UIView.animate(withDuration: 0.4, animations: {self.graphView1.bounds = self.singleContainer.bounds
            self.view.layoutIfNeeded()
        })
        
        
    
    
    }
    
    
    @objc func update() {
        if alternate {
        UIView.animate(withDuration:1, animations: {self.graphView1.frame = self.bottomContainer.frame})
        alternate = false
        }
        else
        {
             UIView.animate(withDuration: 1, animations: {self.graphView1.frame = self.topContainer.frame})
            alternate = true
        }
        
    }
    
    
    
    
    @objc func rotated() {
        //setupViews2()
//        graphView1.frame = topRightContainer.frame
//        graphView2.frame = topLeftContainer.frame
//        graphView3.frame = bottomRightContainer.frame
//        graphView4.frame = bottomLeftContainer.frame
        
    }
    
    
}


