import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var txt_Input: NSTextFieldCell!
    @IBOutlet weak var lbl_Output: NSTextFieldCell!

    // Fine documents directory on device
    let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFile()
    }

    // Set the contents
    let fileContentToWrite = "Text to be recorded into file"
    let fileName = "myFileName.txt"
    var filePath = ""
    
    @IBAction func save(_ sender: Any) {
        do {
            // Write contents to file
            try fileContentToWrite.write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("An error took place: \(error)")
        }
    }
      
    @IBAction func Read(_ sender: Any) {
        // Read file content. Example in Swift
        do {
            // Read file content
            let contentFromFile = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue)
            print(contentFromFile)
        }
        catch let error as NSError {
            print("An error took place: \(error)")
        }
    }

    

    func setupFile(){//__________________________________________________
      if dirs.count > 0 {
          let dir = dirs[0] //documents directory
          filePath = dir.appending("/" + fileName)
          print("Local path = \(filePath)")
      } else {
          print("Could not find local directory to store file")
          return
      }
    }
    
    
    
    
    override var representedObject: Any? {
        didSet {
        }
    }
}//Last Bracket
