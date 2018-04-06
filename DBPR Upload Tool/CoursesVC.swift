//
//  CoursesVC.swift
//  DBPR Upload Tool
//
//  Created by CHRISTOPHER ALBANESE on 4/4/18.
//  Copyright © 2018 CHRISTOPHER ALBANESE. All rights reserved.
//

import Cocoa

class CoursesVC: NSViewController, NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate {
let defaults = UserDefaults.standard
    
    override func viewWillAppear() {
        number = []
        name = []
//        defaults.removeObject(forKey: "courseNumDefaults")
//        defaults.removeObject(forKey: "courseNameDefaults")
        defaults.removeObject(forKey: "courseDefaults")
      //  loadDefaults()
        
      //  setupCourseList()
        
    }
    override func viewDidLayout() {
      //  loadDefaults()
        coursesTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        loadDefaults()
    }
    @IBOutlet weak var tfCourseNumber: NSTextField!
    @IBOutlet weak var tfCourseName: NSTextField!
    @IBOutlet weak var coursesTable: NSTableView!
    
    var number = [Any]()
    var name = [Any]()
    var created = [[String:String]]()
    var courseArr: [[String: Any]] = []
    var selectedIndex = Int()
//    var courseDefaults: [[String: Any]] = []
    func loadDefaults() {
        print("loadDefaults called")
      //  number = defaults.array(forKey: "courseNumDefaults")!
      //  name = defaults.array(forKey: "courseNameDefaults")!
       //
        if let courseDefaults = defaults.array(forKey: "coursesDefaults")  {
            print("defaults loaded")
            created = courseDefaults as! [[String : String]]
        } else {created.append(["number":"", "name":""])}
        coursesTable.reloadData()
    }
    
    @IBAction func btnAddCourse(_ sender: NSButton) {
        addCourse()
        coursesTable.reloadData()
    }
    @IBAction func btnDeleteCourse(_ sender: NSButton) {
        created.remove(at: selectedIndex)
        created = created.sorted(by: { $0["name"]! < $1["name"]! })
        defaults.set(created, forKey: "coursesDefaults")
        coursesTable.reloadData()
    }
    
    
    
    func addCourse() {
        let courseNum = tfCourseNumber.stringValue.uppercased().replacingOccurrences(of: "-", with: " ")
        let courseName = tfCourseName.stringValue.uppercased().replacingOccurrences(of: "-", with: " ")
        let newCourse = ["number":courseNum, "name":courseName]
        
        if courseNum != "" && courseName != "" {
            created.append(newCourse)
            created = created.sorted(by: { $0["name"]! < $1["name"]! })
            defaults.set(created, forKey: "coursesDefaults")
//            number.append(courseNum)
//            defaults.set(number, forKey: "courseNumDefaults")
//            name.append(courseName)
//            defaults.set(name, forKey: "courseNameDefaults")
            
           // setupCourseList()
            print("Created = ", created)
            print(courseNum, courseName, newCourse)
            tfCourseNumber.stringValue = ""
            tfCourseName.stringValue = ""
            
        }
    }
        
        func mergeArr(number: String, name: String) {
            let newItem = ["number":number, "name":name]
            created.append(newItem)
        }
        
        func setupCourseList() {
            created = [[String:String]]()
            print(number.count)
            for i in 0...(number.count-1) {
                mergeArr(number: number[i] as! String, name: name[i] as! String)
            }
        }
    
   
    
    func numberOfRows(in occTableView: NSTableView) -> Int {
        //       return beginOoccupations.count
        return created.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        var result:NSTableCellView
        result  = tableView.makeView(withIdentifier: (tableColumn?.identifier)!, owner: self) as! NSTableCellView
        result.textField?.stringValue = created[row][(tableColumn?.identifier.rawValue)!]!
        return result
    }
    override func controlTextDidChange(_ obj: Notification) {
        print("textChanged")
        if tfCourseNumber.stringValue.count == 8 { runMyAlert(alertMessage: "Course Number Must Be 7 Digits Only")}
        if tfCourseName.stringValue.count > 60 {runMyAlert(alertMessage: "Course Name Must Be Less Than 60 Characters")}
        let characterSet: NSCharacterSet = NSCharacterSet(charactersIn: " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789-").inverted as NSCharacterSet
        let numberSet: NSCharacterSet = NSCharacterSet(charactersIn: "0123456789").inverted as NSCharacterSet
        self.tfCourseName.stringValue =  (self.tfCourseName.stringValue.components(separatedBy: characterSet as CharacterSet) as NSArray).componentsJoined(by: "").uppercased()
        self.tfCourseNumber.stringValue = (self.tfCourseNumber.stringValue.components(separatedBy: numberSet as CharacterSet) as NSArray).componentsJoined(by: "")
    }

    func runMyAlert( alertMessage: String){
        
        //var myWindow = NSWindow.self
        let alert = NSAlert()
        alert.messageText = "FORMAT ERROR"
        alert.addButton(withTitle: "OK")
        alert.informativeText = alertMessage
        alert.runModal()
    }
   
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        print("selected row = ", coursesTable.selectedRow)
        print("selected column = ",  coursesTable.selectedColumn)
        selectedIndex = coursesTable.selectedRow
        if coursesTable.selectedRow == -1 {
            if coursesTable.selectedColumn == 0 {
                created = created.sorted(by: { $0["number"]! < $1["number"]! })
            } else {
                created = created.sorted(by: { $0["name"]! < $1["name"]! })
            }
            coursesTable.reloadData()
        }
    }
        
}
