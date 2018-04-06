//
//  providerVC.swift
//  DBPR Upload Tool
//
//  Created by CHRISTOPHER ALBANESE on 3/29/18.
//  Copyright © 2018 CHRISTOPHER ALBANESE. All rights reserved.
//

import Cocoa

class providerVC: NSViewController, NSTextFieldDelegate {
    
    let defaults = UserDefaults.standard
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do view setup here.
         print("view loaded")
        defaults.register(defaults: ["providerNumDef" : "000000 Provider Number"])
        defaults.register(defaults: ["providerNameDef" : "Provider Name"])
        defaults.register(defaults: ["passCodeDef" : "0000 Pass Code"])
        defaults.register(defaults: ["providerEmailDef" : "Provider Email"])
        tfProviderNum.placeholderString = defaults.string(forKey: "providerNumDef")
        tfProviderName.placeholderString = defaults.string(forKey: "providerNameDef")
        tfPassCode.placeholderString = defaults.string(forKey: "passCodeDef")
        tfProviderEmail.placeholderString = defaults.string(forKey: "providerEmailDef")
    }
    
    @IBOutlet weak var tfProviderNum: NSTextField!
    @IBOutlet weak var tfProviderName: NSTextField!
    @IBOutlet weak var tfPassCode: NSTextField!
    @IBOutlet weak var tfProviderEmail: NSTextField!
    
    @IBAction func btnUpdateProviderInfo(_ sender: NSButton) {
        print("btn Clicked")
        
//        defaults.set("0000 Provider Number", forKey: "provdierNumDef")



        
        if tfProviderNum.stringValue != "" {
            providerNum = tfProviderNum.stringValue
            defaults.set(providerNum, forKey: "providerNumDef")
            tfProviderNum.stringValue = ""
            tfProviderNum.placeholderString = defaults.string(forKey: "providerNumDef")
        }
        
        if tfProviderName.stringValue != "" {
            providerName = tfProviderName.stringValue
            defaults.set(providerName, forKey: "providerNameDef")
            tfProviderName.stringValue = ""
            tfProviderName.placeholderString = providerName
        }
        
        if tfPassCode.stringValue != "" {
            passCode = tfPassCode.stringValue
            defaults.set(passCode, forKey: "passCodeDef")
            tfPassCode.stringValue = ""
            tfPassCode.placeholderString = passCode
        }
        if tfProviderEmail.stringValue != "" {
            providerEmail = tfProviderEmail.stringValue
            defaults.set(providerEmail, forKey: "providerEmailDef")
            tfProviderEmail.stringValue = ""
            tfProviderEmail.placeholderString = providerEmail
        }
     
        
        
        
        print( providerNum, providerName, passCode, providerEmail)
    }
    
    @IBAction func btnCancelUpdate(_ sender: NSButton) {
        tfProviderNum.stringValue = ""
        tfProviderNum.placeholderString = providerNum
        tfProviderName.stringValue = ""
        tfProviderName.placeholderString = providerName
        tfPassCode.stringValue = ""
        tfPassCode.placeholderString = passCode
        tfProviderEmail.stringValue = ""
        tfProviderEmail.placeholderString = providerEmail
        
    }
    var providerName = "Provider Name"
    var providerNum = "000000 Provider Number"
    var passCode = "0000 Pass Code"
    var providerEmail = "Provider Email"
    
    override func controlTextDidChange(_ obj: Notification) {
        print("textChanged")
        if tfProviderName.stringValue.count > 45 { runMyAlert(alertMessage: "Provider Name Must Be Less Than 45 Characters")}
        if tfProviderEmail.stringValue.count > 73 {runMyAlert(alertMessage: "Email Address Must Be Less Than 73 Characters")}
        let characterSet: NSCharacterSet = NSCharacterSet(charactersIn: " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789-").inverted as NSCharacterSet
        let numberSet: NSCharacterSet = NSCharacterSet(charactersIn: "0123456789").inverted as NSCharacterSet
        self.tfProviderName.stringValue =  (self.tfProviderName.stringValue.components(separatedBy: characterSet as CharacterSet) as NSArray).componentsJoined(by: "").uppercased()
        self.tfProviderNum.stringValue =  (self.tfProviderNum.stringValue.components(separatedBy: numberSet as CharacterSet) as NSArray).componentsJoined(by: "")
        self.tfPassCode.stringValue = (self.tfPassCode.stringValue.components(separatedBy: numberSet as CharacterSet) as NSArray).componentsJoined(by: "")
       
    }
    
    func runMyAlert( alertMessage: String){
        
        //var myWindow = NSWindow.self
        let alert = NSAlert()
        alert.messageText = "FORMAT ERROR"
        alert.addButton(withTitle: "OK")
        alert.informativeText = alertMessage
        alert.runModal()
    }
    
}
