//
//  FinishMatchDataViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/28/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit



class MatchData: Codable {
   public var teamText:String
    public var matchText:String
    public var scoutText:String
    public var autoLowGoal:Int
    public var autoHighGoal:Int
    public var autoTrenchBalls:Int
    public var autoShieldBalls:Int
    public var controlPanel:String
    public var climbing:String
    public var autoLine:Bool
    public var climbBalanced:Bool
    public var climbingOtherRobots:Int
    public var teamColor:Bool
    public var notes:String
    public var lowGoalTaken:Int
    public var lowGoalMade:Int
    public var highGoalTaken = [0,0,0,0]
    public var highGoalMade = [0,0,0,0]
    
    
    init(teamText: String, matchText:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, autoTrenchBalls:Int, autoShieldBalls:Int, controlPanel:String,climbing:String, autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, teamColor:Bool, lowGoalTaken:Int, lowGoalMade:Int, highGoalTaken:Array<Int>, highGoalMade:Array<Int>,  notes:String) {
        self.climbing = climbing
        self.climbBalanced = climbBalanced
        self.autoLine = autoLine
        self.climbingOtherRobots = climbingOtherRobots
        self.matchText = matchText
        self.teamText = teamText
        self.scoutText = scoutText
        self.autoLowGoal = autoLowGoal
        self.autoHighGoal = autoHighGoal
        self.autoTrenchBalls = autoTrenchBalls
        self.autoShieldBalls = autoShieldBalls
        self.controlPanel = controlPanel
        self.teamColor = teamColor
        self.notes = notes
        self.highGoalMade = highGoalMade
        self.highGoalTaken = highGoalTaken
        self.lowGoalMade = lowGoalMade
        self.lowGoalTaken = lowGoalTaken
    }
}



class FinishMatchDataViewController: UIViewController {

    public static var  matchDataObj = MatchData(teamText: "", matchText:"",  scoutText:"", autoLowGoal:0, autoHighGoal:0,  autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false, climbBalanced:false, climbingOtherRobots:0, teamColor:true, lowGoalTaken:0, lowGoalMade:0, highGoalTaken:[0, 0, 0, 0], highGoalMade:[0, 0, 0, 0], notes:"Type here...")
    
    public struct Throwable<T: Decodable>: Decodable {
        let result: Result<T, Error>

        init(from decoder: Decoder) throws {
            result = Result(catching: { try T(from: decoder) })
        }
    }
    
    
    @IBOutlet weak var notes: UITextView!
    
    
    @IBOutlet weak var submitButton: UIButton!
    
 
    
    func Serialize(teamText:String, matchText:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String,autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, lowGoalTaken:Int, lowGoalMade:Int, highGoalTaken:Array<Int>, highGoalMade:Array<Int>, Notes:String, pretty:Bool) -> String
    {
        var noteText = notes.text
        if(noteText?.contains("Type here...") ?? false){
            let a = noteText?.components(separatedBy: "Type here...")
            noteText = a?[1]
        }
        if (noteText == "")
        {
            noteText = "NONE"
        }
        
        
        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots, teamColor: teamColor, lowGoalTaken:lowGoalTaken,lowGoalMade:lowGoalMade,highGoalTaken:highGoalTaken, highGoalMade:highGoalMade, notes: noteText ?? "")
        
        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }


        // let data = try! encoder.encode(FinishMatchDataViewController.matchDataObj)
        var temp_string = "climbing="
        temp_string += FinishMatchDataViewController.matchDataObj.climbing
        temp_string += "&"
        temp_string += "climbBalanced="
        temp_string += String(FinishMatchDataViewController.matchDataObj.climbBalanced)
        temp_string += "&"
        temp_string += "autoLine="
        temp_string += String(FinishMatchDataViewController.matchDataObj.autoLine)
        temp_string += "&"
        temp_string += "climbingOtherRobots="
        temp_string += String(FinishMatchDataViewController.matchDataObj.climbingOtherRobots)
        temp_string += "&"
        temp_string += "matchText="
        temp_string += FinishMatchDataViewController.matchDataObj.matchText
        temp_string += "&"
        temp_string += "teamText="
        temp_string += FinishMatchDataViewController.matchDataObj.teamText
        temp_string += "&"
        temp_string += "scoutText="
        temp_string += FinishMatchDataViewController.matchDataObj.scoutText
        temp_string += "&"
        temp_string += "autoLowGoal="
        temp_string += String(FinishMatchDataViewController.matchDataObj.autoLowGoal)
        temp_string += "&"
        temp_string += "autoHighGoal="
        temp_string += String(FinishMatchDataViewController.matchDataObj.autoHighGoal)
        temp_string += "&"
        temp_string += "autoTrenchBalls="
        temp_string += String(FinishMatchDataViewController.matchDataObj.autoTrenchBalls)
        temp_string += "&"
        temp_string += "autoShieldBalls="
        temp_string += String(FinishMatchDataViewController.matchDataObj.autoShieldBalls)
        temp_string += "&"
        temp_string += "teamColor="
        temp_string += String(FinishMatchDataViewController.matchDataObj.teamColor)
        temp_string += "&"
        temp_string += "controlPanel="
        temp_string += FinishMatchDataViewController.matchDataObj.controlPanel
        temp_string += "&"
        temp_string += "lowGoalTaken="
        temp_string += String(FinishMatchDataViewController.matchDataObj.lowGoalTaken)
        temp_string += "&"
        temp_string += "lowGoalMade="
        temp_string += String(FinishMatchDataViewController.matchDataObj.lowGoalMade)
        temp_string += "&"
        temp_string += "highGoalTaken_0="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalTaken[0])
        temp_string  += "&"
        temp_string += "highGoalTaken_1="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalTaken[1])
        temp_string  += "&"
        temp_string += "highGoalTaken_2="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalTaken[2])
        temp_string  += "&"
        temp_string += "highGoalTaken_3="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalTaken[3])
        temp_string  += "&"
        temp_string += "highGoalMade_0="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalMade[0])
        temp_string  += "&"
        temp_string += "highGoalMade_1="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalMade[1])
        temp_string  += "&"
        temp_string += "highGoalMade_2="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalMade[2])
        temp_string  += "&"
        temp_string += "highGoalMade_3="
        temp_string  += String(FinishMatchDataViewController.matchDataObj.highGoalMade[3])
        temp_string += "&"
        temp_string += "notes="
        temp_string += String(FinishMatchDataViewController.matchDataObj.notes)
        let jsonString = temp_string
        print("jsonString = \(jsonString)")
        //let s = send_post(jsonStr:jsonString)
        //let s2 = send_get()
        return jsonString
    }
    func send_post(jsonStr:String)-> String
     {
         var result = jsonStr
         let requestUrl = URL(string:"http://ec2-52-71-196-37.compute-1.amazonaws.com/matchdata")!
         var request = URLRequest(url: requestUrl)
         request.httpMethod = "POST"
         let postString=jsonStr;
         request.httpBody = postString.data(using:String.Encoding.utf8);
         let task = URLSession.shared.dataTask(with:request) {
             (data,response,error) in
             if let error = error{
                 print("ERROR FOUND")
                 return
             }
             if let data = data,let dataString = String(data:data,encoding:.utf8){
                 print("Response data String:\n \(dataString)")
             }
         }
         task.resume()
         return result
     }
    
    
    
    func send_get() -> [Throwable<MatchData>]
    {
        var teamData: [Throwable<MatchData>] = Array()
        let dataString = ""
        let url = URL(string: "http://ec2-52-71-196-37.compute-1.amazonaws.com/matchdata")
        guard let requestUrl = url else { fatalError() }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                teamData = self.DeserializeList(jsonString:dataString)
            }
            
        }
        task.resume()
        return teamData
    }
    
    
    func DeserializeList(jsonString:String) ->
        [Throwable<MatchData>]{
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        var teamData = try! decoder.decode([Throwable<MatchData>].self, from: jsonData);
        print(teamData)
        // let products = throwables.compactMap { try? $0.result.get() }

        return teamData
    }
    
    
    
    
    
    
    
    
    @IBAction func submit_Pressed(_ sender: Any) {
        breakLoop = false
        
        if (notes.text == "Type here...") {
         notes.text = ""
         }
        
        
        FinishMatchDataViewController.matchDataObj = MatchData(teamText: "\(teamNumber)", matchText:"\(matchNumber)", scoutText:scoutName, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, autoTrenchBalls:autoTrenchBalls, autoShieldBalls:autoShieldBalls, controlPanel:controlPanel,climbing:"\(climbing)", autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots, teamColor:teamColor, lowGoalTaken: lowGoalTaken, lowGoalMade: lowGoalMade, highGoalTaken: highGoalTaken, highGoalMade: highGoalMade, notes:notes.text)
        
            let payload =  Serialize(
                teamText: FinishMatchDataViewController.matchDataObj.teamText,
                matchText: FinishMatchDataViewController.matchDataObj.matchText,
                scoutText: FinishMatchDataViewController.matchDataObj.scoutText,
                autoLowGoal: FinishMatchDataViewController.matchDataObj.autoLowGoal,
                autoHighGoal: FinishMatchDataViewController.matchDataObj.autoHighGoal,
                autoTrenchBalls: FinishMatchDataViewController.matchDataObj.autoTrenchBalls,
                autoShieldBalls: FinishMatchDataViewController.matchDataObj.autoShieldBalls,
                controlPanel: FinishMatchDataViewController.matchDataObj.controlPanel,
                climbing: FinishMatchDataViewController.matchDataObj.climbing,
                autoLine: FinishMatchDataViewController.matchDataObj.autoLine,
                climbBalanced: FinishMatchDataViewController.matchDataObj.climbBalanced,
                climbingOtherRobots:FinishMatchDataViewController.matchDataObj.climbingOtherRobots,
                lowGoalTaken: FinishMatchDataViewController.matchDataObj.lowGoalTaken,
                lowGoalMade: FinishMatchDataViewController.matchDataObj.lowGoalMade,
                highGoalTaken: FinishMatchDataViewController.matchDataObj.highGoalTaken,
                highGoalMade:  FinishMatchDataViewController.matchDataObj.highGoalMade,
                Notes:FinishMatchDataViewController.matchDataObj.notes,
                pretty: false)
        
             print(payload);
             let defaults = UserDefaults.standard
        defaults.set(payload, forKey: "\(FinishMatchDataViewController.matchDataObj.teamText), \(FinishMatchDataViewController.matchDataObj.matchText)")
            if UserDefaults.standard.array(forKey: "teamList") == nil{
                 // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
             teamList.append("\(FinishMatchDataViewController.matchDataObj.teamText), \(FinishMatchDataViewController.matchDataObj.matchText)")
                // print("teamList is \(teamList)!")
                 UserDefaults.standard.set(teamList, forKey: "teamList")
             }
             else if UserDefaults.standard.array(forKey: "teamList")!.isEmpty == false{
                 
                 //commented code overwrites previous entries with same team number
                 teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                 breakLoop = false
                 for index in 0...teamList.count - 1 {
                     let testString = "\(FinishMatchDataViewController.matchDataObj.teamText), \(FinishMatchDataViewController.matchDataObj.matchText)"
                     if testString == teamList[index]{
                         breakLoop = true
                         
                     }
                 }
                 print("breakLoop is \(breakLoop!)")
                 if breakLoop == false{
                     teamList.append("\(FinishMatchDataViewController.matchDataObj.teamText), \(FinishMatchDataViewController.matchDataObj.matchText)")
                     //print(teamList)
                     UserDefaults.standard.set(teamList, forKey: "teamList")
                 }
                 else if breakLoop == true{
                    let indexOfElement = teamList.index(of: "\(FinishMatchDataViewController.matchDataObj.teamText), \(FinishMatchDataViewController.matchDataObj.matchText)")
                     teamList.remove(at: indexOfElement!)
                     teamList.append("\(FinishMatchDataViewController.matchDataObj.teamText), \(FinishMatchDataViewController.matchDataObj.matchText)")
                    // print(teamList)
                     UserDefaults.standard.set(teamList, forKey: "teamList")
                     
                 }
                 
                 
                 //comment below code to when you uncomment the above
                 //  teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                 //  teamList.append("\(teamNumber); \(matchNumber)")
                 //  UserDefaults.standard.set(teamList, forKey: "teamList")
             }
             else{
                 teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                 teamList.append("\(FinishMatchDataViewController.matchDataObj.teamText), \(FinishMatchDataViewController.matchDataObj.matchText)")
                // print("pitScoutList is \(pitScoutList)")
                 UserDefaults.standard.set(teamList, forKey: "teamList")
             }
            
            performSegue(withIdentifier: "MatchDataToMenu", sender: nil)
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
        if(changeData){
            notes.text = FinishMatchDataViewController.matchDataObj.notes
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

