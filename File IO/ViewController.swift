import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var txt_fileName: NSTextFieldCell!
    @IBOutlet weak var txt_txtContents: NSTextField!
    @IBOutlet weak var lbl_Output: NSTextFieldCell!
    
    var fileContentToWrite = ""
    let fileName = "myFileName.txt"
    var filePath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        if checkInputes_Pass() {
        saveTextFile(fileName_: fileName, text_:txt_fileName.stringValue)
        }
    }
      
    @IBAction func Read(_ sender: Any) {
        lbl_Output.stringValue =  loadTextFile(fileName_: fileName)
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
    
    func checkInputes_Pass()->Bool{
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
    
}//Last Bracket
