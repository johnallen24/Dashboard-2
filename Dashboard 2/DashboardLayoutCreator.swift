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
        
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        
//        peerID = MCPeerID(displayName: UIDevice.current.name)
//        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
//        mcSession.delegate = self
//
        view.backgroundColor = colorWithHexString(hexString: "#eaf3f9") //f0f0f0 4d4b4e e3e3e5
        //view.setGradientBackground(colorOne: colorWithHexString(hexString: "f0f0f0"), colorTwo: colorWithHexString(hexString: "4d4b4e"))
        initialSetup()
    }
    
    
    
}


