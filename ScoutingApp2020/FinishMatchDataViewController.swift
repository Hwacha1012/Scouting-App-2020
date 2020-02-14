//
//  FinishMatchDataViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/28/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//
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
    /*
    public static var  matchDataObj = MatchData(teamText: "", matchText:"", colorSegmentedControl:"", scoutText:"", autoLowGoal:0, autoHighGoal:0, crossedSwitch:"", autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false, climbBalanced:false, climbingOtherRobots:0, teamColor:true)
    */
    
    
    func Serialize(teamText:String, matchText:String, colorSegmentedControl:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, crossedSwitch:String, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String,autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, teamColor:Bool, pretty:Bool) -> String
    {

        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls, autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots)

        MatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots, teamColor:teamColor)

        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }

        let data = try! encoder.encode(FinishMatchDataViewController.matchDataObj)
        
        

        let data = try! encoder.encode(MatchDataViewController.matchDataObj)

        let jsonString = String(data: data, encoding: .utf8)!
        print(jsonString)
        return jsonString
    }
    
    
    @IBAction func submit_Pressed(_ sender: Any) {
        
        
            let payload =  Serialize(
                teamText: MatchDataViewController.matchDataObj.teamText,
                matchText: MatchDataViewController.matchDataObj.matchText,
                colorSegmentedControl: MatchDataViewController.matchDataObj.matchText,
                scoutText: MatchDataViewController.matchDataObj.scoutText,
                autoLowGoal: MatchDataViewController.matchDataObj.autoLowGoal,
                autoHighGoal: MatchDataViewController.matchDataObj.autoHighGoal,
                crossedSwitch: MatchDataViewController.matchDataObj.crossedSwitch,
                autoTrenchBalls: MatchDataViewController.matchDataObj.autoTrenchBalls,
                autoShieldBalls: MatchDataViewController.matchDataObj.autoShieldBalls,
                controlPanel: MatchDataViewController.matchDataObj.controlPanel,
                climbing: MatchDataViewController.matchDataObj.climbing,
                autoLine: MatchDataViewController.matchDataObj.autoLine,
                climbBalanced: MatchDataViewController.matchDataObj.climbBalanced,
              climbingOtherRobots:MatchDataViewController.matchDataObj.climbingOtherRobots,
              teamColor: MatchDataViewController.matchDataObj.teamColor,
              pretty: false)
        
            print(payload);
            let defaults = UserDefaults.standard
            defaults.set(payload, forKey: "\(teamNumber), MatchData")
           if UserDefaults.standard.array(forKey: "matchDataList") == nil{
                // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                matchDataList.append("\(teamNumber), MatchData")
               // print("teamlist is \(teamList)!")
                UserDefaults.standard.set(matchDataList, forKey: "matchDataList")
                
            }
            else if UserDefaults.standard.array(forKey: "matchDataList")!.isEmpty == false{
                
                //commented code overwrites previous entries with same team number
                matchDataList = UserDefaults.standard.array(forKey: "matchDataList") as! [String]
                breakLoop = false
                for index in 0...matchDataList.count - 1 {
                    let testString = "\(teamNumber), MatchData"
                    if testString == matchDataList[index]{
                        breakLoop = true
                        
                    }
                }
                print("breakLoop is \(breakLoop!)")
                if breakLoop == false{
                    matchDataList.append("\(teamNumber), MatchData")
                    //print(teamList)
                    UserDefaults.standard.set(matchDataList, forKey: "matchDataList")
                }
                else if breakLoop == true{
                    let indexOfElement = matchDataList.index(of: "\(teamNumber), MatchData")
                    matchDataList.remove(at: indexOfElement!)
                    matchDataList.append("\(teamNumber), MatchData")
                   // print(teamList)
                    UserDefaults.standard.set(matchDataList, forKey: "MatchDataList")
                    
                }
                
                
                //comment below code to when you uncomment the above
                //  teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                //  teamList.append("\(teamNumber); \(matchNumber)")
                //  UserDefaults.standard.set(teamList, forKey: "teamList")
            }
            else{
                matchDataList = UserDefaults.standard.array(forKey: "matchDataList") as! [String]
                matchDataList.append("\(teamNumber), MatchData")
               // print("matchDataList is \(matchDataList)")
                UserDefaults.standard.set(matchDataList, forKey: "matchDataList")
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
