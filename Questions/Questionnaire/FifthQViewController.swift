//
//  FifthQViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/21/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import TransitionButton

class FifthQViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    var user = User()

    @IBOutlet weak var startButton: TransitionButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
        // Do any additional setup after loading the view.
    }
    

        @objc func timeSelectionFunction(textField: UITextField) {
            print("myTargetFunction")
            self.performSegue(withIdentifier: "Question5_To_TimeSelection", sender: self)
    //        questionTwo.text = "Completed"

        }
    func setUpUIs() {
        
        
        questionLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        questionLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        questionLabel.text = "Please indicate below when you would like to receive reminders to get up and move"
        questionLabel.numberOfLines = 5

        let gray = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        startButton.layer.cornerRadius = 15
        startButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed", size: 20)
        startButton.backgroundColor = gray
        startButton.setTitleColor(UIColor.white, for: .normal)
        



    }

    
    @IBAction func clickedTouchUpInside(_ sender: TransitionButton) {
        
        if(sender.titleLabel?.text == "Set Schedule"){
            sender.setTitle("Completed and Start", for: .normal)
            self.performSegue(withIdentifier: "Question5_To_TimeSelection", sender: self)

        }else{
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
                        self.performSegue(withIdentifier: "Questions_To_Main", sender: self)
                    })
                })
            })

        }
        
        
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


