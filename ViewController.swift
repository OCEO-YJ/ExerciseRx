//
//  ViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/4/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import TransitionButton

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 0){
            return sexOption.count
        }
        else {
            return ethnicityOption.count
        }
    }
    
        
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var userName: SkyFloatingLabelTextField!
    @IBOutlet weak var userBirthDate: SkyFloatingLabelTextField!
    @IBOutlet weak var userSexType: SkyFloatingLabelTextField!
    @IBOutlet weak var userEthnicity: SkyFloatingLabelTextField!
    @IBOutlet weak var userHeight_Feet: SkyFloatingLabelTextField!
    @IBOutlet weak var userHeight_Inches: SkyFloatingLabelTextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet var userWeight: SkyFloatingLabelTextField!
    
    let datePicker = UIDatePicker()
    let sexOption = ["Male", "Female", "Prefer not to answer"]
    let ethnicityOption = ["Caucasian", "Hispanic or Latinx", "Black or African America", "Asian / Pacific Islander","Native American or American", "Indian", "Other"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        userName.resignFirstResponder()
        userBirthDate.resignFirstResponder()

        return true
    }

    func setUpUIs() {
        
        
        headerLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        headerLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        
        userName.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 17)
        userName.titleFont = UIFont(name: "AvenirNextCondensed-Bold", size: 13)
        userName.placeholder = "Legal Name"
        colorChange(textField: userName)
        
        userBirthDate.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 17)
        userBirthDate.titleFont = UIFont(name: "AvenirNextCondensed-Bold", size: 13)
        userBirthDate.placeholder = "Birth Date"
        colorChange(textField: userBirthDate)

        userSexType.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 17)
        userSexType.titleFont = UIFont(name: "AvenirNextCondensed-Bold", size: 13)
        userSexType.placeholder = "Medical Sex"
        colorChange(textField: userSexType)
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.tag = 0
        userSexType.inputView = pickerView
        
        
        userEthnicity.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 17)
        userEthnicity.titleFont = UIFont(name: "AvenirNextCondensed-Bold", size: 13)
        userEthnicity.placeholder = "Ethnicity"
        colorChange(textField: userEthnicity)
        
        let exercisePickerView = UIPickerView()
        exercisePickerView.delegate = self
        exercisePickerView.tag = 1
        userEthnicity.inputView = exercisePickerView

//        questionTwo.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 15)
//        questionTwo.titleFont = UIFont(name: "AvenirNextCondensed-UltraLight", size: 10)
//        questionTwo.placeholder = "What is the best time of day to move?"
//        colorChange(textField: questionTwo)
//
//        questionTwo.addTarget(self, action: #selector(timeSelectionFunction), for: .touchDown)
        
        userHeight_Feet.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 17)
        userHeight_Feet.titleFont = UIFont(name: "AvenirNextCondensed-Bold", size: 13)
        userHeight_Feet.placeholder = "Height (Feet)"
        colorChange(textField: userHeight_Feet)
        
        /* set the tool bar Items (Cancel - Space - Done) */
        let toolbar_Height_Feet = UIToolbar();
        toolbar_Height_Feet.sizeToFit()
        let doneButton_Height_Feet = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done_numberPad));
        let spaceButton_Height_Feet = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton_Height_Feet = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel_numberPad_Height_Feet));
        toolbar_Height_Feet.setItems([cancelButton_Height_Feet,spaceButton_Height_Feet,doneButton_Height_Feet], animated: false)

        /* connect the date picker to the weightTextField */
        userHeight_Feet.keyboardType = UIKeyboardType.numberPad
        userHeight_Feet.inputAccessoryView = toolbar_Height_Feet

        
        userHeight_Inches.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 17)
        userHeight_Inches.titleFont = UIFont(name: "AvenirNextCondensed-Bold", size: 13)
        userHeight_Inches.placeholder = "Height (Inches)"
        colorChange(textField: userHeight_Inches)

        
        /* set the tool bar Items (Cancel - Space - Done) */
        let toolbar_Height_Inches = UIToolbar();
        toolbar_Height_Inches.sizeToFit()
        let doneButton_Height_Inches = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done_numberPad));
        let spaceButton_Height_Inches = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton_Height_Inches = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel_numberPad_Height_Inches));
        toolbar_Height_Inches.setItems([cancelButton_Height_Inches,spaceButton_Height_Inches,doneButton_Height_Inches], animated: false)

        /* connect the date picker to the weightTextField */
        userHeight_Inches.keyboardType = UIKeyboardType.numberPad
        userHeight_Inches.inputAccessoryView = toolbar_Height_Inches
        
        userWeight.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 17)
        userWeight.titleFont = UIFont(name: "AvenirNextCondensed-Bold", size: 13)
        userWeight.placeholder = "Weight (pounds)"
        colorChange(textField: userWeight)

        
        /* set the tool bar Items (Cancel - Space - Done) */
        let toolbar_Weight = UIToolbar();
        toolbar_Weight.sizeToFit()
        let doneButton_Weight = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done_numberPad));
        let spaceButton_Weight = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton_Weight = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancel_numberPad_Weight));
        toolbar_Weight.setItems([cancelButton_Weight,spaceButton_Weight,doneButton_Weight], animated: false)

        /* connect the date picker to the weightTextField */
        userWeight.keyboardType = UIKeyboardType.numberPad
        userWeight.inputAccessoryView = toolbar_Weight

        
        let gray = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        signInButton.layer.cornerRadius = 15
        signInButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed", size: 20)
        signInButton.backgroundColor = gray
        signInButton.setTitleColor(UIColor.white, for: .normal)
        
        showDatePicker()
        
    }
    
//    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return sexOption.count
//    }
    
    @objc func timeSelectionFunction(textField: UITextField) {
        print("myTargetFunction")
        self.performSegue(withIdentifier: "Question1_To_TimeSelection", sender: self)
//        questionTwo.text = "Completed"

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        if(pickerView.tag == 0){
            return sexOption[row]
        }
        else {
            return ethnicityOption[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView.tag == 0){
            userSexType.text = sexOption[row]
        }
        else{
            userEthnicity.text = ethnicityOption[row]
        }
    }

    func colorChange(textField: SkyFloatingLabelTextField){
        
        let color = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)

        textField.textColor = color
        textField.tintColor = color
        textField.lineColor = color
        textField.placeholderColor = color
        textField.selectedLineColor = color
        textField.selectedTitleColor = color
        textField.titleColor = color

    }
    
    func showDatePicker(){
        
        /* set the datePick mode as a date*/
        datePicker.datePickerMode = .date
        datePicker.date = Calendar.current.date(byAdding: .year, value: -30, to: Date())!
        
        /* create a tool bar that has two buttons, Done and Cancel.
         * the space button is the button that just to give a space between done button and cancel button */
        let toolbar_BabyDate = UIToolbar();
        toolbar_BabyDate.sizeToFit()
        let doneButton_BabyDate = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton_BabyDate = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton_BabyDate = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar_BabyDate.setItems([cancelButton_BabyDate,spaceButton_BabyDate,doneButton_BabyDate], animated: false)
        
        /* connect the date picker to the baby_date_textField */
        userBirthDate.inputAccessoryView = toolbar_BabyDate
        userBirthDate.inputView = datePicker
        
    }
    
    /* create an object function for the done button in the date picker tool bar */
    @objc func donedatePicker(){
        
        /* set the date picker has a specific date formant to be put in the baby_date_textField */
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy"
        userBirthDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    /* create an object function for the cancel button in the date picker tool bar */
    @objc func cancelDatePicker(){
        
        /* when user clicked, then the date picker will be dismissed */
        userBirthDate.text = ""
        self.view.endEditing(true)
    }

    
    /* create an object function for the cancel and done button in the number pad tool bar */
    @objc func done_numberPad(){
        self.view.endEditing(true)
    }

    /* create an object function for the cancel and done button in the number pad tool bar */
    @objc func cancel_numberPad_Height_Feet(){
        
        userHeight_Feet.text = ""
        self.view.endEditing(true)
    }

    /* create an object function for the cancel and done button in the number pad tool bar */
    @objc func cancel_numberPad_Height_Inches(){
        
        userHeight_Inches.text = ""
        self.view.endEditing(true)
    }

    /* create an object function for the cancel and done button in the number pad tool bar */
    @objc func cancel_numberPad_Weight(){
        
        userWeight.text = ""
        self.view.endEditing(true)
    }

    




    
    @IBAction func signInTouchUpInside(_ sender: TransitionButton) {
        sender.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {
            
            sleep(1) // 3: Do your networking task or background work here.
            
            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                
                sender.stopAnimation(animationStyle: .expand, completion: {
                    self.performSegue(withIdentifier: "Basic_To_Questions", sender: self)
                })
            })
        })

        
    }
    

    
}

