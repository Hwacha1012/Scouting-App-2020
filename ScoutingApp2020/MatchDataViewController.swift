//
//  MatchDataViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/21/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit



class MatchData: Codable {
   public var teamText:String
    public var matchText:String
    public var colorSegmentedControl:String
    public var scoutText:String
    public var crossedSwitch:String
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
    
    init(teamText: String, matchText:String, colorSegmentedControl:String, scoutText:String, autoLowGoal:Int, autoHighGoal:Int, crossedSwitch:String, autoTrenchBalls:Int, autoShieldBalls:Int, controlPanel:String,climbing:String, autoLine:Bool, climbBalanced:Bool, climbingOtherRobots:Int, teamColor:Bool) {
        self.climbing = climbing
        self.climbBalanced = climbBalanced
        self.autoLine = autoLine
        self.climbingOtherRobots = climbingOtherRobots
        self.matchText = matchText
        self.teamText = teamText
        self.colorSegmentedControl = colorSegmentedControl
        self.scoutText = scoutText
        self.autoLowGoal = autoLowGoal
        self.autoHighGoal = autoHighGoal
        self.crossedSwitch = crossedSwitch
        self.autoTrenchBalls = autoTrenchBalls
        self.autoShieldBalls = autoShieldBalls
        self.controlPanel = controlPanel
        self.teamColor = teamColor
        
    }
}





class MatchDataViewController: UIViewController {
    
    public static var  matchDataObj = MatchData(teamText: "", matchText:"", colorSegmentedControl:"", scoutText:"", autoLowGoal:0, autoHighGoal:0, crossedSwitch:"", autoTrenchBalls:0, autoShieldBalls:0, controlPanel:"",climbing:"", autoLine:false, climbBalanced:false, climbingOtherRobots:0, teamColor:true)

    
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
            //colorSegmentedControl.selectedSegmentTintColor
            //colorSegmentedControl.tintColor =
            
        }
        
        //colorSegmentedControl.
        
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
