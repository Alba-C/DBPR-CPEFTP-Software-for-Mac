//
//  reportsVC.swift
//  DBPR Upload Tool
//
//  Created by CHRISTOPHER ALBANESE on 3/29/18.
//  Copyright © 2018 CHRISTOPHER ALBANESE. All rights reserved.
//

import Cocoa

class reportsVC: NSViewController {
    
     let defaults = UserDefaults.standard
    override func viewWillLayout() {
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//         defaults.string(forKey: "providerEmailDef")
        // Do view setup here.
      
        loadDefaults()
        setupOccList()
        setupCourseList()
        buildOccPopUp()
        buildCoursePopUp()
        
    }
    override func viewWillAppear() {
        
        loadDefaults()
        setupOccList()
        setupCourseList()
        buildOccPopUp()
        buildCoursePopUp()
        lblProviderBum.stringValue = pNum
        lblProviderName.stringValue = PName
        lblPassCode.stringValue = pCode
    }
    func loadDefaults() {
        
        code = defaults.array(forKey: "codeDefaults")!
        name = defaults.array(forKey: "nameDefaults")!
        courseNum = defaults.array(forKey: "courseNumDefaults")!
        courseName = defaults.array(forKey: "courseNameDefaults")!
        pNum = defaults.string(forKey: "providerNumDef")!
        PName = defaults.string(forKey: "providerNameDef")!
        pCode = defaults.string(forKey: "passCodeDef")!
        print(code)
        print(courseNum)
    }

    
    
    @IBOutlet weak var lblProviderBum: NSTextField!
    
    @IBOutlet weak var lblProviderName: NSTextField!
    @IBOutlet weak var lblPassCode: NSTextField!
    
    @IBOutlet weak var coursePopUp: NSPopUpButton!
    @IBOutlet weak var occupationPopUp: NSPopUpButton!
   
    @IBOutlet weak var tfLicenseNumber: NSTextField!
    @IBOutlet weak var tfFirstName: NSTextField!
    @IBOutlet weak var tfMiddleInitial: NSTextField!
    @IBOutlet weak var tfLastName: NSTextField!
    @IBOutlet weak var tfNumLicenses: NSTextField!
    @IBOutlet weak var tfDate: NSDatePicker!
    
    var pNum = ""
    var PName = ""
    var pCode = ""
    var licNum = ""
    var firstName = ""
    var midInit = ""
    var lastName = ""
    var numOfLicenses = 0
    var code = [Any]()
    var name = [Any]()
    var courseNum = [Any]()
    var courseName = [Any]()
    var created = [String]()
    var occArr = [String]()
    var courseArr = [String]()
    var reportStep = 0
    
    @IBAction func btnAddProvider(_ sender: NSButton) {
    }
    
    @IBAction func btnAddCourse(_ sender: NSButton) {
    }
    @IBAction func btnAddCode(_ sender: NSButton) {
    }
    @IBAction func btnAddStudent(_ sender: NSButton) {
    }
    @IBAction func btnEndOfRecord(_ sender: NSButton) {
        savedata(value: testString)
    
    }
    
    func mergeArr(code: String, name: String) {
        let newItem = "\(code)  \(name)"
        occArr.append(newItem)
    }
    
    func setupOccList() {
        occArr = [String]()
        print(code.count)
        for i in 0...(code.count-1) {
            mergeArr(code: code[i] as! String, name: name[i] as! String)
        }
    }
    
//    func mergeCourseArr(number: String, name: String) {
//        let newCourse = "\(number)  \(name)"        //courseArr.append(newCourse);
//    }

    func setupCourseList() {
        courseArr = [String]()
        print(courseNum.count)
        for i in 0...(courseNum.count-1) {
//            mergeCourseArr(number: courseNum[i] as! String, name: courseName[i] as! String)
            let newCourse = "\(courseNum[i])  \(courseName[i])"
            courseArr.append(newCourse);
        }
        print(courseArr)
        
    }
    
    func buildOccPopUp() {
        occupationPopUp.removeAllItems()
        occupationPopUp.addItems(withTitles: occArr)
       // occupationPopUp.target = self
      //  occupationPopUp.action = "myOccPopUpButtonWasSelected:"
        
    }
    func buildCoursePopUp() {
        coursePopUp.removeAllItems()
        coursePopUp.addItems(withTitles: courseArr)
        // coursePopUp = self
        //  coursePopUp.action = "mycoursePopUpButtonWasSelected:"
        
    }
    var testString = "Hello World"
    func savedata (value: String){
        
        
        let fileName = "Test"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
        print("FilePath: \(fileURL.path)")
        
        let writeString = NSString(string: value)
        do {
            // Write to the file
            try writeString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8.rawValue)
        } catch let error as NSError {
            print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
        }
    }
    
    func addStudent() {
        licNum = tfLicenseNumber.stringValue
        firstName = tfFirstName.stringValue
        midInit = tfMiddleInitial.stringValue
        lastName = tfMiddleInitial.stringValue
        
    }
    
    
}
