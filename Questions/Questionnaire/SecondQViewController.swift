//
//  SecondQViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/14/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import SelectionList

protocol SecondVCDelegate {
    func getQ2(data: String)
}
class SecondQViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var selectionList: SelectionList!
    var delegate: SecondVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs() 
        // Do any additional setup after loading the view.
    }
    
    func setUpUIs() {
        print(self.selectionList.frame.size.height)

        questionLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        questionLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        questionLabel.text = "On average, each time you exercise, how many minutes do you exercise at this level?"
        questionLabel.numberOfLines = 5

        selectionList.items = ["0", "10", "20", "30", "40", "50", "60", "90", "120", "150+"]
        //selectionList.allowsMultipleSelection = true

        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray}
    
    }
    
    @objc func selectionChanged() {
        
        guard let number = selectionList.selectedIndex else {
            return
        }

        var result = ""
        
        if number == 0{
            result = "0"
        }else if number == 1{
            result = "10"
        }else if number == 2{
            result = "20"
        }else if number == 3{
            result = "30"
        }else if number == 4{
            result = "40"
        }else if number == 5{
            result = "50"
        }else if number == 6{
            result = "60"
        }else if number == 7{
            result = "90"
        }else if number == 8{
            result = "120"
        }else{
            result = "150+"
        }

        self.delegate?.getQ2(data: result)
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
