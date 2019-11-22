//
//  MainViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/30/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import Parchment

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationController?.navigationBar.isTranslucent = false
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeView")
        HomeViewController.title = "Home"
        let MessageViewController = storyboard.instantiateViewController(withIdentifier: "MessageView")
        MessageViewController.title = "Message"
        let InfoViewController = storyboard.instantiateViewController(withIdentifier: "InfoView")
        InfoViewController.title = "StudyInfo"
        
        let ResourcesViewController = storyboard.instantiateViewController(withIdentifier: "Resources")
        ResourcesViewController.title = "Resources"
        
        let SettingViewController = storyboard.instantiateViewController(withIdentifier: "setting")
        SettingViewController.title = "Setting"

        
        // Make new Setting //
        
        // Calendar //
        
        // Swipe //
        let pagingViewController = FixedPagingViewController(viewControllers: [
          HomeViewController,
          MessageViewController,
          ResourcesViewController,
          InfoViewController,
          SettingViewController
        ])
        
        let purple = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)

        pagingViewController.selectedTextColor = purple
        pagingViewController.indicatorColor = purple
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        
        // Do any additional setup after loading the view.
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
