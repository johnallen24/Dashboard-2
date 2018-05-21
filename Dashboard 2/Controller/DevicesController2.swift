//
//  DevicesController2.swift
//  Dashboard 2
//
//  Created by John Allen on 5/21/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import MultipeerConnectivity

extension DevicesController {
    
    func setupConnectedDevices() {
        let view = DeviceView()
        view.nameLabel.text = deviceNames[numDevices - 1]
        view.deviceInfoTextView.text = "Battery Level: \(batteryLevels[numDevices - 1])\nIs Connected: \(batteryStates[numDevices - 1])"
        view.phoneImageView.image = UIImage(named: "Iphone 8")
        deviceViews.append(view)
        stackView.removeArrangedSubview(view1)
        stackView.insertArrangedSubview(deviceViews[deviceViews.count - 1], at: 0)
    }
    
    func createDeviceView() -> UIView {
        
        var view = DeviceView()
        return view
        
        
    }
    
    @objc func connectWearable() {
        
    }
    
    @objc func showConnectivity(_ sender: UIButton) {
        self.joinSession()
    }
    
    func startHosting() {
        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "hws-kb", discoveryInfo: nil, session: mcSession)
        mcAdvertiserAssistant.start()
    }
    
    
    func joinSession() {
        let mcBrowser = MCBrowserViewController(serviceType: "hws-kb", session: self.mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }
    
    
   
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case MCSessionState.connected:
            peerIDS.append(peerID)
            
        case MCSessionState.connecting:
            print("Connecting: \(peerID.displayName)")
            
        case MCSessionState.notConnected:
            print("Not Connected: \(peerID.displayName)")
        }
    }
    
    
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let dictionary = NSKeyedUnarchiver.unarchiveObject(with: data) as! Dictionary<String, String>
        DispatchQueue.main.async { [unowned self] in
            
            var i = 0
            while i < self.peerIDS.count
            {
                if let name = dictionary["name"] {
                    print(name)
                    self.deviceNames[i] = name
                }
                
                if let level = dictionary["level"] {
                    print(level)
                    self.batteryLevels[i] = level
                }
                
                if let batteryState = dictionary["batteryState"] {
                    let num = Int(batteryState)
                    if num == 1 {
                        self.batteryStates[i] = "No"
                    }
                    else if num == 2 || num == 3 {
                        self.batteryStates[i] = "Yes"
                    }
                    else {
                        self.batteryStates[i] = "Unknown"
                    }
                    
                }
                
                
                
            }
            
            if let name = dictionary["name"] {
                print(name)
                self.deviceNames[self.numDevices - 1] = name
            }
            
            if let level = dictionary["level"] {
                print(level)
                self.batteryLevels[self.numDevices - 1] = level
            }
            
            if let batteryState = dictionary["batteryState"] {
                let num = Int(batteryState)
                if num == 1 {
                    self.batteryStates[self.numDevices-1] = "No"
                }
                else if num == 2 || num == 3 {
                    self.batteryStates[self.numDevices-1] = "Yes"
                }
                else {
                    self.batteryStates[self.numDevices-1] = "Unknown"
                }
                
            }
            
            
        }
        
    }
    
    
    
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        
        if mcSession.connectedPeers.count > 0 {
            setupConnectedDevices()
        }
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }
}




