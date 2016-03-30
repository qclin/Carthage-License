//
//  LicenseViewController.swift
//
//  Created by qclin on 2016/03/25.
//  Open-source
//

import UIKit

class LicenseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let info = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("License", ofType: "plist")!)
        let licenses = info!["License"] as! [[String : String]]
        
        var text = ""
        for var item in licenses {
            text += "\(item["name"]!)\n\n\(item["text"]!)\n\n"
        }
        let textView = UITextView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        textView.text = text
        textView.scrollEnabled = true
        
        self.view.addSubview(textView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
