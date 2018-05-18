//
//  actualPickerCell.swift
//  Dashboard 2
//
//  Created by John Allen on 5/17/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//


import UIKit

class actualPickerCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    let pickerView: UIPickerView = {
    let view = UIPickerView()
        view.backgroundColor = UIColor.lightGray
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
    }()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "hey"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        return UIImageView(image: UIImage(named: "hello"))
//    }
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.selectionStyle = .none
        contentView.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        NSLayoutConstraint.activate([
            pickerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            pickerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            pickerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            pickerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
