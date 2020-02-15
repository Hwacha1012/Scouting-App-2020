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
    @IBAction func segmentedChanged(_ sender: Any) {
        if(colorSegmentedControl.selectedSegmentIndex == 0){
            teamColor = true
        }
        else{
            teamColor = false
        }
        
        updateValues()
    }
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
            
            if(teamNumberFromButton.contains("PitScouting")){
                if UserDefaults.standard.array(forKey: "pitScoutList") != nil{
                    pitScoutList = UserDefaults.standard.object(forKey: "pitScoutList") as! [String]
                    print("\(pitScoutList) and \(pitScoutList.count)")
                               
                }
                else{
                    print("pitScoutList is nil")
                }
                var counter = 0
                
                for i in 0...pitScoutList.count - 1{
                    if(teamNumberFromButton == pitScoutList[i]){
                        counter = i
                        break
                    }
                }
                //print(pitScoutList[counter])
                /*
                
                var data = Deserialize(jsonString: defaults.object(forKey: pitScoutList[counter]) as! String)
                RobotNumber.text = data.robotNumber
                RobotNumber.backgroundColor = UIColor.green
                print("driveTrain type is \(data.driveTrainType)")
                if(data.driveTrainType == "Tank"){
                    DrivetrainType.selectedSegmentIndex = 0
                }
                else if(data.driveTrainType == "Mechanum"){
                    DrivetrainType.selectedSegmentIndex = 1
                }
                else if(data.driveTrainType == "H-Drive"){
                    DrivetrainType.selectedSegmentIndex = 2
                }
                else if(data.driveTrainType == "Swerve"){
                    DrivetrainType.selectedSegmentIndex = 3
                }
                if(data.intake == "Floor"){
                    Intake.selectedSegmentIndex = 0
                
                }
                else{
                    Intake.selectedSegmentIndex = 1
                }
                
                Capacity.selectedSegmentIndex = (Int(data.capacity) ?? 1) - 1
                AutoLineCrossing.isOn = data.AutoLineCrossing
                AutoHighGoalBalls.text = data.AutoHighBalls
                AutoHighGoalBalls.backgroundColor = UIColor.green
                AutoLowGoalBalls.text = data.AutoLowBalls
                AutoLowGoalBalls.backgroundColor = UIColor.green
                Climbing.isOn = data.climb
                Notes.text = data.notes
                */
            }
            else{
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
                    //var data = Deserialize(jsonString: defaults.object(forKey: pitScoutList[counter]) as! String)
                    
                    
                    
                }
                else{
                    print("teamList is nil")
                }
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
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
