//
//  ViewController.swift
//  WLAppleCalendar
//
//  Created by willard on 2017/9/17.
//  Copyright © 2017年 willard. All rights reserved.
//

import JTAppleCalendar
struct Schedule {
    var title: String
    var note: String
    var startTime: Date
    var endTime: Date
    var categoryColor: UIColor
}

// random events
extension Schedule {
    init(fromStartDate: Date, title: String) {
        self.title = title//["Meet Willard", "Buy a milk", "Read a book"].randomValue()
        note = ["Coffee Shop", "Skype", "On Campus"].randomValue()
        categoryColor = [.red, .orange, .purple, .blue, .black].randomValue()
        
        let day = 0//[Int](0...27).randomValue()
        let hour = 0//[Int](0...23).randomValue()
        let startDate = Calendar.current.date(byAdding: .day, value: day, to: fromStartDate)!
        
        
        startTime = Calendar.current.date(byAdding: .hour, value: hour, to: startDate)!
        endTime = Calendar.current.date(byAdding: .hour, value: 1, to: startTime)!
    }
}


extension Schedule : Equatable {
    static func ==(lhs: Schedule, rhs: Schedule) -> Bool {
        return lhs.startTime == rhs.startTime
    }
}

extension Schedule : Comparable {
    static func <(lhs: Schedule, rhs: Schedule) -> Bool {
        return lhs.startTime < rhs.startTime
    }
}
class CalenderViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var showTodayButton: UIBarButtonItem!
    
    @IBOutlet weak var separatorViewTopConstraint: NSLayoutConstraint!
    
    // MARK: DataSource
    var scheduleGroup : [String: [Schedule]]? {
        didSet {
            calendarView.reloadData()
            tableView.reloadData()
        }
    }
    
    var schedules: [Schedule] {
        get {
            guard let selectedDate = calendarView.selectedDates.first else {
                return []
            }
            
            guard let data = scheduleGroup?[self.formatter.string(from: selectedDate)] else {
                return []
            }
            
            return data.sorted()
        }
    }

    
    // MARK: Config
    let formatter = DateFormatter()
    let dateFormatterString = "yyyy MM dd"
    let numOfRowsInCalendar = 6
   // let numOfRandomEvent = 100
    let calendarCellIdentifier = "CellView"
    let scheduleCellIdentifier = "detail"
    
    var iii: Date?
    
    // MARK: Helpers
    var numOfRowIsSix: Bool {
        get {
            return calendarView.visibleDates().outdates.count < 7
        }
    }
    
    var currentMonthSymbol: String {
        get {
            let startDate = (calendarView.visibleDates().monthDates.first?.date)!
            let month = Calendar.current.dateComponents([.month], from: startDate).month!
            let monthString = DateFormatter().monthSymbols[month-1]
            return monthString
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViewNibs()
        showTodayButton.target = self
        showTodayButton.action = #selector(showTodayWithAnimate)
        showToday(animate: false)
        
        let gesturer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:)))
        calendarView.addGestureRecognizer(gesturer)
    }
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer) {
        let point = gesture.location(in: calendarView)
        guard let cellStatus = calendarView.cellStatus(at: point) else {
            return
        }
        
        if calendarView.selectedDates.first != cellStatus.date {
            calendarView.deselectAllDates()
            calendarView.selectDates([cellStatus.date])
        }
    }
    
    func setupViewNibs() {
        let myNib = UINib(nibName: "CellView", bundle: Bundle.main)
        calendarView.register(myNib, forCellWithReuseIdentifier: calendarCellIdentifier)
        
        
        let myNib2 = UINib(nibName: "ScheduleTableViewCell", bundle: Bundle.main)
        tableView.register(myNib2, forCellReuseIdentifier: scheduleCellIdentifier)
    }

    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first?.date else {
            return
        }
        
        let year = Calendar.current.component(.year, from: startDate)
        title = "\(year) \(currentMonthSymbol)"
    }
}

// MARK: Helpers
extension CalenderViewController {
    func select(onVisibleDates visibleDates: DateSegmentInfo) {
        guard let firstDateInMonth = visibleDates.monthDates.first?.date else
        { return }
        
        if firstDateInMonth.isThisMonth() {
            calendarView.selectDates([Date()])
        } else {
            calendarView.selectDates([firstDateInMonth])
        }
    }
}

// MARK: Button events
extension CalenderViewController {
    @objc func showTodayWithAnimate() {
        showToday(animate: true)
    }
    
    func showToday(animate:Bool) {
        calendarView.scrollToDate(Date(), triggerScrollToDateDelegate: true, animateScroll: animate, preferredScrollPosition: nil, extraAddedOffset: 0) { [unowned self] in
            // DANIEL: CALLING SCHEDULE
            self.getSchedule()
            self.calendarView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
                self.setupViewsOfCalendar(from: visibleDates)
            }
            
            self.adjustCalendarViewHeight()
            self.calendarView.selectDates([Date()])
        }
    }
}

// MARK: Dynamic CalendarView's height
extension CalenderViewController {
    func adjustCalendarViewHeight() {
        adjustCalendarViewHeight(higher: self.numOfRowIsSix)
    }
    
    func adjustCalendarViewHeight(higher: Bool) {
        separatorViewTopConstraint.constant = higher ? 0 : -calendarView.frame.height / CGFloat(numOfRowsInCalendar)
    }
}

// MARK: Prepere dataSource
extension CalenderViewController {
    /*func getSchedule() {
        if let startDate = calendarView.visibleDates().monthDates.first?.date  {
            let endDate = Calendar.current.date(byAdding: .month, value: 1, to: startDate)
            getSchedule(fromDate: startDate, toDate: endDate!, title: )
        }
    }*/


    func getSchedule(fromDate: Date, toDate: Date, title: String) {
        var schedules: [Schedule] = []
//        for _ in 1...numOfRandomEvent {
//            schedules.append(Schedule(fromStartDate: fromDate))
//        }
        //DANIEL: THIS IS WHERE AN EVENT GETS ITS TITLE/ IS INITIALIZED
        schedules.append(Schedule(fromStartDate: fromDate, title: title))

        scheduleGroup = schedules.group{self.formatter.string(from: $0.startTime)}
    }
}

func addEvent(date: Date, title: String){
    var schedules: [Schedule] = []
    schedules.append(Schedule(fromStartDate: date, title: title))
    scheduleGroup = schedules.group{self.formatter.string(from: $0.startTime)}
}


// MARK: CalendarCell's ui config
extension CalenderViewController {
    func configureCell(view: JTAppleCell?, cellState: CellState) {
        guard let myCustomCell = view as? CellView else { return }
        
        myCustomCell.dayLabel.text = cellState.text
        let cellHidden = cellState.dateBelongsTo != .thisMonth
        
        myCustomCell.isHidden = cellHidden
        myCustomCell.selectedView.backgroundColor = UIColor.black
        
        if Calendar.current.isDateInToday(cellState.date) {
            myCustomCell.selectedView.backgroundColor = UIColor.red
        }
        
        handleCellTextColor(view: myCustomCell, cellState: cellState)
        handleCellSelection(view: myCustomCell, cellState: cellState)
        
        if scheduleGroup?[formatter.string(from: cellState.date)] != nil {
            myCustomCell.eventView.isHidden = false
        }
        else {
            myCustomCell.eventView.isHidden = true
        }
    }
    
    func handleCellSelection(view: CellView, cellState: CellState) {
        view.selectedView.isHidden = !cellState.isSelected
    }
    
    func handleCellTextColor(view: CellView, cellState: CellState) {
        if cellState.isSelected {
            view.dayLabel.textColor = UIColor.white
        }
        else {
            view.dayLabel.textColor = UIColor.black
            if cellState.day == .sunday || cellState.day == .saturday {
                view.dayLabel.textColor = UIColor.gray
            }
        }
        
        if Calendar.current.isDateInToday(cellState.date) {
            if cellState.isSelected {
                view.dayLabel.textColor = UIColor.white
            }
            else {
                view.dayLabel.textColor = UIColor.red
            }
        }
    }
}

// MARK: JTAppleCalendarViewDataSource
extension CalenderViewController: JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = dateFormatterString
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2030 02 01")!
        
        let parameters = ConfigurationParameters(startDate: startDate,
                                                 endDate: endDate,
                                                 numberOfRows: numOfRowsInCalendar,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfGrid,
                                                 firstDayOfWeek: .sunday,
                                                 hasStrictBoundaries: true)
        return parameters
    }
}

// MARK: JTAppleCalendarViewDelegate
extension CalenderViewController: JTAppleCalendarViewDelegate {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: calendarCellIdentifier, for: indexPath) as! CellView
        configureCell(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: calendarCellIdentifier, for: indexPath) as! CellView
        configureCell(view: cell, cellState: cellState)
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
        if visibleDates.monthDates.first?.date == iii {
            return
        }
        
        iii = visibleDates.monthDates.first?.date
        
        getSchedule()
        select(onVisibleDates: visibleDates)
        
        view.layoutIfNeeded()
        
        adjustCalendarViewHeight()
        
        UIView.animate(withDuration: 0.5) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
        tableView.reloadData()
        tableView.contentOffset = CGPoint()
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        configureCell(view: cell, cellState: cellState)
    }
}

// MARK: UITableViewDataSource
extension CalenderViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: scheduleCellIdentifier, for: indexPath) as! ScheduleTableViewCell
        cell.selectionStyle = .none
        cell.schedule = schedules[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count
    }
}

// MARK: UITableViewDelegate
extension CalenderViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schedule = schedules[indexPath.row]
        
        print(schedule)
        print("schedule selected")
    }
}

