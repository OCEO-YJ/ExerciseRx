//
//  HomeViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 10/30/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import UICircularProgressRing
import CoreMotion
import Dispatch


class HomeViewController: UIViewController  {
    @IBOutlet weak var dailyStepLabel: UILabel!
    @IBOutlet weak var stepDailyCount: UILabel!
    
    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var progressBar: UICircularProgressRing!
    
    
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    private var shouldStartUpdating: Bool = false
    private var startDate: Date? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUIs()
        didTapStartButton()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let startDate = startDate else { return }
        updateStepsCountLabelUsing(startDate: startDate)
    }

    func didTapStartButton() {
        shouldStartUpdating = !shouldStartUpdating
        shouldStartUpdating ? (onStart()) : (onStop())
    }

    
    func setUpUIs() {
        
        //Daily Step Count Goal toggle button
        
        view.backgroundColor = .white
        
        let purple = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)
//        stepCountLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 15)
//        stepCountLabel.textColor = purple
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

extension HomeViewController {
    private func onStart() {
//        startButton.setTitle("Stop", for: .normal)
        startDate = Date()
        checkAuthorizationStatus()
        startUpdating()
    }

    private func onStop() {
//        startButton.setTitle("Start", for: .normal)
        startDate = nil
        stopUpdating()
    }

    private func startUpdating() {
        if CMMotionActivityManager.isActivityAvailable() {
            startTrackingActivityType()
        } else {
//            activityTypeLabel.text = "Not available"
        }

        if CMPedometer.isStepCountingAvailable() {
            startCountingSteps()
        } else {
//            stepsCountLabel.text = "Not available"
        }
    }

    private func checkAuthorizationStatus() {
        switch CMMotionActivityManager.authorizationStatus() {
        case CMAuthorizationStatus.denied:
            onStop()
//            activityTypeLabel.text = "Not available"
//            stepsCountLabel.text = "Not available"
        default:break
        }
    }

    private func stopUpdating() {
        activityManager.stopActivityUpdates()
        pedometer.stopUpdates()
        pedometer.stopEventUpdates()
    }

    private func on(error: Error) {
        //handle error
    }

    private func updateStepsCountLabelUsing(startDate: Date) {
        pedometer.queryPedometerData(from: startDate, to: Date()) {
            [weak self] pedometerData, error in
            if let error = error {
                self?.on(error: error)
            } else if let pedometerData = pedometerData {
                DispatchQueue.main.async {
                    self?.stepDailyCount.text = String(describing: pedometerData.numberOfSteps)
                }
            }
        }
    }

    private func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) {
            [weak self] (activity: CMMotionActivity?) in
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.walking {
                    self?.dailyStepLabel.text = "Walking"
                } else if activity.stationary {
                    self?.dailyStepLabel.text = "Stationary"
                } else if activity.running {
                    self?.dailyStepLabel.text = "Running"
                } else if activity.automotive {
                    self?.dailyStepLabel.text = "Automotive"
                }
            }
        }
    }

    private func startCountingSteps() {
        pedometer.startUpdates(from: Date()) {
            [weak self] pedometerData, error in
            guard let pedometerData = pedometerData, error == nil else { return }

            DispatchQueue.main.async {
                self?.stepDailyCount.text = pedometerData.numberOfSteps.stringValue
            }
        }
    }
}
