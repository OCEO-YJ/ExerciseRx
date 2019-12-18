//
//  QuestionViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/14/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import SelectionList

protocol FirstVCDelegate {
    func getQ1(data: String)
}

class FirstQViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var selectionList: SelectionList!
    
    var delegate: FirstVCDelegate?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpUIs()
        
        }

        // Do any additional setup after loading the view.

    func setUpUIs() {
        
        print(self.selectionList.frame.size.height)

        questionLabel.textColor = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        questionLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 20)
        questionLabel.text = "How many days a week do you engage in moderate to strenuous exercise (like a brisk walk, breathing harder than normal)?"
        questionLabel.numberOfLines = 5

        selectionList.items = ["0", "1", "2", "3", "4", "5", "6", "7"]
        //selectionList.allowsMultipleSelection = true

        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray}
    
    }
    
    @objc func selectionChanged() {
        
        guard let number = selectionList.selectedIndex else {
            return
        }
        
        
        self.delegate?.getQ1(data: String(number))

    }


}
