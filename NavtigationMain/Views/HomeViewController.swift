//
//  HomeViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/30/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import UICircularProgressRing

class HomeViewController: UIViewController  {

    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var progressBar: UICircularProgressRing!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUIs()
        

        // Do any additional setup after loading the view.
    }
    
    func setUpUIs() {
        
        //Daily Step Count Goal toggle button
        
        view.backgroundColor = .white
        
        let purple = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)
        stepCountLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 15)
        stepCountLabel.textColor = purple
        
        let gray = UIColor(red: 50/255, green: 62/255, blue: 72/255, alpha: 1)
        stepsLabel.font = UIFont(name: "AvenirNextCondensed-Regular", size: 15)
        stepsLabel.textColor = gray
        stepsLabel.text = "6,421 Steps"
        
        dateLabel.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 10)
        dateLabel.textColor = gray
        dateLabel.text = "September 20 - 27"
        
        progressBar.maxValue = 100
        progressBar.resetProgress()
        progressBar.startAngle = -90
        progressBar.isClockwise = true
        
        progressBar.outerRingColor = .lightGray
        progressBar.outerRingWidth = 10
        
        progressBar.innerRingWidth = 10
        progressBar.innerCapStyle = .round
        progressBar.innerRingColor = purple
        
        progressBar.style = .bordered(width: 0, color: .black)
        progressBar.fontColor = gray
        progressBar.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 25)!

    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressBar.startProgress(to: 70, duration: 2.0)
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
