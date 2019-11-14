//
//  TimeSelectionViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/3/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

// Back UP































import UIKit
import SkyFloatingLabelTextField
import TransitionButton
import BEMCheckBox

class TimeSelectionViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var fromTimeTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var toTimeTextField: SkyFloatingLabelTextField!
    
    @IBOutlet weak var startButton: TransitionButton!
    
    
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    
    @IBOutlet weak var monday: BEMCheckBox!
    @IBOutlet weak var tuesday: BEMCheckBox!
    @IBOutlet weak var wednesday: BEMCheckBox!
    @IBOutlet weak var thursday: BEMCheckBox!
    @IBOutlet weak var friday: BEMCheckBox!
    
    @IBOutlet weak var saturday: BEMCheckBox!
    @IBOutlet weak var sunday: BEMCheckBox!
    
    let fromPicker = UIDatePicker()
    let toPicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
    }
    
    func setUpUIs(){
        let gray = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)

        headerLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 22)
        headerLabel.textColor = gray
            
        questionLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        questionLabel.textColor = gray
        
        fromTimeTextField.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 12)
        fromTimeTextField.titleFont = UIFont(name: "AvenirNextCondensed-UltraLight", size: 10)
        fromTimeTextField.placeholder = "Time (From)"
        colorChange(textField: fromTimeTextField)
        
        toTimeTextField.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 12)
        toTimeTextField.titleFont = UIFont(name: "AvenirNextCondensed-UltraLight", size: 10)
        toTimeTextField.placeholder = "Time (To)"
        colorChange(textField: toTimeTextField)
        
//        monday.onAnimationType = .oneStroke
//        monday.boxType = .circle

        changeFont(label: mondayLabel)
        changeFont(label: tuesdayLabel)
        changeFont(label: wednesdayLabel)
        changeFont(label: thursdayLabel)
        changeFont(label: fridayLabel)
        changeFont(label: saturdayLabel)
        changeFont(label: sundayLabel)
        
        checkboxcolor(checkBox: monday)
        checkboxcolor(checkBox: tuesday)
        checkboxcolor(checkBox: wednesday)
        checkboxcolor(checkBox: thursday)
        checkboxcolor(checkBox: friday)
        checkboxcolor(checkBox: saturday)
        checkboxcolor(checkBox: sunday)

        startButton.layer.cornerRadius = 15
        startButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed", size: 20)
        startButton.backgroundColor = gray
        startButton.setTitleColor(UIColor.white, for: .normal)
        
        fromDatePicker()
        toDatePicker()
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
    
    func checkboxcolor(checkBox: BEMCheckBox){
        let color = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)

        checkBox.onTintColor = color
        checkBox.onCheckColor = color
        
    }
    
    func fromDatePicker(){
        
        /* set the datePick mode as a date*/
        fromPicker.datePickerMode = .time
        
        /* create a tool bar that has two buttons, Done and Cancel.
         * the space button is the button that just to give a space between done button and cancel button */
        let toolbar_BabyDate = UIToolbar();
        toolbar_BabyDate.sizeToFit()
        let doneButton_BabyDate = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donefromPicker));
        let spaceButton_BabyDate = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton_BabyDate = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelfromPicker));
        toolbar_BabyDate.setItems([cancelButton_BabyDate,spaceButton_BabyDate,doneButton_BabyDate], animated: false)
        
        /* connect the date picker to the baby_date_textField */
        fromTimeTextField.inputAccessoryView = toolbar_BabyDate
        fromTimeTextField.inputView = fromPicker
        
    }
    func toDatePicker(){
        
        /* set the datePick mode as a date*/
        toPicker.datePickerMode = .time
        
        /* create a tool bar that has two buttons, Done and Cancel.
         * the space button is the button that just to give a space between done button and cancel button */
        let toolbar_BabyDate = UIToolbar();
        toolbar_BabyDate.sizeToFit()
        let doneButton_BabyDate = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donetoPicker));
        let spaceButton_BabyDate = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton_BabyDate = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(canceltoPicker));
        toolbar_BabyDate.setItems([cancelButton_BabyDate,spaceButton_BabyDate,doneButton_BabyDate], animated: false)
        
        /* connect the date picker to the baby_date_textField */
        toTimeTextField.inputAccessoryView = toolbar_BabyDate
        toTimeTextField.inputView = toPicker
        
    }

    /* create an object function for the done button in the date picker tool bar */
    @objc func donefromPicker(){
        
        /* set the date picker has a specific date formant to be put in the baby_date_textField */
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        fromTimeTextField.text = formatter.string(from: fromPicker.date)
        self.view.endEditing(true)
    }
    
    /* create an object function for the cancel button in the date picker tool bar */
    @objc func cancelfromPicker(){
        
        /* when user clicked, then the date picker will be dismissed */
        fromTimeTextField.text = ""
        self.view.endEditing(true)
    }
    
    /* create an object function for the done button in the date picker tool bar */
    @objc func donetoPicker(){
        
        /* set the date picker has a specific date formant to be put in the baby_date_textField */
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        toTimeTextField.text = formatter.string(from: fromPicker.date)
        self.view.endEditing(true)
    }
    
    /* create an object function for the cancel button in the date picker tool bar */
    @objc func canceltoPicker(){
        
        /* when user clicked, then the date picker will be dismissed */
        toTimeTextField.text = ""
        self.view.endEditing(true)
    }



    func changeFont(label: UILabel){
        
        let gray = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)

        label.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 25)
        label.textColor = gray
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func startButtonTouchUpInside(_ sender: TransitionButton) {
        
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
                    self.performSegue(withIdentifier: "Question_To_Main", sender: self)
                })
            })
        })

    }
}
