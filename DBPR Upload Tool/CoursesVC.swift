//
//  CoursesVC.swift
//  DBPR Upload Tool
//
//  Created by CHRISTOPHER ALBANESE on 4/4/18.
//  Copyright © 2018 CHRISTOPHER ALBANESE. All rights reserved.
//

import Cocoa

class CoursesVC: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
let defaults = UserDefaults.standard
    
    override func viewWillAppear() {
        loadDefaults()
        setupCourseList()
    }
    override func viewDidLayout() {
        coursesTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    @IBOutlet weak var tfCourseNumber: NSTextField!
    @IBOutlet weak var tfCourseName: NSTextField!
    @IBOutlet weak var coursesTable: NSTableView!
    
    var number = [Any]()
    var name = [Any]()
    var created = [[String:String]]()
    func loadDefaults() {
        
        number = defaults.array(forKey: "courseNumDefaults")!
        name = defaults.array(forKey: "courseNameDefaults")!
    }
    
    @IBAction func btnAddCourse(_ sender: NSButton) {
        addCourse()
        coursesTable.reloadData()
    }
    @IBAction func btnDeleteCourse(_ sender: NSButton) {
    }
    func addCourse() {
        let courseNum = tfCourseNumber.stringValue
        let courseName = tfCourseName.stringValue
        let newCourse = ["number":courseNum, "name":courseName]
        
        if courseNum != "" && courseName != "" {
            number.append(courseNum)
            defaults.set(number, forKey: "courseNumDefaults")
            name.append(courseName)
            defaults.set(name, forKey: "courseNameDefaults")
            
            setupCourseList()
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
}
