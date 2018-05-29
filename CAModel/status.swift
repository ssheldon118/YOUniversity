import Foundation

class status : CustomStringConvertible {//mutable status class (simple)
    var forCollege : String
    var testScores: [scoresStatus] = []                  //whether they have sent scores or naw\
    var supplimentDrafts: [supDrafts] = []                    //status of supps ENUM
    var releaseTransQ : Bool = false             //whether or not they have released their transcript
    var intview : interview? = nil               //interview status OPTIONAL ENUM
    
    init(forCollege: String, sentscores: [StandardizedTests], supDrafts: [supDrafts]){
        self.forCollege = forCollege
        self.supplimentDrafts = supDrafts
    }
    
    enum StandardizedTests: Int {
        case AP, SAT, ACT, SAT2
    }
    
    func addStandardizedTest(test: String, clarifier: String, status: Int) {
        testScores.append(scoresStatus(test: test, clarifier: clarifier, status: status))
    }
    
    func changeTestStatus(identity: String, newStatus: Int){//MAKE THE IDENTITY THE TEST NAME + CLARIFIER, SEPARATED BY SPACE
        var index : Int = 0
        
        for i in 0..<testScores.count{
            
            if "\(testScores[i].test) \(testScores[i].clarifier)" == identity {
                index = i
            }
        }
        
        testScores[index].status = scoresStatus.ScoreStatus(rawValue: newStatus)!
    }
    
    func removeTest(identity: String){
        var index : Int = 0
        
        for i in 0..<testScores.count{
            
            if "\(testScores[i].test) \(testScores[i].clarifier)" == identity {
                index = i
            }
        }
        
        testScores.remove(at: index)
    }
    
    func writeSup(indexOfSup: Int, newDraft: String) {
        supplimentDrafts[indexOfSup].draft = newDraft
    }
    
    func changeSupStatus(indexOfSup: Int, newStatus: Int){
        supplimentDrafts[indexOfSup].status = supDrafts.SupStatus(rawValue: newStatus)!
    }
    
    func togReleaseTrans(){
        if releaseTransQ {
            releaseTransQ = false
        } else {
            releaseTransQ = true
        }
    }
    
    func setInterv(date: String, location: String, status: Int){
        intview = interview(date: date, location: location, status: status)
    }
    
    func changeIntervDate(newDate: String){
        let oldInterv = intview!
        
        intview = interview(date: newDate, location: oldInterv.location, status: oldInterv.status.rawValue)
    }
    
    func changeIntervLoc(newLocation: String){
        intview!.location = newLocation
    }
    
    func changeIntervStatus(newStatus: Int){
        intview!.status = interview.IntStatus(rawValue: newStatus)!
    }
    
    var description: String {
        //return "Applying to: \(forCollege)\nHave Supps/#Done: \t \(supp)/\(supStatus)\nHave Interview/Prep: \t \(intStatus)/\(interview)\nSent Transcripts/rec letters: \t \(releaseTransQ)/\(numbOfLetters) \nIs this college on CA: \t \(platform)"
        //return "not done"
        return "Applying to: \(forCollege)"//Have Supps/#Done: \t \(supplimentDrafts)"
    }
}
