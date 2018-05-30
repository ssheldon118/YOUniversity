import Foundation

class supDrafts : CustomStringConvertible {
    
    var prompt : String
    var maxWord : Int
    var minWord : Int
    var draft : String?
    var status : SupStatus
    
    init(prompt: String, maxword: Int, minword: Int, draft: String?, status: Int){
        self.prompt = prompt
        self.maxWord = maxword
        self.minWord = minword
        self.draft = draft
        self.status = SupStatus(rawValue: status)!
    }
    
    enum SupStatus: Int {
        case needToStart, started, firstDraft, needToEdit, needToConvertFromOtherSup, done
    }
    
    var description: String {
        return "\(prompt) (\(minWord)-\(maxWord))\nstatus: \(status)\nDraft: \(draft)\n\n\n"
    }
    
    
    
}

