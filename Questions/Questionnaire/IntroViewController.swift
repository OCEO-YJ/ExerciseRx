//
//  IntroViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/21/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import BetterSegmentedControl
import SelectionList

protocol IntroVCDelegate {
    func getMedicalSex(data: [String : Any])
}

class IntroViewController: UIViewController {
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var sexSegment: BetterSegmentedControl!
    
    @IBOutlet weak var ethnicityLabel: UILabel!
    @IBOutlet weak var selectionList: SelectionList!
    
    var delegate: IntroVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUIs()
        // Do any additional setup after loading the view.
    }
    
    func setUpUIs() {
        

        sexLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        sexLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        sexLabel.text = "Please select the Medical Sex"
        sexLabel.numberOfLines = 5
        
        sexSegment.segments = LabelSegment.segments(withTitles: ["Male", "Female", "Other"],
                                                  normalFont: UIFont(name: "AvenirNextCondensed-Bold", size: 13.0)!,
                                                  selectedFont: UIFont(name: "AvenirNextCondensed-Bold", size: 13.0)!)
        let color = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 0.5)

        sexSegment.indicatorViewBackgroundColor = color
        sexSegment.tintColor = .black
        sexSegment.cornerRadius = 5
        sexSegment.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        
        ethnicityLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        ethnicityLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        ethnicityLabel.text = "What is your race or ethnicity? \n\n Please select all that apply"
        ethnicityLabel.numberOfLines = 5

        
        
        selectionList.items = ["Caucasian", "Hispanic or Latinx", "Black or African America", "Asian / Pacific Islander","Native American or American", "Indian", "Prefer to not disclose"]
        selectionList.allowsMultipleSelection = true

        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray}
        
        selectionChanged()
        
    }
    
    @objc func selectionChanged() {
        
        let sex = medicalSexString(index: sexSegment.index)
        let ethnicity = ethnicityString(indexs: selectionList.selectedIndexes)
        let myDict = ["medicalSex": sex, "ethnicity": ethnicity] as [String : Any]

        self.delegate?.getMedicalSex(data: myDict)

    }
    
    func medicalSexString(index: UInt) -> String {
        if index == 0{
            return "Male"
        }else if index == 1{
            return "Female"
        }else{
            return "Other"
        }
    }
    
    func ethnicityString(indexs: [Int]) -> [String] {
        var ethnicities: [String] = []

        for index in indexs{
            if index == 0{
                ethnicities.append("Caucasian")
            }else if index == 1{
                ethnicities.append("Hispanic or Latinx")
            }else if index == 2{
                ethnicities.append("Black or African America")
            }else if index == 3{
                ethnicities.append("Asian / Pacific Islander")
            }else if index == 4{
                ethnicities.append("Native American or American")
            }else if index == 5{
                ethnicities.append("Indian")
            }else{
                ethnicities.append("Other")            }

        }
        return ethnicities
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
