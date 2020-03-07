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
    public var teamColor:Bool
    public var notes:String
    public var innerMade:Int
    public var innerMissed:Int
    public var outerMade:Int
    public var outerMissed:Int
    public var rotationControl:String
    public var positionControl:String
    public var shootingLocation:String
    public var fouls:Int
    public var techFouls:Int
    
    
    init(teamText: String, matchText:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, autoTrenchBalls:Int, autoShieldBalls:Int, controlPanel:String,climbing:String, autoLine:Bool, teamColor:Bool, notes:String, innerMade:Int, innerMissed:Int, outerMade:Int, outerMissed:Int, rotationControl:String, positionControl:String, shootingLocation:String, fouls:Int, techFouls:Int) {
        self.climbing = climbing
        self.autoLine = autoLine
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
        self.innerMade = innerMade
        self.innerMissed = innerMissed
        self.outerMade = outerMade
        self.outerMissed = outerMissed
        self.rotationControl = rotationControl
        self.positionControl = positionControl
        self.shootingLocation = shootingLocation
        self.fouls = fouls
        self.techFouls = techFouls
    }
}



class FinishMatchDataViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    public static var  matchDataObj = MatchData(teamText: "", matchText:"",  scoutText:"", autoLowGoal:0, autoHighGoal:0,  autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false,teamColor:true, notes:"Type here...", innerMade:0, innerMissed:0, outerMade:0, outerMissed:0, rotationControl:"", positionControl:"", shootingLocation:"", fouls:0, techFouls:0)
    
    public struct Throwable<T: Decodable>: Decodable {
        let result: Result<T, Error>

        init(from decoder: Decoder) throws {
            result = Result(catching: { try T(from: decoder) })
        }
    }
    
    
    @IBOutlet weak var notes: UITextView!
    
    
    @IBOutlet weak var submitButton: UIButton!
    
 
    
    func Serialize(teamText:String, matchText:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String,autoLine:Bool, teamColor:Bool, innerMade:Int,innerMissed:Int, outerMade:Int, outerMissed:Int, rotationControl:String, positionControl:String, shootingLocation:String, fouls:Int, techFouls:Int, Notes:String, pretty:Bool) -> String
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
        
        
        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, teamColor: teamColor,  notes: noteText ?? "", innerMade: innerMade, innerMissed: innerMissed, outerMade: outerMade, outerMissed: outerMissed, rotationControl: rotationControl, positionControl: positionControl, shootingLocation: shootingLocation, fouls: fouls, techFouls: techFouls)
        
        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }


       let jStrArray = ["robotNumber="+PitScoutingViewController.pitScoutingDataObj.robotNumber,
            "driveTrainType="+PitScoutingViewController.pitScoutingDataObj.driveTrainType,
            "intake="+PitScoutingViewController.pitScoutingDataObj.intake,
            "capacity="+PitScoutingViewController.pitScoutingDataObj.capacity,
            "AutoLineCrossing="+String(PitScoutingViewController.pitScoutingDataObj.AutoLineCrossing),
            "AutoHighBalls="+PitScoutingViewController.pitScoutingDataObj.AutoHighBalls,
            "AutoLowBalls="+PitScoutingViewController.pitScoutingDataObj.AutoLowBalls,
            "climb="+String(PitScoutingViewController.pitScoutingDataObj.climb),
            "notes="+PitScoutingViewController.pitScoutingDataObj.notes]
        
        
        
        let jsonString = jStrArray.joined(separator: "&")
        print(jsonString)
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
        
        
        FinishMatchDataViewController.matchDataObj = MatchData(teamText: "\(teamNumber)", matchText:"\(matchNumber)", scoutText:scoutName, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, autoTrenchBalls:autoTrenchBalls, autoShieldBalls:autoShieldBalls, controlPanel:controlPanel,climbing:"\(climbing)", autoLine:autoLine, teamColor:teamColor, notes:notes.text)
        
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
        
        if(runType == 1){
            //submitButton.setFon
            submitButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            notes.font = UIFont.init(name: "Optima-BoldItalic", size: 20)
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 60)
        }
        if(runType == 2){
            //submitButton.setFon
            submitButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 30)
            notes.font = UIFont.init(name: "Optima-BoldItalic", size: 12)
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
        }
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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

