import Foundation

class recLet : CustomStringConvertible{
    var nameOfWriter: String
    var writerSubject: String
    var status: RecStatus
    
    init(nameOfWriter: String, writersubject: String, status: Int){
        self.nameOfWriter = nameOfWriter
        self.writerSubject = writersubject
        self.status = RecStatus(rawValue: status)!
    }
    
    enum RecStatus: Int {
        case needToAsk, asked, formsToDo, needToFollowUp, submitted
    }
    
    var description: String {
        return nameOfWriter + "\(status)"
    }
}
