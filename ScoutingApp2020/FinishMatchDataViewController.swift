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
    
    init(teamText: String, matchText:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, autoTrenchBalls:Int, autoShieldBalls:Int, controlPanel:String,climbing:String, autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, teamColor:Bool, notes:String) {
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
    }
}



class FinishMatchDataViewController: UIViewController {

    public static var  matchDataObj = MatchData(teamText: "", matchText:"",  scoutText:"", autoLowGoal:0, autoHighGoal:0,  autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false, climbBalanced:false, climbingOtherRobots:0, teamColor:true, notes:"")
    
    
    @IBOutlet weak var notes: UITextView!
    
    
    @IBOutlet weak var submitButton: UIButton!
    
 
    
    func Serialize(teamText:String, matchText:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String,autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, Notes:String, pretty:Bool) -> String
    {

        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots, teamColor: teamColor, notes: notes.text)
        
        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }


        let data = try! encoder.encode(FinishMatchDataViewController.matchDataObj)

        let jsonString = String(data: data, encoding: .utf8)!
        print(jsonString)
        return jsonString
    }
    
    
    @IBAction func submit_Pressed(_ sender: Any) {
        
        
        if (notes.text == "Type here...") {
         notes.text = ""
         }
        
        FinishMatchDataViewController.matchDataObj = MatchData(teamText: "\(teamNumber)", matchText:"\(matchNumber)", scoutText:scoutName, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, autoTrenchBalls:autoTrenchBalls, autoShieldBalls:autoShieldBalls, controlPanel:controlPanel,climbing:"\(climbing)", autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots, teamColor:teamColor, notes:notes.text)
        
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
                Notes:FinishMatchDataViewController.matchDataObj.notes,
                pretty: false)
        
            print(payload);
            let defaults = UserDefaults.standard
            defaults.set(payload, forKey: "\(teamNumber), MatchData")
           if UserDefaults.standard.array(forKey: "teamList") == nil{
                // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                teamList.append("\(teamNumber), MatchData")
               // print("teamlist is \(teamList)!")
                UserDefaults.standard.set(teamList, forKey: "teamList")
                
            }
            else if UserDefaults.standard.array(forKey: "teamList")!.isEmpty == false{
                
                //commented code overwrites previous entries with same team number
                teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                breakLoop = false
                for index in 0...teamList.count - 1 {
                    let testString = "\(teamNumber), MatchData"
                    if testString == teamList[index]{
                        breakLoop = true
                        
                    }
                }
                print("breakLoop is \(breakLoop!)")
                if breakLoop == false{
                    teamList.append("\(teamNumber), MatchData")
                    //print(teamList)
                    UserDefaults.standard.set(teamList, forKey: "teamList")
                }
                else if breakLoop == true{
                    let indexOfElement = teamList.index(of: "\(teamNumber), MatchData")
                    teamList.remove(at: indexOfElement!)
                    teamList.append("\(teamNumber), MatchData")
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
                teamList.append("\(teamNumber), MatchData")
               // print("teamList is \(teamList)")
                UserDefaults.standard.set(teamList, forKey: "teamList")
            }
            
            performSegue(withIdentifier: "MatchDataToMenu", sender: nil)
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
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

