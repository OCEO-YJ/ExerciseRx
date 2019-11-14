//
//  MainQViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/14/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import ScrollingStackViewController

class MainQViewController: ScrollingStackViewController {

    
    var viewController1: UIViewController!
    var viewController2: UIViewController!
    var viewController3: UIViewController!
    var viewController4: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        viewController1 = storyboard.instantiateViewController(withIdentifier: "first") 
        viewController1.view.heightAnchor.constraint(equalToConstant: 550).isActive = true
        
        viewController2 = storyboard.instantiateViewController(withIdentifier: "second")
        viewController2.view.heightAnchor.constraint(equalToConstant: 500).isActive = true

        viewController3 = storyboard.instantiateViewController(withIdentifier: "third")
        viewController3.view.heightAnchor.constraint(equalToConstant: 450).isActive = true

        viewController4 = storyboard.instantiateViewController(withIdentifier: "fourth")
        viewController4.view.heightAnchor.constraint(equalToConstant: 730).isActive = true

        add(viewController: viewController1)
        add(viewController: viewController2)
        add(viewController: viewController3)
        add(viewController: viewController4)

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
