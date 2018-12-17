//
//  ViewController.swift
//  YoutubePlus
//
//  Created by Marysa Williams on 12/5/18.
//  Copyright © 2018 Marysa Williams. All rights reserved.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import GoogleAPIClientForREST
import FirebaseAnalytics

class ViewController: UIViewController {

    
    @IBOutlet weak var outputBox: UITextField!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    @IBAction func buttonTouched(_ sender: UIButton) {
        
        let x = myTextField.text!
        
        //Analytics.logEvent("textSumbitted", parameters: ["text": x as NSString])
        
    }
    

}

