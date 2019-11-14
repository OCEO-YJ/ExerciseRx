//
//  InfoViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/30/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var fundingButton: UIButton!
    @IBOutlet weak var faqButton: UIButton!
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var disclaimerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIs()
    }
    
    func setUpUIs(){
        
        let purple = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)
        headerLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 25)
        headerLabel.textColor = purple
        
        
        let gray = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        fundingButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        fundingButton.tintColor = gray

        faqButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        faqButton.tintColor = gray

        contactButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        contactButton.tintColor = gray

        disclaimerButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        disclaimerButton.tintColor = gray

        

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
