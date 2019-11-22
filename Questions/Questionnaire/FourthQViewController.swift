//
//  FourthQViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/14/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import SelectionList
import TransitionButton

class FourthQViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var selectionList: SelectionList!
    @IBOutlet weak var nextButton: TransitionButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs() 
        // Do any additional setup after loading the view.
    }
    
    func setUpUIs() {
        print(self.view!.bounds.size.height)

        questionLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        questionLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        questionLabel.text = "Which of the following are barriers to activity? \n\n Please select all that apply"
        questionLabel.numberOfLines = 5

        selectionList.items = ["Lack of time", "Care-Giving Duties", "Lack of Motivation", "Lack of Energy", "Physical Exertion, Exercise is tiring", "Exercise is fatiguing", "Exercise is hard work", "Too tired" ,"Injury or pain",
        "Health conditions or Poor health", "Lack of Interest, Unsure how to start", "No place to exercise, None of the above"]
        selectionList.allowsMultipleSelection = true

        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray}
        

    
    }
    
    @objc func selectionChanged() {
        print(selectionList.selectedIndexes)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextButtonTouchUpInside(_ sender: TransitionButton) {
        
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
