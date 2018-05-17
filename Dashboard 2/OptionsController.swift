//
//  OptionsController.swift
//  Dashboard 2
//
//  Created by John Allen on 5/16/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit


class OptionsController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "hey"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.toggle = 0
        tableView.reloadData()
        
    }
    
    func switchChanged(cell: switchCell) {
        let indexPath = self.tableView.indexPathForRow(at: cell.center)!
        let section = indexPath.section
        if cell.switchButton.isOn {
            OptionsController.viewsArray.append(section+1)
        }
        else {
            var i = 0
            while i < 4
            {
                if (section+1) == OptionsController.viewsArray[i]
                {
                    OptionsController.viewsArray.remove(at: i)
                    break
                }
                i = i + 1
            }
        }
        print(OptionsController.viewsArray)
        updateDashboard()
    }
    
    func updateDashboard()
    {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updateDashboard"), object: nil)
    }
    
    static var viewsArray: [Int] = [1,2,3,4]
    
//    func calculateViews() {
//
//        viewsArray = []
//        var i = 0
//
//        while i < 3
//        {
//            let indexpath = NSIndexPath(row: 0, section: i)
//            let cell = tableView.cellForRow(at: indexpath as IndexPath)! as! switchCell
//
//            print(cell)
//            if cell.switchButton.isOn
//            {
//                viewsArray.append(i)
//            }
//            i = i + 1
//        }
//
//        print(viewsArray.count)
//    }
//
//
    
    let tableView: UITableView = {
        let view = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        view.isScrollEnabled = true
        view.allowsSelection = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pickerView: UIPickerView = {
        let view = UIPickerView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    let sectionHeader: UILabel = {
    let view = UILabel()
    //view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "hello"
    return view
    }()
    
    var toggle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        view.addSubview(tableView)
        view.addSubview(pickerView)
        
        pickerView.frame = CGRect(x: 0, y: 0, width: 320, height: 480)
        pickerView.center = CGPoint(x: 160, y: 640)
        pickerView.delegate = self
        pickerView.dataSource = self
        //pickerView.center = (CGPoint){160, 640};
        pickerView.isHidden = true
        
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0)
            ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(switchCell.self, forCellReuseIdentifier: "cell")
        tableView.register(pickerCell.self, forCellReuseIdentifier: "cell2")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(true)
        {
            if(true)
            {
                self.toggle = 1;
                tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
                bringUpPickerViewWithRow(indexPath: indexPath)
            }
            else
            {
                self.toggle = 0;
//                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
//                [self hidePickerView];
            }
        }
    }
    
    func bringUpPickerViewWithRow(indexPath: IndexPath) {
        
        var currentCellSelected = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations:
            {self.pickerView.isHidden = false
                self.pickerView.center = CGPoint(x: (currentCellSelected?.frame.size.width)!/2, y: self.tableView.frame.origin.y + (currentCellSelected?.frame.size.height)!*4)
        }, completion: nil)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
     func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
    }
    
    var headerTitles = ["Iphone Battery Level"," Iphone Voltage","Wearable Battery Level", "Wearable Voltage"]
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
    
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return ["Battery Voltage","Battery Voltage","Battery Voltage"]
//    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    var tagNumber = 1
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0)
        {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! switchCell
        cell.delegate = self
        //cell.label.text = "hey"
        cell.switchButton.isOn = true
        cell.tag = tagNumber
        tagNumber = tagNumber + 1
        return cell
        }
        else if (indexPath.row == 1)
        {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! pickerCell
            cell.leftLabel.text = "Graph Type"
            cell.rightLabel.text = "Choose Graph >"
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! pickerCell
            cell.leftLabel.text = "Color"
            cell.rightLabel.text = "Choose Color >"
            return cell
        }
       
    }
    
}
