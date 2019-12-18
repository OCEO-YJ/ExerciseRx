//
//  MainQViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/14/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import ScrollingStackViewController
import FirebaseAuth
import FirebaseDatabase
import Firebase
import FirebaseFirestore

protocol MainQVCDelegate {
    func getUser(data: User)
}

class MainQViewController: ScrollingStackViewController {

    @IBOutlet weak var startButton: UIButton!
    var delegate: MainQVCDelegate?
    var user = User()
    
    var docRefUser: DocumentReference!
    var docRefData: DocumentReference!

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.delegate?.getUser(data: user)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let viewController0 = storyboard.instantiateViewController(withIdentifier: "zero") as! IntroViewController
        viewController0.delegate = self
        viewController0.view.heightAnchor.constraint(equalToConstant: 550).isActive = true

        let viewController1 = storyboard.instantiateViewController(withIdentifier: "first") as! FirstQViewController
        viewController1.delegate = self
        viewController1.view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        let viewController2 = storyboard.instantiateViewController(withIdentifier: "second") as! SecondQViewController
        viewController2.delegate = self
        viewController2.view.heightAnchor.constraint(equalToConstant: 500).isActive = true

        let viewController3 = storyboard.instantiateViewController(withIdentifier: "third") as! ThridQViewController
        viewController3.delegate = self
        viewController3.view.heightAnchor.constraint(equalToConstant: 550).isActive = true

        let viewController4 = storyboard.instantiateViewController(withIdentifier: "fourth") as! FourthQViewController
        viewController4.delegate = self
        viewController4.view.heightAnchor.constraint(equalToConstant: 750).isActive = true
        
        let viewController5 = storyboard.instantiateViewController(withIdentifier: "five") as! FifthQViewController
        viewController5.view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 150, right: 0)

        add(viewController: viewController0)
        add(viewController: viewController1)
        add(viewController: viewController2)
        add(viewController: viewController3)
        add(viewController: viewController4)
        add(viewController: viewController5, edgeInsets: insets)
        
        startButton.titleLabel?.text = "Start"
        startButton.addTarget(self, action: #selector(startButtonTouchUpInside), for: .touchUpInside)
        view.bringSubviewToFront(startButton)
        
        
    }
    

    @objc func startButtonTouchUpInside(_ sender: Any) {
        
        print("Clicked")
        let userEmail = "\(user.first_name!)\(user.last_name!)@exerciserx.com"
        print(userEmail)
        let userPW = "\(user.birth_date!))-\(user.last_name!))"
        
        Auth.auth().createUser(withEmail: userEmail, password: userPW) { (result, error) in
            if let error = error {
                print("Failed to create a user", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else {return}
            
            self.docRefUser = Firestore.firestore().collection("ExerciseRxUserData").document(uid)

            let userInfo = ["height": self.user.height, "weight":"\(self.user.weight!) LB",
            "medicalsex":self.user.medical_sex, "ethnicity":self.user.ethnicity,
            "question1":self.user.q1_engage, "question2":self.user.q2_exercistTime,
            "question3":self.user.q3_reaseon, "question4":self.user.q4_barrier]
            
            
            self.docRefUser.setData(userInfo as [String : Any]) { (error) in
                if let error = error {
                    print("Got an error: \(error.localizedDescription)")
                } else{
                    print("Success")
                }
            }
            
            let values = ["name":self.user.name, "first_name": self.user.first_name, "last_name":self.user.last_name,
                          "birth_date": self.user.birth_date]

            Database.database().reference().child("users").child(uid).updateChildValues(values as [AnyHashable : Any], withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Failed to update database values with error: ", error.localizedDescription)
                    return
                }
                print("Success")
                self.performSegue(withIdentifier: "gotoMain", sender: nil)
            })
            
            
        }
    }
}

extension MainQViewController: IntroVCDelegate, FirstVCDelegate, SecondVCDelegate, ThridVCDelegate, FourthVCDelegate{
    
    
    func getMedicalSex(data: [String : Any]) {
        user.medical_sex = data["medicalSex"] as? String
        user.ethnicity = (data["ethnicity"] as! [String]).joined(separator: " / ")
        
    }
    
    func getQ1(data: String) {
        user.q1_engage = data
        
    }
    
    func getQ2(data: String) {
        user.q2_exercistTime = data
    }
    
    func getQ3(data: [String : Any]) {
        user.q3_reaseon = (data["reasons"] as! [String]).joined(separator: " / ")
    }
    
    func getQ4(data: [String : Any]) {
        user.q4_barrier = (data["reasons"] as! [String]).joined(separator: " / ")
    }


}
