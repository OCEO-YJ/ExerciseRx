//
//  SettingViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/21/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import fluid_slider

class SettingViewController: UIViewController {
    @IBOutlet weak var dailyGoalLabel: UILabel!
    @IBOutlet weak var dailySlider: Slider!
    
    @IBOutlet weak var stepPercentageLabel: UILabel!
    @IBOutlet weak var stepSlider: Slider!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
        // Do any additional setup after loading the view.
    }
    

    func setUpUIs(){
        
        dailyGoalLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        dailyGoalLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        dailyGoalLabel.text = "Daily Step Count"

            dailySlider.attributedTextForFraction = { fraction in
                let formatter = NumberFormatter()
                formatter.maximumIntegerDigits = 3
                formatter.maximumFractionDigits = 0
                let string = formatter.string(from: (fraction * 500) as NSNumber) ?? ""
                return NSAttributedString(string: string)
            }
            dailySlider.setMinimumLabelAttributedText(NSAttributedString(string: "0"))
            dailySlider.setMaximumLabelAttributedText(NSAttributedString(string: "500"))
            dailySlider.fraction = 0.5
            dailySlider.shadowOffset = CGSize(width: 0, height: 10)
            dailySlider.shadowBlur = 5
            dailySlider.shadowColor = UIColor(white: 0, alpha: 0.1)
            dailySlider.contentViewColor = UIColor(red: 78/255.0, green: 77/255.0, blue: 224/255.0, alpha: 1)
            dailySlider.valueViewColor = .white
        
        stepPercentageLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        stepPercentageLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        stepPercentageLabel.text = "Step Percentage"
        
        stepSlider.attributedTextForFraction = { fraction in
            let formatter = NumberFormatter()
            formatter.maximumIntegerDigits = 3
            formatter.maximumFractionDigits = 0
            let string = formatter.string(from: (fraction * 10) as NSNumber) ?? ""
            return NSAttributedString(string: string)
        }
        stepSlider.setMinimumLabelAttributedText(NSAttributedString(string: "0%"))
        stepSlider.setMaximumLabelAttributedText(NSAttributedString(string: "10%"))
        stepSlider.fraction = 0.5
        stepSlider.shadowOffset = CGSize(width: 0, height: 10)
        stepSlider.shadowBlur = 5
        stepSlider.shadowColor = UIColor(white: 0, alpha: 0.1)
        stepSlider.contentViewColor = UIColor(red: 78/255.0, green: 77/255.0, blue: 224/255.0, alpha: 1)
        stepSlider.valueViewColor = .white



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
