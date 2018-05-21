//
//  DeviceView .swift
//  Dashboard 2
//
//  Created by John Allen on 5/20/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit

class DeviceView: UIView {
    
    
    let nameLabel: UILabel = {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.textAlignment = .center
    view.font = UIFont.boldSystemFont(ofSize: 24)
    return view
    }()
    
    let phoneImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let deviceInfoTextView: UITextView = {
    let view = UITextView()
    view.textAlignment = .center
    view.font = UIFont.boldSystemFont(ofSize: 20)//(name: "AppleSDGothicNeo-Medium ", size: 20)
    view.isScrollEnabled = false
    view.isEditable = false
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        setupViews()
    }
    
    func setupViews() {
        
        self.addSubview(nameLabel)
        self.addSubview(phoneImageView)
        self.addSubview(deviceInfoTextView)
        
     

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
            ])
        
        NSLayoutConstraint.activate([
            phoneImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            phoneImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            phoneImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            phoneImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7)
            ])
        
        deviceInfoTextView.contentInset = UIEdgeInsetsMake(-25,0.0,0,0.0);
       
        NSLayoutConstraint.activate([
            deviceInfoTextView.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor, constant: 0),
            deviceInfoTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            deviceInfoTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            deviceInfoTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
            ])
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
