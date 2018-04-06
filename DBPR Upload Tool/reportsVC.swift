//
//  reportsVC.swift
//  DBPR Upload Tool
//
//  Created by CHRISTOPHER ALBANESE on 3/29/18.
//  Copyright © 2018 CHRISTOPHER ALBANESE. All rights reserved.
//

import Cocoa

class reportsVC: NSViewController , NSDatePickerCellDelegate, NSTextFieldDelegate {
    
     let defaults = UserDefaults.standard
    override func viewWillLayout() {
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarPicker.dateValue = Date()
        tfDate.placeholderString = dateFormatter()
        print("load dateFormatter()",dateFormatter())
//         defaults.string(forKey: "providerEmailDef")
        // Do view setup here.
      
      //  loadDefaults()
//        setupOccList()
//        setupCourseList()
//        buildOccPopUp()
//        buildCoursePopUp()
        
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
        if let loadCourses = defaults.array(forKey: "coursesDefaults") {courses = loadCourses as! [[String : String]] } else {courses.append(["number":"###", "name":"add courses on COURSES tab"])}
//        courseName = defaults.array(forKey: "courseNameDefaults")!
        pNum = defaults.string(forKey: "providerNumDef")!
        PName = defaults.string(forKey: "providerNameDef")!
        pCode = defaults.string(forKey: "passCodeDef")!
        print(code)
        print(courses)
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
    
   
    @IBAction func btnShowCalendar(_ sender: NSButton) {
        print("clicked")
        calendarView.isHidden = false
    }
   
    @IBOutlet weak var tfDate: NSTextField!
    @IBOutlet weak var calendarView: NSView!
    
    @IBOutlet weak var calendarPicker: NSDatePicker!
  
    @IBAction func clickDate(_ sender: NSDatePicker) {
        print(calendarPicker.dateValue)
       
        tfDate.stringValue = dateFormatter()
        calendarView.isHidden = true
    
    }
 
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
    var courses = [[String:String]]()
    var courseName = [Any]()
    var courseDate = String()
    var created = [String]()
    var occArr = [String]()
    var courseArr = [String]()
    var reportStep = 0
    
    @IBOutlet var ibDateFormatter: DateFormatter!
    @IBAction func btnAddProvider(_ sender: NSButton) {
    }
    
    @IBAction func btnAddCourse(_ sender: NSButton) {
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
        print(courses.count)
        for element in courses {
            let newCourse = "\(element["number"]  ?? "###")    \(element["name"] ?? "Add courses on Courses Tab")"
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
    func numberFormatter(numString: String) -> String {
        let nsNumber = NSNumber(value: Int(numString)!)
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 7
        numberFormatter.maximumIntegerDigits = 7
        numberFormatter.paddingPosition = .beforePrefix
        numberFormatter.paddingCharacter = "0"
        let formattedNum = numberFormatter.string(from: nsNumber)
        return formattedNum!
    }
    func dateFormatter() -> String {
        let date = calendarPicker.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        print("Custom date  =  \(dateString)")
        return dateString
    }
    
    func dateToDate(date: Date) -> Date {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        let dateDate = dateFormatter.date(from: dateString)
        print("dateDate = \(dateDate)")
        return dateDate!
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        if tfDate.stringValue.count > 0 {
            isValidDate(dateString: tfDate.stringValue)
            
        }
        if tfLicenseNumber.stringValue.count > 0 {
            tfLicenseNumber.stringValue = numberFormatter(numString: tfLicenseNumber.stringValue)
            
        }
        
    }
    override func controlTextDidChange(_ obj: Notification) {
        print("textChanged")
        if tfLicenseNumber.stringValue.count > 7 { runMyAlert(alertMessage: "License Number Must Be 7 Or Fewer Digits")}
        
        let dateSet: NSCharacterSet = NSCharacterSet(charactersIn: "0123456789/").inverted as NSCharacterSet
        let numberSet: NSCharacterSet = NSCharacterSet(charactersIn: "0123456789").inverted as NSCharacterSet
         self.tfDate.stringValue =  (self.tfDate.stringValue.components(separatedBy: dateSet as CharacterSet) as NSArray).componentsJoined(by: "")
        self.tfLicenseNumber.stringValue =  (self.tfLicenseNumber.stringValue.components(separatedBy: numberSet as CharacterSet) as NSArray).componentsJoined(by: "")
        self.tfNumLicenses.stringValue =  (self.tfNumLicenses.stringValue.components(separatedBy: numberSet as CharacterSet) as NSArray).componentsJoined(by: "")
        
        self.tfFirstName.stringValue =   tfFirstName.stringValue.uppercased()
        self.tfMiddleInitial.stringValue =   tfMiddleInitial.stringValue.uppercased()
        self.tfLastName.stringValue =   tfLastName.stringValue.uppercased()
        
        
    }
    
    func runMyAlert( alertMessage: String){
        
        //var myWindow = NSWindow.self
        let alert = NSAlert()
        alert.messageText = "FORMAT ERROR"
        alert.addButton(withTitle: "OK")
        alert.informativeText = alertMessage
        alert.runModal()
    }
    
    func isValidDate(dateString: String) -> Bool {
        let dateFormatterGet = DateFormatter()
        
        dateFormatterGet.dateFormat = "MM/dd/yyyy"
        if dateFormatterGet.date(from: dateString) != nil {
            calendarView.isHidden = true

            //date parsing succeeded, if you need to do additional logic, replace _ with some variable name i.e date
            if tfDate.stringValue.count != 10 {
                runMyAlert(alertMessage: "Date format should be mm/dd/yyyy")
                calendarView.isHidden = false
            tfDate.stringValue = ""
            }
            
            return true
        } else {
            // Invalid date
            runMyAlert(alertMessage: "Date format should be mm/dd/yyyy")
            tfDate.stringValue = ""
            calendarView.isHidden = false
            return false
        }
    }
    
    
}
