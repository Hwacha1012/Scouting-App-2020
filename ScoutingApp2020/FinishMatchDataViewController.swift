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
<<<<<<< HEAD
    
    public static var  matchDataObj = MatchData(teamText: "", matchText:"", colorSegmentedControl:"", scoutText:"", autoLowGoal:0, autoHighGoal:0, crossedSwitch:"", autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false, climbBalanced:false, climbingOtherRobots:0)
    
=======
>>>>>>> parent of f69dffd... Reverted Leo's dumb changes to my code
    
    public static var  matchDataObj = MatchData(teamText: "", matchText:"", colorSegmentedControl:"", scoutText:"", autoLowGoal:0, autoHighGoal:0, crossedSwitch:"", autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false, climbBalanced:false, climbingOtherRobots:0)
    
<<<<<<< HEAD
    func Serialize(teamText:String, matchText:String, colorSegmentedControl:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, crossedSwitch:String, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String,autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, pretty:Bool) -> String
    {

        MatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots, teamColor:teamColor) 

        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots)

        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots)


        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls, autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots)

        MatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots, teamColor:teamColor)


=======
    
    
    func Serialize(teamText:String, matchText:String, colorSegmentedControl:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, crossedSwitch:String, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String,autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, pretty:Bool) -> String
    {
        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots)
>>>>>>> parent of f69dffd... Reverted Leo's dumb changes to my code
=======
    
    public static var  matchDataObj = MatchData(teamText: "", matchText:"", colorSegmentedControl:"", scoutText:"", autoLowGoal:0, autoHighGoal:0, crossedSwitch:"", autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false, climbBalanced:false, climbingOtherRobots:0)
    
    
    
    func Serialize(teamText:String, matchText:String, colorSegmentedControl:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, crossedSwitch:String, autoTrenchBalls:Int , autoShieldBalls:Int, controlPanel:String, climbing:String,autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, pretty:Bool) -> String
    {
        FinishMatchDataViewController.matchDataObj = MatchData(teamText: teamText, matchText:matchText, colorSegmentedControl:colorSegmentedControl, scoutText:scoutText, autoLowGoal:autoLowGoal, autoHighGoal:autoHighGoal, crossedSwitch:crossedSwitch, autoTrenchBalls:autoTrenchBalls , autoShieldBalls:autoShieldBalls, controlPanel:controlPanel, climbing:climbing, autoLine:autoLine, climbBalanced:climbBalanced, climbingOtherRobots:climbingOtherRobots)
>>>>>>> parent of f69dffd... Reverted Leo's dumb changes to my code
        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }
<<<<<<< HEAD
<<<<<<< HEAD

        let data = try! encoder.encode(FinishMatchDataViewController.matchDataObj)


        let data = try! encoder.encode(FinishMatchDataViewController.matchDataObj)
        
        

        let data = try! encoder.encode(MatchDataViewController.matchDataObj)


=======
        let data = try! encoder.encode(FinishMatchDataViewController.matchDataObj)
>>>>>>> parent of f69dffd... Reverted Leo's dumb changes to my code
=======
        let data = try! encoder.encode(FinishMatchDataViewController.matchDataObj)
>>>>>>> parent of f69dffd... Reverted Leo's dumb changes to my code
        let jsonString = String(data: data, encoding: .utf8)!
        print(jsonString)
        return jsonString
    }
    
    
    @IBAction func submit_Pressed(_ sender: Any) {
        
        
            let payload =  Serialize(
                teamText: FinishMatchDataViewController.matchDataObj.teamText,
                matchText: FinishMatchDataViewController.matchDataObj.matchText,
                colorSegmentedControl: FinishMatchDataViewController.matchDataObj.matchText,
                scoutText: FinishMatchDataViewController.matchDataObj.scoutText,
                autoLowGoal: FinishMatchDataViewController.matchDataObj.autoLowGoal,
                autoHighGoal: FinishMatchDataViewController.matchDataObj.autoHighGoal,
                crossedSwitch: FinishMatchDataViewController.matchDataObj.crossedSwitch,
                autoTrenchBalls: FinishMatchDataViewController.matchDataObj.autoTrenchBalls,
                autoShieldBalls: FinishMatchDataViewController.matchDataObj.autoShieldBalls,
                controlPanel: FinishMatchDataViewController.matchDataObj.controlPanel,
                climbing: FinishMatchDataViewController.matchDataObj.climbing,
                autoLine: FinishMatchDataViewController.matchDataObj.autoLine,
                climbBalanced: FinishMatchDataViewController.matchDataObj.climbBalanced,
                climbingOtherRobots:FinishMatchDataViewController.matchDataObj.climbingOtherRobots, pretty: false)
        
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

