import Foundation

class scoresStatus: CustomStringConvertible {
    var test: String
    var clarifier: String
    var status: ScoreStatus
    
    init(test: String, clarifier: String, status: Int){
        self.test = test
        self.clarifier = clarifier
        self.status = ScoreStatus(rawValue: status)!
    }
    
    enum ScoreStatus: Int {
        case needToSignUp, needToStudy, needToTake, taken, sent
    }
    
    var description: String {
        return "\(test) (\(clarifier)) status: \(status)"
    }
}
