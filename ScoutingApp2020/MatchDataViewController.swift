//
//  MatchDataViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/21/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit


class MatchDataViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoutLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var scoutText: UITextField!
    @IBOutlet weak var teamText: UITextField!
    @IBOutlet weak var matchText: UITextField!
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    @IBOutlet weak var autoButtons: UIButton!
    
    /**
     Allows the user to select the robot's alliance color and updates the value
     */
    @IBAction func segmentedChanged(_ sender: Any) {
        if(colorSegmentedControl.selectedSegmentIndex == 0){
            teamColor = true
        }
        else{
            teamColor = false
        }
        
        updateValues()
    }
    /**
    Allows the user to progress to the next section of data
    */
    @IBAction func autoButtonPressed(_ sender: Any) {
        matchPosition = 2
        updateValues()
        performSegue(withIdentifier: "MatchToData2", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     
        if (runType == 1) {
            scoutLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 60 )
            teamLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 60 )
            matchLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 60 )
            colorLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 35 )
            autoButtons.titleLabel?.font = UIFont.init(name: "Optima-BoldItalic", size: 60 )
            
        }
        else{
            scoutLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 35 )
            teamLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 35 )
            matchLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 35 )
            colorLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 25 )
            autoButtons.titleLabel?.font = UIFont.init(name: "Optima-BoldItalic", size: 35 )
        }
        
        if(changeData){
            //entered viewController from viewData
            let defaults = UserDefaults.standard
          
                if UserDefaults.standard.array(forKey: "teamList") != nil{
                    teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                   // print("\(teamList) and \(teamList.count)")
                    
                    var counter = 0
                    
                    for i in 0...teamList.count - 1{
                        if(teamNumberFromButton == teamList[i]){
                            counter = i
                            break
                        }
                    }
                    
                    var dataToAdd = defaults.object(forKey: teamList[counter]) as! String
                    
                    
                    let matchArr = dataToAdd.components(separatedBy: "=")
                                   var matchArr2 = Array(repeating: "", count: matchArr.count - 1)
                                   
                                   for i in 1...matchArr.count - 1{
                                       let a = matchArr[i].components(separatedBy: "&")
                                       matchArr2[i-1] = a[0]
                                   }

                                   
                                   
                                   
                                   teamName = "\(matchArr2[5]); \(matchArr2[4])"
                                 //  print(teamName)
                                   
                                   
                                   let highGoalTakenArr = [Int(matchArr2[15])!,Int(matchArr2[16])!,Int(matchArr2[17])!,Int(matchArr2[18])!]
                                   let highGoalMadeArr = [Int(matchArr2[19])!,Int(matchArr2[20])!,Int(matchArr2[21])!,Int(matchArr2[22])!]
                                   
                                   
                                   FinishMatchDataViewController.matchDataObj = MatchData(teamText: matchArr2[5], matchText: matchArr2[4], scoutText:matchArr2[6], autoLowGoal:Int(matchArr2[7])!, autoHighGoal:Int(matchArr2[8])!, autoTrenchBalls:Int(matchArr2[9])!, autoShieldBalls:Int(matchArr2[10])!, controlPanel:matchArr2[12],climbing:matchArr2[0], autoLine:Bool(matchArr2[2])!, climbBalanced:Bool(matchArr2[1])!, climbingOtherRobots:Int(matchArr2[3])!, teamColor:Bool(matchArr2[11])!, lowGoalTaken: Int(matchArr2[13])!, lowGoalMade: Int(matchArr2[14])!, highGoalTaken: highGoalTakenArr, highGoalMade: highGoalMadeArr, notes:matchArr2[23])
                    
                   
                    scoutName = FinishMatchDataViewController.matchDataObj.scoutText
                    teamNumber = Int(FinishMatchDataViewController.matchDataObj.teamText) ?? 0
                    matchNumber = Int(FinishMatchDataViewController.matchDataObj.matchText) ?? 1
                    teamColor = FinishMatchDataViewController.matchDataObj.teamColor
                    autoLine = FinishMatchDataViewController.matchDataObj.autoLine
                    autoShieldBalls = FinishMatchDataViewController.matchDataObj.autoShieldBalls
                    autoTrenchBalls = FinishMatchDataViewController.matchDataObj.autoTrenchBalls
                    autoHighGoal = FinishMatchDataViewController.matchDataObj.autoHighGoal
                    autoLowGoal = FinishMatchDataViewController.matchDataObj.autoLowGoal
                    controlPanel = FinishMatchDataViewController.matchDataObj.controlPanel
                    climbingOtherRobots = FinishMatchDataViewController.matchDataObj.climbingOtherRobots
                    lowGoalMade = FinishMatchDataViewController.matchDataObj.lowGoalMade
                    lowGoalTaken = FinishMatchDataViewController.matchDataObj.lowGoalTaken
                    highGoalMade = FinishMatchDataViewController.matchDataObj.highGoalMade
                    highGoalTaken = FinishMatchDataViewController.matchDataObj.highGoalTaken
                    notes = FinishMatchDataViewController.matchDataObj.notes
                    
                    update()
                    
                    
                    
                }
                else{
                    print("teamList is nil")
                }
            

            
            
        }
        else{
            if (matchPosition > 1){
                //load previous data
                update()
            }
            else{
                //have new data
                
                scoutName = ""
                teamNumber = 0
                matchNumber = 0
                teamColor = true
                colorSegmentedControl.selectedSegmentTintColor = UIColor.blue
                
            }
        }
        
        

        
    }
    
    
    /**
    Updates the variable values and changes the color of the segmentedControl
    */
    
    func updateValues(){
        scoutName = scoutText.text!
        teamNumber = Int(teamText.text!) ?? 0
        matchNumber = Int(matchText.text!) ?? 0
        
        if(teamColor){
            colorSegmentedControl.selectedSegmentTintColor = UIColor.blue
            colorSegmentedControl.selectedSegmentIndex = 0
            
        }
        else{
            colorSegmentedControl.selectedSegmentTintColor = UIColor.red
            colorSegmentedControl.selectedSegmentIndex = 1
            
        }
    }
    
    /**
     Updates the UI with variable names and data
    */
    func update(){
        
        scoutText.text = scoutName
        teamText.text = "\(teamNumber)"
        matchText.text = "\(matchNumber)"
        if(teamColor){
            colorSegmentedControl.selectedSegmentTintColor = UIColor.blue
            colorSegmentedControl.selectedSegmentIndex = 0
            
        }
        else{
            colorSegmentedControl.selectedSegmentTintColor = UIColor.red
            colorSegmentedControl.selectedSegmentIndex = 1
            
        }
        
        
    }
    
    /**
    Allows the user to stop editing a textfield by clicking away from it
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    /**
    Allows the user to stop editing a textfield by hitting enter
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
