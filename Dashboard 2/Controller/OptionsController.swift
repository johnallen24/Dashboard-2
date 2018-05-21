//
//  OptionsController.swift
//  Dashboard 2
//
//  Created by John Allen on 5/16/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//

import UIKit


class OptionsController: UIViewController, UITableViewDelegate, UITableViewDataSource, CustomCellDelegate, UIPickerViewDelegate, UIPickerViewDataSource, PickerCellDelegate{
    
    
    
    
    
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
        tableView.register(actualPickerCell.self, forCellReuseIdentifier: "cell3")
    }
    
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
        print("hwq")
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
    
    //var colorsArray = [
    
    func updateDashboard()
    {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updateDashboard"), object: nil)
    }
    
    func pickerChanged(cell: actualPickerCell) {
        print("tom")
        let pickerRow = cell.pickerView.selectedRow(inComponent: 0)
        let indexPath = self.tableView.indexPathForRow(at: cell.center)!
        print("This is the indexPath \(indexPath)")
        if (indexPath.row == 2) {
        let section = indexPath.section
        OptionsController.viewsGraphTypes[section] = pickerRow
        updateDashboard()
        }
        
        if (indexPath.row == 3) {
        let section = indexPath.section
        OptionsController.viewsColorsArray[section] = pickerRow
        updateDashboard()
        }
    }
    
    static var viewsArray: [Int] = [1,2,3,4]
    
    static var viewsColorsArray = [0,1,2,3]
    
    static var viewsGraphTypes = [0,0,0,0]

    var insertionIndexPath: IndexPath?
    
    
    func deleteRow(at _path: IndexPath) {
        tableView.deleteRows(at: [_path], with: .fade)
        insertionIndexPath = nil
        
    }
    
    func addRow(at _path: IndexPath, withExtra: Bool) {
        if withExtra {
            let row = _path.row + 1
            let section = _path.section
            let path = IndexPath(row: row, section: section)
            tableView.insertRows(at: [path], with: .fade)
            insertionIndexPath = path
        }
        else {
           
            tableView.insertRows(at: [_path], with: .fade)
            insertionIndexPath = _path
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       print(insertionIndexPath)
        
        if let path = insertionIndexPath {
            
            
            if (path.row == (1 + indexPath.row) && path.section == indexPath.section)
            {
                switch indexPath.section {
                case 0:
                    numRowsS0 = numRowsS0 - 1
                case 1:
                    numRowsS1 = numRowsS1 - 1
                case 2:
                    numRowsS2 = numRowsS2 - 1
                case 3:
                    numRowsS3 = numRowsS3 - 1
                default:
                    break
                }
                tableView.beginUpdates()
                deleteRow(at: path)
                tableView.endUpdates()
                tableView.deselectRow(at: indexPath, animated: true)
            }
                
            else {
                
                switch path.section {
                case 0:
                    print("joe")
                    numRowsS0 = numRowsS0 - 1
                case 1:
                    numRowsS1 = numRowsS1 - 1
                case 2:
                    numRowsS2 = numRowsS2 - 1
                case 3:
                    numRowsS3 = numRowsS3 - 1
                default:
                    break
                }
                
                switch indexPath.section {
                case 0:
                    numRowsS0 = numRowsS0 + 1
                case 1:
                    numRowsS1 = numRowsS1 + 1
                case 2:
                    numRowsS2 = numRowsS2 + 1
                case 3:
                    numRowsS3 = numRowsS3 + 1
                default:
                    break
                }
                
                if indexPath.section == path.section {
                if  indexPath.row > path.row {
                    tableView.beginUpdates()
                    deleteRow(at: path)
                    addRow(at: indexPath, withExtra: false)
                    tableView.endUpdates()
                    
                }
                else {
                    tableView.beginUpdates()
                    deleteRow(at: path)
                    addRow(at: indexPath, withExtra: true)
                    tableView.endUpdates()
                    }
                }
                else {
                    print("bob")
                    tableView.beginUpdates()
                    deleteRow(at: path)
                    addRow(at: indexPath, withExtra: true)
                    tableView.endUpdates()
                }
                
                
                
            }
        }
            
        else {
            switch indexPath.section {
            case 0:
                numRowsS0 = numRowsS0 + 1
            case 1:
                numRowsS1 = numRowsS1 + 1
            case 2:
                numRowsS2 = numRowsS2 + 1
            case 3:
                numRowsS3 = numRowsS3 + 1
            default:
                break
            }
            tableView.beginUpdates()
            addRow(at: indexPath, withExtra: true)
            tableView.endUpdates()
            
        }
        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if let path = insertionIndexPath
        {
            if path == indexPath
            {
                return 150
            }
       
        }
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("hello")
        
        if let path = insertionIndexPath
        {
            if path == indexPath
            {
                return nil
            }
            
        }
        
        if (indexPath.row != 0)
        {
            return indexPath
        }
        
        
        return nil
    }
    
//    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    
//        if(true)
//        {
//            if(true)
//            {
//                let path = IndexPath(row: 4, section: 0)
//                self.toggle = 1;
//                numRows = numRows + 1
//                tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
////                tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.bottom)
////                bringUpPickerViewWithRow(indexPath: indexPath)
//            }
//            else
//            {
//                self.toggle = 0;
////                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:YES];
////                [self hidePickerView];
//            }
//        }
    
    
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
    

    var addedSection = 1
    var numRowsS0 = 3
    var numRowsS1 = 3
    var numRowsS2 = 3
    var numRowsS3 = 3
    var numarray = ["hey", "hey", "hey"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return numRowsS0
        case 1:
            return numRowsS1
        case 2:
            return numRowsS2
        case 3:
            return numRowsS3
        default:
            return 3
        }
        
    }
    
    var tagNumber = 1
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let path = insertionIndexPath {
            
            if path == indexPath {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! actualPickerCell
                cell.delegate = self
                if indexPath.row == 2 {
                cell.type = .graph
                return cell
                }
                if indexPath.row == 3{
                cell.type = .color
                return cell
                }
            }
            
        }
        
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
