//
//  DevicesController.swift
//  Dashboard 2
//
//  Created by John Allen on 5/20/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class DevicesController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate  {
    
     var peerIDS: [MCPeerID] = []
    var peerID: MCPeerID!
    //var peerIDS: 
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    var numDevices: Int {
        get {
            return mcSession.connectedPeers.count
        }
    }
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    
    var deviceNames: [String] = ["", "", ""]
    var batteryLevels: [String] = ["", "", ""]
    var batteryStates: [String] = ["", "", ""]
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Connect"
        view.textAlignment = .center
        view.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30)
        return view
    }()
    
    let topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneConnectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Iphone", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showConnectivity), for: .touchUpInside)
        return button
    }()
    
    let wearableConnectButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Wearable", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.textColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(connectWearable), for: .touchUpInside)
        return button
    }()
    
    
    let connectedLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Connect"
         view.textAlignment = .left
        view.font = UIFont(name: "AppleSDGothicNeo-Medium " , size: 20)
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var deviceViews: [DeviceView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let underlineAttriString = NSAttributedString(string:"Connected Devices", attributes:
            [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        connectedLabel.attributedText = underlineAttriString
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        
        
        setupViews()
    }

    
    
    func setupViews() {
        
        view.addSubview(titleLabel)
        view.addSubview(topContainer)
        view.addSubview(connectedLabel)
        view.addSubview(stackView)
        topContainer.addSubview(phoneConnectButton)
        topContainer.addSubview(wearableConnectButton)

        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
            ])
        
        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            topContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
            ])
        
        
        NSLayoutConstraint.activate([
            phoneConnectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -150),
           phoneConnectButton.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor),
           phoneConnectButton.widthAnchor.constraint(equalToConstant: 150),
            phoneConnectButton.heightAnchor.constraint(equalToConstant: 75)
//            phoneConnectButton.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.2),
//            phoneConnectButton.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.5)
            ])
        
        NSLayoutConstraint.activate([
            wearableConnectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 150),
            wearableConnectButton.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor),
            wearableConnectButton.widthAnchor.constraint(equalToConstant: 150),
            wearableConnectButton.heightAnchor.constraint(equalToConstant: 75)
//            wearableConnectButton.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.2),
//            wearableConnectButton.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 0.5)
            ])
        
        
        
        NSLayoutConstraint.activate([
            connectedLabel.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 0),
            connectedLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            connectedLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            connectedLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
            ])
        
        
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: connectedLabel.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
            ])
        
        

    }
    
}
    
    