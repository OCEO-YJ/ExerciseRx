//
//  CodeViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/21/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CodeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var codeTextField: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUIs()
        // Do any additional setup after loading the view.
    }
    
    func setUpUIs() {
        
        headerLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        headerLabel.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 70)
        
        /* set the tool bar Items (Cancel - Space - Done) */
        let toolbar_LastDigit = UIToolbar();
        toolbar_LastDigit.sizeToFit()
        let doneButton_LastDigit = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done_numberPad));
        let spaceButton_LastDigit = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton_LastDigit = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel_numberPad));
        toolbar_LastDigit.setItems([cancelButton_LastDigit,spaceButton_LastDigit,doneButton_LastDigit], animated: false)
        
        /* connect the date picker to the weightTextField */
        codeTextField.keyboardType = UIKeyboardType.numberPad
        codeTextField.inputAccessoryView = toolbar_LastDigit

        let color = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)

        codeTextField.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 15)
        codeTextField.titleFont = UIFont(name: "AvenirNextCondensed-UltraLight", size: 10)
        codeTextField.placeholder = "Activation Code"
        codeTextField.textColor = color
        codeTextField.tintColor = color
        codeTextField.lineColor = color
        codeTextField.placeholderColor = color
        codeTextField.selectedLineColor = color
        codeTextField.selectedTitleColor = color


    }
    
    /* create an object function for the cancel and done button in the number pad tool bar */
    @objc func cancel_numberPad(){
        
        codeTextField.text = ""
        self.view.endEditing(true)
    }

    
    /* create an object function for the cancel and done button in the number pad tool bar */
    @objc func done_numberPad(){
        self.view.endEditing(true)
        performSegue(withIdentifier: "222", sender: nil)

    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        codeTextField.resignFirstResponder()
        
        performSegue(withIdentifier: "222", sender: nil)

        
        return true
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
