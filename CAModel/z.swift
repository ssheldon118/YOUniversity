import Foundation

var data = collegeDatabase()

// creates a profile with name seth
var pro = profile(name: "seth")

// adds college to the user profile
// can be implemented with search bar in UI
// already error checks if college is in database
pro.addCollege(name: "Yale")

// print out of colleges user is interested in
print(pro.mycoleges)

// prints out all colleges in the database
print(data)

// allows user to update their status for tests they have taken
// test takes types "AP, SAT, ACT, SAT2"
// status has values "needToSignUp, needToStudy, needToTake, taken, sent"
pro.mycoleges["Yale"]!.addStandardizedTest(test: "AP", clarifier: "Chem", status: 0)
pro.mycoleges["Yale"]!.addStandardizedTest(test: "SAT", clarifier: "Standard", status: 1)

// user can change the status of their test, ex from not signed up to signed up to taken
pro.mycoleges["Yale"]!.changeTestStatus(identity: "AP Chem", newStatus: 2)

// prints all test status for yale
print(pro.mycoleges["Yale"]!.testScores)
