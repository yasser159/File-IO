import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var txt_fileName: NSTextFieldCell!
    @IBOutlet weak var txt_txtContents: NSTextField!
    @IBOutlet weak var lbl_Output: NSTextFieldCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        if checkBeforeWriting_Pass() {
            saveTextFile(fileName_: txt_fileName.stringValue, text_:txt_txtContents.stringValue)
            lbl_Output.stringValue = "File Saved Succesfully"
        }
    }
      
    @IBAction func Read(_ sender: Any) {
        if checkBeforeLoad_Pass() {
        lbl_Output.stringValue =  loadTextFile(fileName_: txt_fileName.stringValue)
            txt_txtContents.stringValue = lbl_Output.stringValue
        }
    }
    
    override var representedObject: Any? { didSet {}}
    
    func checkBeforeWriting_Pass()->Bool{
        var missingFields = [String]()
        var NoMissingFields = true
        
        if txt_fileName.stringValue == "" {
            missingFields.append("File Name")}
            
        if txt_txtContents.stringValue == ""{
            missingFields.append("File Text")}

        if missingFields.count > 0 {
            NoMissingFields = false
            var warning =  "Please Enter the missing Values: \n\r"
            warning.append(missingFields.joined(separator: "\n\r"))
            lbl_Output.stringValue = warning
        } else {
            lbl_Output.stringValue = ""
        }
        
        return NoMissingFields
    }
    
    func checkBeforeLoad_Pass()->Bool{
        var NoMissingFields = true
        
        if txt_fileName.stringValue == "" {
            lbl_Output.stringValue = "Please Enter the File Name"
            NoMissingFields = false
        }
        return NoMissingFields
    }
    
}// Last Bracket
