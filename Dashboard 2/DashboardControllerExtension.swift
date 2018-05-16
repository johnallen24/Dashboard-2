//
//  DashboardControllerExtension.swift
//  Dashboard 2
//
//  Created by John Allen on 5/15/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit
import MultipeerConnectivity

extension dashBoardController: MCSessionDelegate, MCBrowserViewControllerDelegate {
    
    
    
    @IBAction func showConnectivity(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Battery Level Exchange" , message: "Do you want to host or join a session?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Host Session", style: .default, handler: {(action:UIAlertAction) in self.startHosting()}))
        
        actionSheet.addAction(UIAlertAction(title: "Join Session", style: .default, handler: {(action:UIAlertAction) in self.joinSession()}))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if let popoverController = actionSheet.popoverPresentationController {
            
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        self.present(actionSheet, animated: true, completion: nil)
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
            print("Connected: \(peerID.displayName)")
            
            
        case MCSessionState.connecting:
            print("Connecting: \(peerID.displayName)")
            
        case MCSessionState.notConnected:
            print("Not Connected: \(peerID.displayName)")
        }
    }
    

    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let returnData = String(data: data, encoding: .utf8){
            DispatchQueue.main.async { [unowned self] in
                //self.graphView1.titleLabel.text = "Battery Level: \(returnData)"
                self.graphView1.update(number: Double(returnData)!)
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
        
        dismiss(animated: true, completion: nil)
        if (mcSession.connectedPeers.count > 0)
        {
            setupTopContainer()
            UIView.animate(withDuration: 0.4, animations: {self.view.layoutIfNeeded()
                
            })
        
        }
        
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }
}
