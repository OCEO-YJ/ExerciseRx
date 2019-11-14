//
//  DetailInformationViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/21/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import liquid_swipe

class DetailInformationViewController: LiquidSwipeContainerController, LiquidSwipeContainerDataSource {

    
    var viewControllers: [UIViewController] = {
        let firstPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "1")
        let secondPageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "2")
        var controllers: [UIViewController] = [firstPageVC, secondPageVC]
//        let vcColors: [UIColor] = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 1, green: 0.3529352546, blue: 0.2339158952, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),]
//        controllers.append(contentsOf: vcColors.map {
//            let vc = ColoredController()
//            vc.viewColor = $0
//            return vc
//        })
        return controllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = self

        // Do any additional setup after loading the view.
    }
    
    func numberOfControllersInLiquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController) -> Int {
        return viewControllers.count
    }
    
    func liquidSwipeContainer(_ liquidSwipeContainer: LiquidSwipeContainerController, viewControllerAtIndex index: Int) -> UIViewController {
        return viewControllers[index]
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
