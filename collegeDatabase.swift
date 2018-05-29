import Foundation

class collegeDatabase : CustomStringConvertible {
    var allColleges : [String : collegeData] = [
        "Princeton" : collegeData(name: "Princeton University", actHigh: 35, actLow: 32, satHigh: 1590, satLow: 1400, accept: 7.0, state: "NJ", city: "Princeton", studentPop: 5400, tuition: 47140, sups: [supDrafts.init(prompt: "Using one of the themes below as a starting point, write about a person, event, or experience that helped you define one of your values or in some way changed how you approach the world. Please do not repeat, in full or in part, the essay you wrote for the Common Application.", maxword: 650, minword: 250, draft: nil, status: 0), supDrafts.init(prompt: "Please briefly elaborate on one of your extracurricular activities or work experiences that was particularly meaningful to you.", maxword: 250, minword: 100, draft: nil, status: 0), supDrafts.init(prompt: "Please tell us how you have spent the last two summers (or vacations between school years), including any jobs you have held.", maxword: 250, minword: 100, draft: nil, status: 0)], earlyAction: "2018-11-01", earlyDecisionOne: nil, earlyDecisionTwo: nil, regularDecision: "2019-01-01"),
        
        "Harvard": collegeData(name: "Harvard University", actHigh: 35, actLow: 32, satHigh: 1600, satLow: 1430, accept: 5.0, state: "MA", city: "Cambridge", studentPop: 9915, tuition: 48949, sups: [supDrafts.init(prompt: "Please briefly elaborate on one of your extracurricular activities or work experiences.", maxword: 150, minword: 50, draft: nil, status: 0), supDrafts.init(prompt: "Please use the space below to list additional intellectual activities that you have not mentioned or detailed elsewhere in your application.", maxword: 150, minword: 0, draft: nil, status: 0), supDrafts.init(prompt: "You may wish to include an additional essay if you feel that the college application forms do not provide sufficient opportunity to convey important information about yourself or your accomplishments.", maxword: 10000, minword: 0, draft: nil, status: 0)], earlyAction: "2018-11-01", earlyDecisionOne: nil, earlyDecisionTwo: nil, regularDecision: "2019-01-01"),
       /*
        "University of Chicago": collegeData(name: "Harvard", actHigh: 35, actLow: 32, satHigh: 1600, satLow: 1430, accept: 5.0, state: "MA", city: "Cambridge", studentPop: 9915, tuition: 48949, sups: [supDrafts.init(prompt: "In the spirit of adventurous inquiry, pose your own question or choose one of our past prompts. Be original, creative, thought provoking. Draw on your best qualities as a writer, thinker, visionary, social critic, sage, citizen of the world, or future citizen of the University of Chicago; take a little risk, and have fun.", maxword: 10000, minword: 0, draft: nil, status: 0)], earlyAction: "2018-11-01", earlyDecisionOne: "2018-11-01", earlyDecisionTwo: "2019-01-08", regularDecision: "2019-01-08"),
        */
        "Yale": collegeData(name: "Yale University", actHigh: 35, actLow: 32, satHigh: 1600, satLow: 1420, accept:
            6.0, state: "CT", city: "New Haven", studentPop: 5472, tuition: 51400, sups: [supDrafts.init(prompt: "What is it about Yale that has led you to apply?", maxword: 125, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "Reflect on your engagement with a community to which you belong. How do you feel you have contributed to this community?", maxword: 250, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "What do you most enjoy learning?", maxword: 250, minword: 1, draft: nil, status: 0)], earlyAction: "2018-11-01", earlyDecisionOne: nil, earlyDecisionTwo: nil, regularDecision: "2019-01-02"),
        
        "Columbia": collegeData(name: "Columbia University", actHigh: 35, actLow: 32, satHigh: 1590, satLow: 1410, accept: 7.0, state: "NY", city: "New York", studentPop: 8124, tuition: 44864, sups: [supDrafts.init(prompt: "List a few words or phrases that describe your ideal college community.", maxword: 150, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "List the titles of the required readings from courses during the school year or summer that you enjoyed most in the past year.", maxword: 150, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "List the titles of the books you read for pleasure that you enjoyed most in the past year.", maxword: 150, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "List the titles of the print, electronic publications and websites you read regularly.", maxword: 150, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "List the titles of the films, concerts, shows, exhibits, lectures and other entertainments you enjoyed most in the past year.", maxword: 150, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "Please tell us what you value most about Columbia and why.", maxword: 300, minword: 1, draft: nil, status: 0)], earlyAction: nil, earlyDecisionOne: "2018-11-01", earlyDecisionTwo: nil, regularDecision: "2019-01-01"),
        
        "Stanford" : collegeData(name: "Stanford University", actHigh: 35, actLow: 31, satHigh: 1580, satLow: 1380, accept: 5.0, state: "CA", city: "Stanford", studentPop: 7034, tuition: 48987, sups: [supDrafts.init(prompt: "What is the most significant challenge that society faces today?", maxword: 50, minword: 3, draft: nil, status: 0), supDrafts.init(prompt: "How did you spend your last two summers?", maxword: 50, minword: 3, draft: nil, status: 0), supDrafts.init(prompt: "What historical moment or event do you wish you could have witnessed?", maxword: 50, minword: 3, draft: nil, status: 0), supDrafts.init(prompt: "The Stanford community is deeply curious and driven to learn in and out of the classroom. Reflect on an idea or experience that makes you genuinely excited about learning.", maxword: 250, minword: 100, draft: nil, status: 0), supDrafts.init(prompt: "Virtually all of Stanford's undergraduates live on campus. Write a note to your future roommate that reveals something about you or that will help your roommate -- and us -- know you better.", maxword: 250, minword: 100, draft: nil, status: 0)], earlyAction: "2018-11-01", earlyDecisionOne: nil, earlyDecisionTwo: nil, regularDecision: "2019-01-02"),
        
        "University of Pennsylvania" : collegeData(name: "University of Pennsylvania", actHigh: 35, actLow: 32, satHigh: 1570, satLow: 1380, accept: 9.0, state: "PA", city: "Philadelphia", studentPop: 11716, tuition: 33604, sups: [supDrafts.init(prompt: "How will you explore your intellectual and academic interests at the University of Pennsylvania? Please answer this question given the specific undergraduate school to which you are applying.", maxword: 650, minword: 400, draft: nil, status: 0)], earlyAction: nil, earlyDecisionOne: "2018-11-01", earlyDecisionTwo: nil, regularDecision: "2019-01-05"),
        
        "Duke" : collegeData(name: "Duke University", actHigh: 34, actLow: 31, satHigh: 1570, satLow: 1380, accept: 11.0, state: "NC", city: "Durham", studentPop: 6609, tuition: 51480, sups: [supDrafts.init(prompt: "If you are applying to the Trinity College of Arts and Sciences as a first year applicant, please discuss why you consider Duke a good match for you. Is there something particular about Duke that attracts you?", maxword: 150, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "If you'd like to share a perspective you bring or experiences you've had to help us understand you better-perhaps related to a community you belong to or your family or cultural background-we encourage you to do so.", maxword: 250, minword: 0, draft: nil, status: 0), supDrafts.init(prompt: "If you would like to share with us more about either, and have not done so elsewhere in the application, we invite you to do so here.", maxword: 250, minword: 0, draft: nil, status: 0)], earlyAction: nil, earlyDecisionOne: "2018-11-01", earlyDecisionTwo: nil, regularDecision: "2019-01-02"),
        
        "California Institute of Technology" : collegeData(name: "California Institute of Technology", actHigh: 36, actLow: 34, satHigh: 1600, satLow: 1510, accept: 8.0, state: "CA", city: "Pasadena", studentPop: 979, tuition: 48111, sups: [supDrafts.init(prompt: "While seemingly simple, questions of ethics, honesty and integrity are sometimes puzzling. Share a difficult situation that has challenged you. What was your response, and how did you arrive at a solution?", maxword: 200, minword: 5, draft: nil, status: 0), supDrafts.init(prompt: "Please describe an unusual way in which you have fun.", maxword: 200, minword: 5, draft: nil, status: 0), supDrafts.init(prompt: "How do you see yourself contributing to the diversity of Caltech's community?", maxword: 200, minword: 5, draft: nil, status: 0), supDrafts.init(prompt: "Scientific exploration clearly excites you. Beyond our 3:1 student-to-faculty ratio and our intense focus on research opportunities, how do you believe Caltech will best fuel your intellectual curiosity and help you meet your goals?", maxword: 500, minword: 5, draft: nil, status: 0)], earlyAction: "2018-11-01", earlyDecisionOne: nil, earlyDecisionTwo: nil, regularDecision: "2019-01-03"),
        
        "Dartmouth" : collegeData(name: "Dartmouth College", actHigh: 34, actLow: 30, satHigh: 1560, satLow: 1350, accept: 11.0, state: "NH", city: "Hanover", studentPop: 4310, tuition: 51468, sups: [supDrafts.init(prompt: "As you seek admission to the Class of 2022, what aspects of the College’s program, community, or campus environment attract your interest?", maxword: 100, minword: 1, draft: nil, status: 0), supDrafts.init(prompt: "From songs and film to formulae and computer code, human expression and discovery take many forms. How do you express your creativity? What ideas or values do you explore and celebrate when your imagination wanders?", maxword: 300, minword: 250, draft: nil, status: 0)], earlyAction: nil, earlyDecisionOne: "2018-11-01", earlyDecisionTwo: nil, regularDecision: "2019-01-01"),
        
        "Johns Hopkins University" : collegeData(name: "Johns Hopkins University", actHigh: 34, actLow: 32, satHigh: 1570, satLow: 1400, accept: 13.0, state: "MD", city: "Baltimore", studentPop: 6042, tuition: 52170, sups: [supDrafts.init(prompt: "Talk about a time, in or outside the classroom, when you worked with others and what you learned from the experience.", maxword: 400, minword: 300, draft: nil, status: 0)], earlyAction: nil, earlyDecisionOne: "2018-11-01", earlyDecisionTwo: nil, regularDecision: "2019-01-03")]
                                                
                                                /*"MIT": collegeData(name: "Massachusetts Institute of Technology", actHigh: 35, actLow: 33, satHigh: 1590, satLow: 1460, accept: 8.0, state: "MA", city: "Boston", studentPop: 4524, tuition: 49580),
                                                "Johns Hopkins": collegeData(name: "Johns Hopkins University", actHigh: 34, actLow: 32, satHigh: 1570, satLow: 1400, accept: 13.0, state: "MD", city: "Baltimore", studentPop: 6042, tuition: 52170),
                                                "Northwestern": collegeData(name: "Northwestern University", actHigh: 34, actLow: 32, satHigh: 1560, satLow: 1400, accept: 11.0, state: "IL", city: "Evanston", studentPop: 8791, tuition: 52239),
                                                "Brown": collegeData(name: "Brown University", actHigh: 34, actLow: 31, satHigh: 1570, satLow: 1370, accept: 9.0, state: "RI", city: "Providence", studentPop: 6926, tuition: 51400),
                                                "Cornell": collegeData(name: "Cornell University", actHigh: 34, actLow: 31, satHigh: 1530, satLow: 1330, accept: 14.0, state: "NY", city: "Ithaca", studentPop: 14566, tuition: 29500),
                                                "Rice": collegeData(name: "Rice University", actHigh: 35, actLow: 32, satHigh: 1570, satLow: 1410, accept: 15.0, state: "TX", city: "Houston", studentPop: 3893, tuition: 37833),
                                                "Vanderbilt": collegeData(name: "Vanderbilt University", actHigh: 35, actLow: 32, satHigh: 1590, satLow: 1420, accept: 11.0, state: "TN", city: "Nashville", studentPop: 6871, tuition: 45840),
                                                "Notre Dame": collegeData(name: "University of Notre Dame", actHigh: 35, actLow: 32, satHigh: 1540, satLow: 1350, accept: 19.0, state: "IN", city: "Notre Dame", studentPop: 8530, tuition: 50864),
                                                "WashingtonU": collegeData(name: "Washington University in St. Louis", actHigh: 34, actLow: 32, satHigh: 1570, satLow: 1400, accept: 17.0, state: "MO", city: "St. Louis", studentPop: 7555, tuition: 50650),
                                                "Georgetown": collegeData(name: "Georgetown University", actHigh: 34, actLow: 30, satHigh: 1520, satLow: 1320, accept: 17.0, state: "DC", city: "Washington", studentPop: 7453, tuition: 47880),
                                                "Emory": collegeData(name: "Emory University", actHigh: 33, actLow: 30, satHigh: 1500, satLow: 1390, accept: 25.0, state: "GA", city: "Atlanta", studentPop: 6861, tuition: 40800),
                                                "UCBerk": collegeData(name: "University of California Berkeley", actHigh: 34, actLow: 31, satHigh: 1540, satLow: 1270, accept: 17.0, state: "CA", city: "Berkeley", studentPop: 29310, tuition: 42184),
                                                "UCLA": collegeData(name: "University of California Los Angeles", actHigh: 33, actLow: 28, satHigh: 1470, satLow: 1160, accept: 18.0, state: "CA", city: "Los Angeles", studentPop: 30873, tuition: 41275),
                                                "USouthern Cali": collegeData(name: "University of Southern California", actHigh: 33, actLow: 30, satHigh: 1500, satLow: 1280, accept: 17.0, state: "CA", city: "Los Angeles", studentPop: 18794, tuition: 43200),
                                                "Carnegie Mellon": collegeData(name: "Carnegie Mellon University", actHigh: 34, actLow: 31, satHigh: 1550, satLow: 1380, accept: 22.0, state: "PA", city: "Pittsburgh", studentPop: 6283, tuition: 42563)*/
    
    var sortedkeys : [String] {
        let str = allColleges.keys.sorted(by: { (firstKey, secondKey) -> Bool in
            return (allColleges[firstKey]?.name)! <= (allColleges[secondKey]?.name)!})
        return str
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
    
    func formatCollege(col: collegeData) -> String{
        return fit(col.name, 23) + "  " + fit("\(col.city),", 15) + "\(col.state)  " + fit("\(col.actLow)-\(col.actHigh)", 7) + fit("\(col.satLow)-\(col.satHigh)", 11) + fit("\(col.accept)", 7) + fit("\(col.studentPop)", 7) + fit("\(col.tuition)", 8) + "\n"
        
    }
    
    var description: String {
        var str = fit("College", 25) + fit("Location", 20) + fit("ACT", 9) + fit("SAT", 8) + fit("Acpt%", 7) + fit("Size", 7) + fit("Tuition", 8) + "\n\n"
        for i in collegeDatabase.init().sortedkeys {
            str += formatCollege(col: allColleges[i]!)
        }
        return str
        
    }
}
