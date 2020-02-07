//
//  PitScoutingViewController.swift
//  ScoutingApp2020
//
//  Created by ghsrobotics on 1/25/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

import Foundation
//import Alamofire
//import SwiftyJSON

class PitScoutingData: Codable {
   public var robotNumber:String
    public var driveTrainType:String
    public var intake:String
    public var capacity:String
    public var AutoLineCrossing:Bool
    public var AutoHighBalls:String
    public var AutoLowBalls:String
    public var climb:Bool
    public var notes:String
    init(robotNumber: String, driveTrainType:String, intake:String, capacity:String, AutoLineCrossing:Bool, AutoHighBalls:String, AutoLowBalls:String, climb:Bool, notes:String ) {
        self.driveTrainType = driveTrainType
        self.robotNumber = robotNumber
        self.intake = intake
        self.capacity = capacity
        self.AutoLineCrossing = AutoLineCrossing
        self.AutoHighBalls = AutoHighBalls
        self.AutoLowBalls = AutoLowBalls
        self.climb = climb
        self.notes = notes
    }
}

class PitScoutingViewController: UIViewController {
    
    public var pitScoutingDataObj = PitScoutingData(robotNumber: "", driveTrainType:"Tank", intake:"Floor", capacity:"1", AutoLineCrossing:true, AutoHighBalls:"", AutoLowBalls:"", climb:true, notes:"")
    
    
    @IBOutlet weak var RobotNumber: UITextField!
    
    
    @IBOutlet weak var DrivetrainType: UISegmentedControl!
    
    
    @IBOutlet weak var Intake: UISegmentedControl!
    
    
    @IBOutlet weak var Capacity: UISegmentedControl!
    
    
    @IBOutlet weak var AutoLineCrossing: UISwitch!
    
    
    @IBOutlet weak var AutoHighGoalBalls: UITextField!
    
    
    @IBOutlet weak var AutoLowGoalBalls: UITextField!
    
    @IBOutlet weak var Next: UIButton!
    
    
    @IBOutlet weak var Notes: UITextView!
    
    
    @IBOutlet weak var Climbing: UISwitch!
    func Serialize(teamNumber:String, driveTrainType:String, intake:String, capacity:String, AutoLineCrossing:Bool, AutoHighBalls:String, AutoLowBalls:String, climb:Bool, notes:String,pretty:Bool) -> String
    {
       pitScoutingDataObj = PitScoutingData(robotNumber: teamNumber, driveTrainType:driveTrainType, intake:intake, capacity:capacity, AutoLineCrossing:AutoLineCrossing, AutoHighBalls:AutoHighBalls, AutoLowBalls:AutoLowBalls, climb:climb, notes:notes)
        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }
        let data = try! encoder.encode(pitScoutingDataObj)
        let jsonString = String(data: data, encoding: .utf8)!
        print(jsonString)
        return jsonString
    }
    func Deserialize(jsonString:String) ->
        PitScoutingData{
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        pitScoutingDataObj = try! decoder.decode(PitScoutingData.self, from: jsonData);
        return dump(pitScoutingDataObj)
    }
    
    func validateNumber(text: String) -> Bool {
        var result = false
        // test password
           let num = Int(text);

           if num != nil {
              result = true
           }
        return result
    }


    @IBAction func buttonPressed(_ sender: Any) {
      print("You may enter")

    }
    
    @IBAction func robotNumber_Changed(_ sender: Any) {
        if(validateNumber(text: RobotNumber.text!)) {
            // correct password
            print("Success.");
           RobotNumber.backgroundColor = UIColor.green
            pitScoutingDataObj.robotNumber = RobotNumber.text!

        } else {
            print("Failed");
            RobotNumber.backgroundColor = UIColor.red
            
        }
    }
    
    

    @IBAction func driveTrainType_Selected(_ sender: Any) {
        let title = DrivetrainType.titleForSegment(at: DrivetrainType.selectedSegmentIndex)
        pitScoutingDataObj.driveTrainType = title!
    }
    
    @IBAction func intake_Selected(_ sender: Any) {

        let title = Intake.titleForSegment(at: Intake.selectedSegmentIndex)
        pitScoutingDataObj.intake = title!
    }
    
    
    @IBAction func capacity_Selected(_ sender: Any) {
        let title = Capacity.titleForSegment(at: Capacity.selectedSegmentIndex)
        pitScoutingDataObj.capacity = title!
    }
    
    
    @IBAction func autoLineCrossing_Selected(_ sender: Any) {
        pitScoutingDataObj.AutoLineCrossing = AutoLineCrossing.isOn
    }
    
    @IBAction func Climbing(_ sender: Any) {
        pitScoutingDataObj.climb = Climbing.isOn
    }
    
    @IBAction func AutoHighGoalBalls_Changed(_ sender: Any) {
        if(validateNumber(text: AutoHighGoalBalls.text!)) {
            // correct password
            print("Success.");
           AutoHighGoalBalls.backgroundColor = UIColor.green
            pitScoutingDataObj.AutoHighBalls = AutoHighGoalBalls.text!

        } else {
            print("Failed");
            AutoHighGoalBalls.backgroundColor = UIColor.red
            
        }
        
    }
    
     @IBAction func NotesText_Changed(_ sender: Any) {
        pitScoutingDataObj.notes =  Notes.text!
    
     }
    
    @IBAction func autoLowBalls_Changed(_ sender: Any) {
        if(validateNumber(text: AutoLowGoalBalls.text!)) {
            // correct password
            print("Success.");
           AutoLowGoalBalls.backgroundColor = UIColor.green
            pitScoutingDataObj.AutoLowBalls = AutoLowGoalBalls.text!

        } else {
            print("Failed");
            AutoLowGoalBalls.backgroundColor = UIColor.red
            
    }
   
    }
    //The thing


    
    @IBAction func submit(_ sender: Any) {
        

        let payload =  Serialize(
               teamNumber: pitScoutingDataObj.robotNumber,
               driveTrainType: pitScoutingDataObj.driveTrainType,
               intake: pitScoutingDataObj.intake,
               capacity: pitScoutingDataObj.capacity,
               AutoLineCrossing: pitScoutingDataObj.AutoLineCrossing,
               AutoHighBalls: pitScoutingDataObj.AutoHighBalls,
               AutoLowBalls: pitScoutingDataObj.AutoLowBalls,
               climb: pitScoutingDataObj.climb,
               notes: pitScoutingDataObj.notes,
               pretty: false)
        print(payload);
        let defaults = UserDefaults.standard
        defaults.set(payload, forKey: "\(teamNumber), PitScouting")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Notes.text = "Type here..."
        
        
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
