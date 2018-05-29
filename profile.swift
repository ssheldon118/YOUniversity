import Foundation

class profile : CustomStringConvertible {//collection of statuses
    
    var name : String
    var cDatabase = collegeDatabase()
    var mycoleges : [String : status] = [:]
    var recLetters: [recLet] = []  //array of recs
    var essay : supDrafts = supDrafts(prompt: "The lessons we take from obstacles we encounter can be fundamental to later success. Recount a time when you faced a challenge, setback, or failure. How did it affect you, and what did you learn from the experience?", maxword: 650, minword: 250, draft: nil, status: 0)
    
    init(name: String){
        self.name = name
    }
    
    func addCollege(name: String) {
        
        var supForAddedCollege : [supDrafts] = []
        
        guard cDatabase.allColleges.keys.contains(name) else {
            print("\(name) is not in our Database")
            return
        }
        for i in 0..<cDatabase.allColleges[name]!.sups.count {
            supForAddedCollege.append(supDrafts(prompt: cDatabase.allColleges[name]!.sups[i].prompt, maxword: cDatabase.allColleges[name]!.sups[i].maxWord, minword: cDatabase.allColleges[name]!.sups[i].minWord, draft: cDatabase.allColleges[name]!.sups[i].draft, status: cDatabase.allColleges[name]!.sups[i].status.rawValue))
        }
        
        
        mycoleges[name] = status(forCollege: name, sentscores: [], supDrafts: supForAddedCollege)
    }
    
    func removeCollege(name: String) {
        mycoleges.removeValue(forKey: name)
    }
    
    func addRecLet(author: String, subject: String, status: Int){
        recLetters.append(recLet(nameOfWriter: author, writersubject: subject, status: status))
    }
    
    func removeRecLet(author: String){
        var index : Int = 0
        
        for i in 0..<recLetters.count{
            if recLetters[i].nameOfWriter == author {
                index = i
            }
        }
        
        recLetters.remove(at: index)
    }
    
    func changeRecLetStatus(author: String, newStatus: Int){
        var index : Int = 0
        
        for i in 0..<recLetters.count{
            if recLetters[i].nameOfWriter == author {
                index = i
            }
        }
        
        recLetters[index].status = recLet.RecStatus(rawValue: newStatus)!
    }
    
    func writeEssay(newDraft: String){
        essay.draft = newDraft
    }
    
    func changeEssayStatus(newStatus: Int){
        essay.status = supDrafts.SupStatus(rawValue: newStatus)!
    }
    
    var sortedkeys : [String] {
        let str = mycoleges.keys.sorted { (firstKey, secondKey) -> Bool in
            return (cDatabase.allColleges[firstKey]?.name)! <= (cDatabase.allColleges[secondKey]?.name)!}
        
        return str
    }
    
    /*func enterScores(numbOfTests: Int) -> [status.StandardizedTests] {
     var test = 0 //GET FROM USER
     var array : [status.StandardizedTests] = []
     for _ in 0..<numbOfTests {
     array.append(status.StandardizedTests(rawValue: test)!)
     }
     return array
     }*/
    
    func formatStatus(status: status) -> String{
        //return fit(status.forCollege, 23) + "  " + fit("\(status.numbOfLetters)", 15) + fit("WORKING", 7) + fit("\(status.suppCount)", 7) + fit("\(status.supplimentDrafts)", 7) + fit("\(status.platfrom)", 7) + fit("\(status.releaseTransQ)", 9) + fit("\(status.sentScores)", 13) + fit("\(status.intStatus)", 13) + fit("\(status.interview)", 11) + "\n"
        return "not done"
    }
    
    func fit (_ s: String, _ size: Int, right: Bool = true) -> String{
        var result = ""
        let sSize = s.characters.count
        if sSize == size {return s}
        var count = 0
        if size < sSize {
            for c in s.characters {
                if count < size {result.append(c)}
                count += 1
            }
            return result
        }
        
        result = s
        var addon = ""
        let num = size - sSize
        for _ in 0..<num {addon.append(" ")}
        if right {return result + addon}
        return addon + result
    }
    
    var description: String {
        guard mycoleges.count != 0 else {
            return "\(name) is not applying anywhere yet!"
        }
        var str = "\(name)'s college application status information: \n\n"
        str += fit("College", 25) + fit("Numb. of Let.", 15) + fit("recs", 7) + fit("#sup", 7) + fit("dsup", 7) + fit("CA?", 7) + fit("sndtrns", 9) + fit("Sent Scores", 13) + fit("Intv. Prep", 13) + fit("Interview?", 11) + "\n\n"
        for i in sortedkeys {
            str += formatStatus(status: mycoleges[i]!)
        }
        return str
    }
}

