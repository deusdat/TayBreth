//
//  ViewController.swift
//  TayBreth
//
//  Created by J Patrick Davenport on 7/18/16.
//  Copyright © 2016 J Patrick Davenport. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var rememberURLSwitch: UISwitch!
    @IBOutlet weak var rememberMeSwitch: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lb :UIButton!
    weak var ctx: JiraContext!;
    var textSemiphore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        urlTextField.delegate = self
        ctx = JiraContext()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func setLoginButton(_ sender: UIButton) {
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        func checkEmpty(t: UITextField?) -> Int {
            let empty = t!.text!.isEmpty
            var result = 0
            if(empty) {
                t!.backgroundColor = UIColor(netHex:0xFF99C9, alpha: 0.25)
            } else {
                t!.backgroundColor = UIColor.clear()
                result = 1
            }
            return result
        }
        
        let fields = [self.passwordTextField, self.usernameTextField, self.urlTextField]
        fields.map(checkEmpty)
            .reduce(0, combine: +)
            .equals(3, yes: {self.lb.isEnabled = true}, no: {self.lb.isEnabled = false})
    }
    
}

extension Int {
    func equals (_ other: Int, yes: ()-> Void, no: () -> Void) {
        if(self == other) {
            yes()
        } else {
            no()
        }
    }
}

extension UIColor {
    
    convenience init(netHex:Int, alpha:Float) {
        self.init(red: CGFloat((netHex >> 16) & 0xff) / 255.0,
                  green: CGFloat((netHex >> 8) & 0xff) / 255.0,
                  blue: CGFloat(netHex & 0xff) / 255.0,
                  alpha: CGFloat(alpha))
    }
}

