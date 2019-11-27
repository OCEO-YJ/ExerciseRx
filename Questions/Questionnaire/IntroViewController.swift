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

class IntroViewController: UIViewController {
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var sexSegment: BetterSegmentedControl!
    
    @IBOutlet weak var ethnicityLabel: UILabel!
    @IBOutlet weak var selectionList: SelectionList!
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
        
        sexSegment.segments = LabelSegment.segments(withTitles: ["Male", "Female", "Prefer not to Answer"],
                                                  normalFont: UIFont(name: "AvenirNextCondensed-Bold", size: 13.0)!,
                                                  selectedFont: UIFont(name: "AvenirNextCondensed-Bold", size: 13.0)!)

        let color = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 0.5)

//        sexSegment.indicatorViewBackgroundColor = color
//        sexSegment.tintColor = .black
        sexSegment.cornerRadius = 5
        
        ethnicityLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        ethnicityLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        ethnicityLabel.text = "Please select the Ethnicity \n\n Please select all that apply"
        ethnicityLabel.numberOfLines = 5

        
        
        selectionList.items = ["Caucasian", "Hispanic or Latinx", "Black or African America", "Asian / Pacific Islander","Native American or American", "Indian", "Other"]
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

}
