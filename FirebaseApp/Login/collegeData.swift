import Foundation

enum favorite{
    case yes
    case no
}

struct collegeData : CustomStringConvertible{//simple college stuct
    var name : String
    var actHigh : Int
    var actLow : Int
    var satHigh : Int
    var satLow : Int
    var accept : Double
    var state : String
    var city : String
    var studentPop : Int
    var tuition : Double
    var sups : [supDrafts]
    var fav : favorite
    
    init(name: String, actHigh: Int, actLow: Int, satHigh: Int, satLow: Int, accept: Double, state: String, city: String, studentPop: Int, tuition: Double, sups: [supDrafts], earlyAction: String?, earlyDecisionOne: String?, earlyDecisionTwo: String?, regularDecision: String?, fav: favorite = .no) {
        self.name = name
        self.actHigh = actHigh
        self.actLow = actLow
        self.satHigh = satHigh
        self.satLow = satLow
        self.accept = accept
        self.state = state
        self.city = city
        self.studentPop = studentPop
        self.tuition = tuition
        self.sups = sups
        self.fav = .no
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if earlyAction != nil {
            self.earlyAction = dateFormatter.date(from: earlyAction!)! as NSDate
        } else {
            self.earlyAction = nil
        }
        
        if earlyDecisionOne != nil {
            self.earlyDecisionOne = dateFormatter.date(from: earlyDecisionOne!)! as NSDate
        } else {
            self.earlyDecisionOne = nil
        }
        
        if earlyDecisionTwo != nil {
            self.earlyDecisionTwo = dateFormatter.date(from: earlyDecisionTwo!)! as NSDate
        } else {
            self.earlyDecisionTwo = nil
        }
        
        if regularDecision != nil {
            self.regularDecision = dateFormatter.date(from: regularDecision!)! as NSDate
        } else {
            self.regularDecision = nil
        }
    }
    
    var earlyAction: NSDate?
    var earlyDecisionOne: NSDate?
    var earlyDecisionTwo: NSDate?
    var regularDecision: NSDate?
    
    
    var description: String {
        return "\(name) (\(city), \(state))\nAverage ACT/SAT/Acceptance: \(actLow)-\(actHigh)/\(satLow)-\(satHigh)/\(accept)\nStudent Body Size: \(studentPop)\nTuition: \(tuition)\n"
    }
}
