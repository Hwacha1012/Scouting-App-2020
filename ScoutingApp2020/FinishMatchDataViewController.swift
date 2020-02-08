//
//  FinishMatchDataViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/28/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit




class FinishMatchDataViewController: UIViewController {

    @IBOutlet weak var Notes: UITextView!
    
    @IBOutlet weak var submit: UIButton!
    
    public static var   matchDataObj = MatchData(teamText: "", matchText:"", colorSegmentedControl:"Off", scoutText:"", autoLowGoal:0, autoHighGoal:0, crossedSwitch:"", autoTrenchBalls:0 , autoShieldBalls:0, controlPanel:"", climbing:"", climbBalanced:false, climbingOtherRobots:0)
    
    
    func Serialize(teamText:String, matchText:String, colorSegmentedControl:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, crossedSwitch:String, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String, climbBalanced:Bool, climbingOtherRobots:Int) -> String
    {
        MatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots)
        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }
        let data = try! encoder.encode(MatchDataViewController.MatchDataObj)
        let jsonString = String(data: data, encoding: .utf8)!
        print(jsonString)
        return jsonString
    }
    
    
    
    @IBAction func submit_Pressed(_ sender: Any) {
            let payload =  Serialize(
                teamText: MatchDataViewController.matchDataObj.teamText,
                matchText: MatchDataViewController.matchDataObj.matchText,
                autoLowGoal: MatchDataViewController.matchDataObj.autoLowGoal,
                autoHighGoal: MatchDataViewController.matchDataObj.autoHighGoal,
                crossedSwitch: MatchDataViewController.matchDataObj.autoTrenchBalls,
                autoTrenchBalls: MatchDataViewController.matchDataObj.autoTrenchBalls,
                autoShieldBalls: MatchDataViewController.matchDataObj.AutoLowBalls,
                controlPanel: MatchDataViewController.matchDataObj.controlPanel,
                climbing: MatchDataViewController.matchDataObj.climbing,
                climbBalanced: MatchDataViewController.matchDataObj.climbBalanced,
                climbingOtherRobots: MatchDataViewController.matchDataObj.matchDataObj.climbingOtherRobots,
                   pretty: false)
            print(payload);
            let defaults = UserDefaults.standard
            defaults.set(payload, forKey: "\(teamNumber), PitScouting")
           if UserDefaults.standard.array(forKey: "pitScoutList") == nil{
                // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                pitScoutList.append("\(teamNumber), PitScouting")
               // print("teamlist is \(teamList)!")
                UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                
            }
            else if UserDefaults.standard.array(forKey: "pitScoutList")!.isEmpty == false{
                
                //commented code overwrites previous entries with same team number
                pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                breakLoop = false
                for index in 0...teamList.count - 1 {
                    let testString = "\(teamNumber), PitScouting"
                    if testString == pitScoutList[index]{
                        breakLoop = true
                        
                    }
                }
                print("breakLoop is \(breakLoop!)")
                if breakLoop == false{
                    pitScoutList.append("\(teamNumber), PitScouting")
                    //print(teamList)
                    UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                }
                else if breakLoop == true{
                    let indexOfElement = pitScoutList.index(of: "\(teamNumber), PitScouting")
                    pitScoutList.remove(at: indexOfElement!)
                    pitScoutList.append("\(teamNumber), PitScouting")
                   // print(teamList)
                    UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                    
                }
                
                
                //comment below code to when you uncomment the above
                //  teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                //  teamList.append("\(teamNumber); \(matchNumber)")
                //  UserDefaults.standard.set(teamList, forKey: "teamList")
            }
            else{
                pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                pitScoutList.append("\(teamNumber), PitScouting")
               // print("pitScoutList is \(pitScoutList)")
                UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
            }
            
            performSegue(withIdentifier: "PitScoutToMenu", sender: nil)
        }
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
