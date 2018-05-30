import Foundation

class interview : CustomStringConvertible {
    var date: NSDate
    var status: IntStatus
    var location: String
    
    init(date: String, location: String, status: Int){
        self.location = location
        
        self.status = IntStatus(rawValue: status)!
        
        let dateForm = DateFormatter()
        dateForm.dateFormat = "yyyy-MM-dd HH:mm"
        self.date = dateForm.date(from: date)! as NSDate
    }
    
    enum IntStatus: Int {
        case needToSchedule, needToPrep, done
    }
    
    var description: String{
        return "Interview Date: \(date)\tLocation: \(location)\tStatus: \(status)"
    }
}

