//
//  OccupationVC.swift
//  DBPR Upload Tool
//
//  Created by CHRISTOPHER ALBANESE on 3/29/18.
//  Copyright © 2018 CHRISTOPHER ALBANESE. All rights reserved.
//

import Cocoa

class OccupationVC: NSViewController, NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate {
    
    let defaults = UserDefaults.standard
    override func viewWillAppear() {
    
        defaults.register(defaults: ["codeDefaults": codeDefault] )
        defaults.register(defaults: ["nameDefaults": nameDefault] )
        loadDefaults()
        setupOccList()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tfOccupationCode.delegate = self
        tfOccupationTitle.delegate = self
       
    }
    override func viewDidLayout() {
        occTableView.reloadData()
    }
    var code = [Any]()
    var name = [Any]()
    func loadDefaults() {
        
        code = defaults.array(forKey: "codeDefaults")!
        name = defaults.array(forKey: "nameDefaults")!
    }
    
    var codeDefault = ["AR",    "ZA",    "AF",    "AX",    "DD",    "ΕΑ",    "IA",    "CJ",    "ВВ",    "BA",    "BC",    "SB",    "BS",    "BW",    "ВК",    "BL",    "BU",    "FM",    "CU",    "СА",    "EF",    "EG",    "CB",    "CZ",    "RZ",    "CG",    "СК",    "CM",    "CF",    "PC",    "CP",    "RD",    "CR",    "CW",    "СС",    "CS",    "CV",    "SC",    "CY",    "FC",    "CAM",    "IG",    "CL",    "IS",    "CE",    "СТ",    "EC",    "EM",    "IH",    "IE",    "FB",    "FA",    "FU",    "FS",    "FD",    "ΕΕ",    "IF",    "ΕΗ",    "GA",    "HB",    "HBS",    "НАТ",    "HWS",    "BN",    "IC",    "ID",    "IT",    "LB",    "LC",    "RH",    "IL",    "LP",    "VL",    "MP",    "MCS",    "FV",    "FT",    "PX",    "PFD",    "PBC",    "PBI",    "PBP",    "PCC",    "РСЕ",    "PEP",    "IP",    "PMI",    "PMP",    "PP",    "PPI",    "PPP",    "PRE",    "OB",    "FG",    "RU",    "RL",    "RA",    "EH",    "EY",    "EI",    "EZ",    "RI",    "RB",    "ER",    "RG",    "LA",    "RM",    "RF",    "RP",    "RQ",    "EJ",    "RR",    "RC",    "RS",    "ET",    "RX",    "FR",    "IR",    "BR",    "SL",    "SH",    "ES",    "SCP",    "SEI",    "SMI",    "SMP",    "SFP",    "SRP",    "SRI",    "LS",    "VM",    "VE",]
    var nameDefault = ["ARCHITECT",    "ASBESTOS BUSINESS ",    "ASBESTOS CONSULTANT ",    "ASBESTOS CONSULTANT ",    "ASBESTOS CONSULTANT (DOCTORAL DEGREE ",    "ASBESTOS CONSULTANT (ENGINEER) ",    "ASBESTOS CONSULTANT (INDUSTRIAL HYGIENIST) ",    "ASBESTOS CONTRACTOR ",    "BARBER ",    "BARBER ASSISTANT ",    "BARBER COLLEGE ",    "BARBER SCHOOL ",    "BARBER SHOP ",    "BODY WRAPPER ",    "BROKER ",    "BROKER SALES ",    "BUILDING CODE ADMINISTRATOR ",    "CENTRALIZED EMBALMING FACILITIES ",    "CERT UNDERGROUND UTILITY & EXCAV CONTR ",    "CERTIFIED AIR CONDITIONING CONTRACTOR ",    "CERTIFIED ALARM SYSTEM CONTRACTOR I ",    "CERTIFIED ALARM SYSTEM CONTRACTOR II ",    "CERTIFIED BUILDING CONTRACTOR ",    "CERTIFIED GAS LINE SPECIALTY CONTRACTOR ",    "CERTIFIED GENERAL APPRAISER ",    "CERTIFIED GENERAL CONTRACTOR ",    "CERTIFIED GYPSUM DRYWALL SPECIALTY CONTRACTOR ",    "CERTIFIED MECHANICAL CONTRACTOR ",    "CERTIFIED PLUMBING CONTRACTOR ",    "CERTIFIED POLLUTANT STORAGE SYSTEMS CONTRACTOR ",    "CERTIFIED POOL/SPA CONTRACTOR ",    "CERTIFIED RESIDENTIAL APPRAISER ",    "CERTIFIED RESIDENTIAL CONTRACTOR ",    "CERTIFIED RESIDENTIAL SOLAR WATER HEATING CONTRACTOR ",    "CERTIFIED ROOFING CONTRACTOR ",    "CERTIFIED SHEET METAL CONTRACTOR ",    "CERTIFIED SOLAR CONTRACTOR ",    "CERTIFIED SPECIALTY STRUCTURE CONTRACTOR ",    "CERTIFIED TRADITIONAL THATCHED STRUCTURE CONTR ",    "CINERATOR REGISTRATION ",    "COMMUNITY ASSOCIATION MANAGERS ",    "CONCURRENT INTERN ",    "COSMETOLOGIST ",    "COSMETOLOGY PUBLIC SCHOOL ",    "COSMETOLOGY SALON ",    "COSMETOLOGY SCHOOL ",    "ELECTRICAL CONTRACTOR ",    "EMBALMER ",    "EMBALMER APPRENTICE ",    "EMBALMER INTERN ",    "FACIAL REGISTRATION ",    "FACIAL SPECIALIST ",    "FULL REGISTRATION ",    "FULL SPECIALIST ",    "FUNERAL DIRECTOR ",    "FUNERAL DIRECTOR AND EMBALMER ",    "FUNERAL DIRECTOR INTERN ",    "FUNERAL ESTABLISHMENT ",    "GENERAL APPRAISER INSTRUCTOR ",    "HAIR BRAIDER ",    "HAIR BRAIDING SALON ",    "HAIR WRAPPER ",    "HAIR WRAPPER SALON ",    "INSPECTOR ",    "INSTRUCTOR",    "INTERIOR DESIGN ",    "INTERN BARBER TEACHER ",    "LAND SURVEYOR AND MAPPING BUSINESS ",    "LANDSCAPE ARCHITECT BUSINESS ",    "LICENSED APPRAISER ",    "LIMITED INSPECTOR ",    "LIMITED PLANS EXAMINER ",    "LIMITED SERVICE VETERINARY PRACTICE",    "MANICURIST AND PEDICURIST ",    "MOBILE COSMETOLOGY SALONS ",    "NAIL REGISTRATION ",    "NAIL SPECIALIST ",    "PLANS EXAMINER ",    "PROVISIONAL 1&2 FAMILY DWELLING INSPECTOR ",    "PROVISIONAL BUILDING CODE ADMINISTRATOR ",    "PROVISIONAL BUILDING INSPECTOR ",    "PROVISIONAL BUILDING PLANS EXAMINER ",    "PROVISIONAL COASTAL CONSTRUCTION INSPECTOR ",    "PROVISIONAL COMMERCIAL ELECTRICAL INSPECTOR ",    "PROVISIONAL ELECTRICAL PLANS EXAMINER ",    "PROVISIONAL INSPECTOR ",    "PROVISIONAL MECHANICAL INSPECTOR",    "PROVISIONAL MECHANICAL PLANS EXAMINER",    "PROVISIONAL PLANS EXAMINER ",    "PROVISIONAL PLUMBING INSPECTOR ",    "PROVISIONAL PLUMBING PLANS EXAMINER ",    "PROVISIONAL RESIDENTIAL ELECTRICAL INSPECTOR ",    "QUALIFIED BUSINESS ORGANIZATION ",    "REFRIGERATION FACILITIES ",    "REG UNDERGROUND UTILITY & EXCAV CONTR ",    "REG. INTERNAL POLLUTANT STOR. TANK LIN. APP",    "REGISTERED AIR CONDITIONING CONTRACTOR ",    "REGISTERED ALARM SYSTEM CONTRACTOR I ",    "REGISTERED ALARM SYSTEM CONTRACTOR I ",    "REGISTERED ALARM SYSTEM CONTRACTOR II ",    "REGISTERED ALARM SYSTEM CONTRACTOR II ",    "REGISTERED ASSISTANT APPRAISER ",    "REGISTERED BUILDING CONTRACTOR ",    "REGISTERED ELECTRICAL CONTRACTOR ",    "REGISTERED GENERAL CONTRACTOR ",    "REGISTERED LANDSCAPE ARCHITECT ",    "REGISTERED MECHANICAL CONTRACTOR ",    "REGISTERED PLUMBING CONTRACTOR ",    "REGISTERED POOL/SPA CONTRACTOR ",    "REGISTERED PRECISION TANK TESTER ",    "REGISTERED RESIDENTIAL ALARM SYSTEM CONTRACTOR ",    "REGISTERED RESIDENTIAL CONTRACTOR ",    "REGISTERED ROOFING CONTRACTOR ",    "REGISTERED SHEET METAL CONTRACTOR ",    "REGISTERED SPECIALTY CONTRACTOR ",    "REGISTERED SPECIALTY CONTRACTOR ",    "REMOVAL SERVICES ",    "RESIDENTIAL APPRAISER INSTRUCTOR ",    "RESTRICTED BARBER ",    "SALESPERSON ",    "SHAMPOO SPECIALIST ",    "SPECIALTY CONTRACTOR ",    "STANDARD COMMERCIAL POOL INSPECTOR ",    "STANDARD ELECTRICAL INSPECTOR ",    "STANDARD MODULAR INSPECTOR ",    "STANDARD MODULAR PLANS EXAMINER ",    "STANDARD ONE & TWO FAMILY DWELLING PLANS EXAMINER ",    "STANDARD RESIDENTIAL POOL INSPECTOR ",    "STANDARD ROOFING INSPECTOR ",    "SURVEYOR AND MAPPER ",    "VETERINARIAN ",    "VETERINARY ESTABLISHMENT",]
    
    
    
    var created = [[String:String]]()
    var deleteCode = ""
    var deleteName = ""
    var deleteIndex = Int()
    
    @IBOutlet var arrayController: NSArrayController!
    @IBOutlet weak var tfOccupationCode: NSTextField!
    @IBOutlet weak var tfOccupationTitle: NSTextField!
    
    @IBAction func codeEvent(_ sender: Any) {
        
    }
    
    
    @IBOutlet weak var occTableView: NSTableView!
    @IBAction func btnDeleteOccupation(_ sender: NSButton) {
       // code.remove(at: deleteIndex)
        print("deleteCode = ", deleteCode)
         defaults.set(code, forKey: "codeDefaults")
       // name.remove(at: deleteIndex)
        print("deleteName = ",deleteName)
        defaults.set(name, forKey: "nameDefaults")
        print(occTableView.selectedRow)
        setupOccList()
        occTableView.reloadData()
    }
    
    
    @IBAction func btnAddOccupation(_ sender: NSButton) {
        addOccupation()
    }
    
    func addOccupation() {
        let occCode = tfOccupationCode.stringValue
        let occTitle = tfOccupationTitle.stringValue
        let newOcc = ["code":occCode, "name":occTitle]
        if occCode.count <  2 {
            print("ALERT CODE BE 7 Digits")
        }
        
        if occCode.contains("!") {print("VOID CHARS")}
        
        
        if occTitle != "" && occTitle != "" {
            code.append(occCode.uppercased())
            defaults.set(code, forKey: "codeDefaults")
            name.append(occTitle.uppercased().replacingOccurrences(of: "-", with: " "))
            defaults.set(name, forKey: "nameDefaults")

            setupOccList()
            created = created.sorted(by: { $0["name"]! < $1["name"]! })
            print(created.sorted(by: { $0["name"]! < $1["name"]! }))
           // print("Created = ", created)


       
      
        print(occCode, occTitle, newOcc)
            tfOccupationCode.stringValue = ""
            tfOccupationTitle.stringValue = ""
       occTableView.reloadData()
        }
    }
    
    func mergeArr(code: String, name: String) {
        let newItem = ["code":code, "name":name]
        created.append(newItem)
    }
    
    func setupOccList() {
        created = [[String:String]]()
        print(code.count)
        for i in 0...(code.count-1) {
            mergeArr(code: code[i] as! String, name: name[i] as! String)
        }
        created = created.sorted(by: { $0["name"]! < $1["name"]! })
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
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        print("selected row = ", occTableView.selectedRow)
        print("selected column = ",  occTableView.selectedColumn)
        deleteIndex = occTableView.selectedRow
        if deleteIndex >= 0 {
        deleteCode = created[occTableView.selectedRow]["code"]!
        deleteName = created[occTableView.selectedRow]["name"]!
      
        }
        
        if occTableView.selectedRow == -1 {
            if occTableView.selectedColumn == 0 {
                created = created.sorted(by: { $0["code"]! < $1["code"]! })
            } else {
                created = created.sorted(by: { $0["name"]! < $1["name"]! })
            }
            occTableView.reloadData()
        }
    }
    
    override func controlTextDidChange(_ obj: Notification) {
        print("textChanged")
        if tfOccupationCode.stringValue.count > 3 { runMyAlert(alertMessage: "Occupation Code Must Be 3 Or Fewer Letters")}
        if tfOccupationTitle.stringValue.count > 73 {runMyAlert(alertMessage: "Occupation Title Must Be Less Than 73 Characters")}
        let characterSet: NSCharacterSet = NSCharacterSet(charactersIn: " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ").inverted as NSCharacterSet
        
        self.tfOccupationTitle.stringValue =  tfOccupationTitle.stringValue.uppercased()
        
        self.tfOccupationCode.stringValue =   (self.tfOccupationCode.stringValue.components(separatedBy: characterSet as CharacterSet) as NSArray).componentsJoined(by: "").uppercased()
    
        
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
