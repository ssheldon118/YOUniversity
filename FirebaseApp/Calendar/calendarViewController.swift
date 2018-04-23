//
//  calendarViewController.swift
//  FirebaseApp
//
//  Created by Stevie Sheldon on 4/5/18.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import Foundation
import JTAppleCalendar

class calendarViewController: UIViewController, JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate{
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "sampleCell", for: indexPath) as! sampleCell
        
        cell.dateLabel.text = cellState.text
        
        return cell
    }
    
    
    let formatter = DateFormatter()
    
  
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy mm dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 01 01")!
        let endDate = formatter.date(from: "2018 12 31")!
        
        let parameters = ConfigurationParameters(startDate: startDate,  endDate: endDate)
        return parameters
    }
}
