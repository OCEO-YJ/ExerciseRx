//
//  practiceViewController.swift
//  ExerciseRx
//
//  Created by OCEO on 11/6/19.
//  Copyright © 2019 OCEO. All rights reserved.
//

import UIKit
import TimelineTableViewCell

class timeSelectionViewController: UITableViewController {


    var data:[Int: [(TimelinePoint, UIColor, String, String, String?, [String]?, String?)]] =
        [0:[
            (TimelinePoint(), UIColor.black, "7:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "1:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "2:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "3:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "4:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "5:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "6:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "7:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 PM", "", nil, nil, "Sun")],
         1:[
            (TimelinePoint(), UIColor.black, "7:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "1:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "2:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "3:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "4:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "5:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "6:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "7:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 PM", "", nil, nil, "Sun")],
         2:[
            (TimelinePoint(), UIColor.black, "7:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "1:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "2:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "3:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "4:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "5:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "6:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "7:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 PM", "", nil, nil, "Sun")],
         3:[
            (TimelinePoint(), UIColor.black, "7:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "1:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "2:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "3:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "4:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "5:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "6:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "7:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 PM", "", nil, nil, "Sun")],
         4:[
            (TimelinePoint(), UIColor.black, "7:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "1:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "2:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "3:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "4:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "5:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "6:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "7:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 PM", "", nil, nil, "Sun")],
         5:[
            (TimelinePoint(), UIColor.black, "7:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "1:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "2:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "3:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "4:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "5:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "6:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "7:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 PM", "", nil, nil, "Sun")],
         6:[
            (TimelinePoint(), UIColor.black, "7:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "10:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "11:00 AM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "12:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "1:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "2:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "3:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "4:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "5:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "6:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "7:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "8:00 PM", "", nil, nil, "Sun"),
            (TimelinePoint(), UIColor.black, "9:00 PM", "", nil, nil, "Sun")]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bundle = Bundle(for: TimelineTableViewCell.self)
        let nibUrl = bundle.url(forResource: "TimelineTableViewCell", withExtension: "bundle")
        let timelineTableViewCellNib = UINib(nibName: "TimelineTableViewCell",
            bundle: Bundle(url: nibUrl!)!)
        tableView.register(timelineTableViewCellNib, forCellReuseIdentifier: "TimelineTableViewCell")

        // Do any additional setup after loading the view.
    }
     override func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return data.count
     }

     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
         guard let sectionData = data[section] else {
             return 0
         }
         return sectionData.count
     }
     
     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Monday"
        case 1:
            return "Tuesday"
        case 2:
            return "Wednesday"
        case 3:
            return "Thursday"
        case 4:
            return "Friday"
        case 5:
            return "Saturday"
        case 6:
            return "Sunday"
        default:
            return ""
        }
        
     }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell

         // Configure the cell...
         guard let sectionData = data[indexPath.section] else {
             return cell
         }
         
         let (timelinePoint, timelineBackColor, title, description, lineInfo, thumbnails, illustration) = sectionData[indexPath.row]
         var timelineFrontColor = UIColor.clear
         if (indexPath.row > 0) {
             timelineFrontColor = sectionData[indexPath.row - 1].1
         }
        

         cell.timelinePoint = timelinePoint
         cell.timeline.frontColor = timelineFrontColor
         cell.timeline.backColor = timelineBackColor
         cell.titleLabel.text = title
         cell.descriptionLabel.text = description
         cell.lineInfoLabel.text = lineInfo
         cell.lineInfoLabel.textColor = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)

         if let thumbnails = thumbnails {
             cell.viewsInStackView = thumbnails.map { thumbnail in
                 return UIImageView(image: UIImage(named: thumbnail))
             }
         }
         else {
             cell.viewsInStackView = []
         }

         if let illustration = illustration {
             cell.illustrationImageView.image = UIImage(named: illustration)
         }
         else {
             cell.illustrationImageView.image = nil
         }
    
         return cell
     }
     
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         guard var sectionData = data[indexPath.section] else {
             return
         }

//        let indexPaths = tableView.indexPathForSelectedRow //optional, to get from any UIButton for example
//
        let indexPathe = IndexPath(row: 0, section: 0)
//        print(indexPath)
//        let cell = tableView.cellForRow(at: indexPathe)
//        cell?.backgroundColor = .green
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        let cell:TimelineTableViewCell = tableView.cellForRow(at: indexPath) as! TimelineTableViewCell


        if(data[indexPath.section]?[indexPath.row].4 == "Marked"){
            cell.lineInfoLabel.text = ""
            data[indexPath.section]?[indexPath.row].4 = ""
        }else{
            
            let purple = UIColor(red: 51/255, green: 0/255, blue: 111/255, alpha: 1)
            cell.lineInfoLabel.text = "Marked"
            cell.lineInfoLabel.textColor = purple
            data[indexPath.section]?[indexPath.row].4 = "Marked"
        }
        
//        print(a)

//        let currentCell = tableView.section
//        currentCell?.backgroundColor = .green

//         print(sectionData[indexPath.row])
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
