//
//  ThridQViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/14/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import SelectionList

protocol ThridVCDelegate {
    func getQ3(data: [String:Any])
}
class ThridQViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var selectionList: SelectionList!
    var delegate: ThridVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs() 
        // Do any additional setup after loading the view.
    }
    func setUpUIs() {
        print(self.view!.bounds.size.height)

        questionLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        questionLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        questionLabel.text = "Which of the following are reasons you enjoy walking? \n\n Please select all that apply"
        questionLabel.numberOfLines = 5
        selectionList.items = ["Social community", "Nature and outdoors", "Improved physical health", "Improved mood", "Increased energy", "Feel less stressed", "Feel relaxed"]
        selectionList.allowsMultipleSelection = true

        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray}
    
    }
    
    @objc func selectionChanged() {
        
        let reasons = reasonString(indexs: selectionList.selectedIndexes)
        let myDict = ["reasons": reasons] as [String : Any]
        self.delegate?.getQ3(data: myDict)

    }

    func reasonString(indexs: [Int]) -> [String] {
        var reasons: [String] = []

        for index in indexs{
            if index == 0{
                reasons.append("Social community")
            }else if index == 1{
                reasons.append("Nature and outdoors")
            }else if index == 2{
                reasons.append("Improved physical health")
            }else if index == 3{
                reasons.append("Improved mood")
            }else if index == 4{
                reasons.append("Increased energy")
            }else if index == 5{
                reasons.append("Feel less stressed")
            }else{
                reasons.append("Feel relaxed")            }

        }
        return reasons
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
