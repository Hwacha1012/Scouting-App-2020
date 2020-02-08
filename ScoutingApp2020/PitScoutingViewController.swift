//
//  PitScoutingViewController.swift
//  ScoutingApp2020
//
//  Created by ghsrobotics on 1/25/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

import Foundation
var breakLoop: Bool!
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
    
    public static var pitScoutingDataObj = PitScoutingData(robotNumber: "", driveTrainType:"Tank", intake:"Floor", capacity:"1", AutoLineCrossing:true, AutoHighBalls:"", AutoLowBalls:"", climb:true, notes:"")
    
    
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
        PitScoutingViewController.pitScoutingDataObj = PitScoutingData(robotNumber: teamNumber, driveTrainType:driveTrainType, intake:intake, capacity:capacity, AutoLineCrossing:AutoLineCrossing, AutoHighBalls:AutoHighBalls, AutoLowBalls:AutoLowBalls, climb:climb, notes:notes)
        /*
        let encoder = JSONEncoder()
        if (pretty == true)
        {
        encoder.outputFormatting = .prettyPrinted // if necessary
        }
        
        let data = try! encoder.encode(PitScoutingViewController.pitScoutingDataObj)
        
        let jsonString = String(data: data, encoding: .utf8)!
         */
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
        let s = send_post(jsonStr:jsonString)
        let s2 = send_get()
        return jsonString
    }
    func Deserialize(jsonString:String) ->
        PitScoutingData{
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
            PitScoutingViewController.pitScoutingDataObj = try! decoder.decode(PitScoutingData.self, from: jsonData);
            return dump(PitScoutingViewController.pitScoutingDataObj)
    }
    func send_post(jsonStr:String)-> String
    {
        var result = jsonStr
        let requestUrl = URL(string:"http://ec2-52-71-196-37.compute-1.amazonaws.com/pitscouting")!
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let postString=jsonStr;
        request.httpBody = postString.data(using:String.Encoding.utf8);
        let task = URLSession.shared.dataTask(with:request) {
            (data,response,error) in
            if let error = error{
                print("ERROR FOUD")
                return
            }
            if let data = data,let dataString = String(data:data,encoding:.utf8){
                print("Response data String:\n \(dataString)")
            }
        }
        task.resume()
        return result
    }
    
    func send_get() -> String
    {
        let dataString = ""
        let url = URL(string: "http://ec2-52-71-196-37.compute-1.amazonaws.com/pitscouting")
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
                print("Response data string:\n \(dataString)")
            }
            
        }
        task.resume()
        return dataString
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
            PitScoutingViewController.pitScoutingDataObj.robotNumber = RobotNumber.text!

        } else {
            print("Failed");
            RobotNumber.backgroundColor = UIColor.red
            
        }
    }
    
    

    @IBAction func driveTrainType_Selected(_ sender: Any) {
        let title = DrivetrainType.titleForSegment(at: DrivetrainType.selectedSegmentIndex)
        PitScoutingViewController.pitScoutingDataObj.driveTrainType = title!
    }
    
    @IBAction func intake_Selected(_ sender: Any) {

        let title = Intake.titleForSegment(at: Intake.selectedSegmentIndex)
        PitScoutingViewController.pitScoutingDataObj.intake = title!
    }
    
    
    @IBAction func capacity_Selected(_ sender: Any) {
        let title = Capacity.titleForSegment(at: Capacity.selectedSegmentIndex)
        PitScoutingViewController.pitScoutingDataObj.capacity = title!
    }
    
    
    @IBAction func autoLineCrossing_Selected(_ sender: Any) {
        PitScoutingViewController.pitScoutingDataObj.AutoLineCrossing = AutoLineCrossing.isOn
    }
    
    @IBAction func Climbing(_ sender: Any) {
        PitScoutingViewController.pitScoutingDataObj.climb = Climbing.isOn
    }
    
    @IBAction func AutoHighGoalBalls_Changed(_ sender: Any) {
        if(validateNumber(text: AutoHighGoalBalls.text!)) {
            // correct password
            print("Success.");
           AutoHighGoalBalls.backgroundColor = UIColor.green
            PitScoutingViewController.pitScoutingDataObj.AutoHighBalls = AutoHighGoalBalls.text!

        } else {
            print("Failed");
            AutoHighGoalBalls.backgroundColor = UIColor.red
            
        }
        
    }
    
    @IBAction func autoLowBalls_Changed(_ sender: Any) {
        if(validateNumber(text: AutoLowGoalBalls.text!)) {
            // correct password
            print("Success.");
           AutoLowGoalBalls.backgroundColor = UIColor.green
            PitScoutingViewController.pitScoutingDataObj.AutoLowBalls = AutoLowGoalBalls.text!

        } else {
            print("Failed");
            AutoLowGoalBalls.backgroundColor = UIColor.red
            
    }
   
    }
    //The thing


    
    @IBAction func submit(_ sender: Any) {
        if (Notes.text! == "Type here...") {
            Notes.text! = ""
        }
      // print("teamnum is \(teamNumber)" )
        PitScoutingViewController.pitScoutingDataObj.notes =  Notes.text!
        let payload =  Serialize(
            teamNumber: PitScoutingViewController.pitScoutingDataObj.robotNumber,
            driveTrainType: PitScoutingViewController.pitScoutingDataObj.driveTrainType,
            intake: PitScoutingViewController.pitScoutingDataObj.intake,
            capacity: PitScoutingViewController.pitScoutingDataObj.capacity,
            AutoLineCrossing: PitScoutingViewController.pitScoutingDataObj.AutoLineCrossing,
            AutoHighBalls: PitScoutingViewController.pitScoutingDataObj.AutoHighBalls,
            AutoLowBalls: PitScoutingViewController.pitScoutingDataObj.AutoLowBalls,
            climb: PitScoutingViewController.pitScoutingDataObj.climb,
            notes: PitScoutingViewController.pitScoutingDataObj.notes,
               pretty: false)
        print(payload);
        let defaults = UserDefaults.standard
        defaults.set(payload, forKey: "\(PitScoutingViewController.pitScoutingDataObj.robotNumber), PitScouting")
       if UserDefaults.standard.array(forKey: "pitScoutList") == nil{
            // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
        pitScoutList.append("\(PitScoutingViewController.pitScoutingDataObj.robotNumber), PitScouting")
           // print("teamlist is \(teamList)!")
            UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
        }
        else if UserDefaults.standard.array(forKey: "pitScoutList")!.isEmpty == false{
            
            //commented code overwrites previous entries with same team number
            pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
            breakLoop = false
            for index in 0...pitScoutList.count - 1 {
                let testString = "\(PitScoutingViewController.pitScoutingDataObj.robotNumber), PitScouting"
                if testString == pitScoutList[index]{
                    breakLoop = true
                    
                }
            }
            print("breakLoop is \(breakLoop!)")
            if breakLoop == false{
                pitScoutList.append("\(PitScoutingViewController.pitScoutingDataObj.robotNumber), PitScouting")
                //print(teamList)
                UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
            }
            else if breakLoop == true{
                let indexOfElement = pitScoutList.index(of: "\(PitScoutingViewController.pitScoutingDataObj.robotNumber), PitScouting")
                pitScoutList.remove(at: indexOfElement!)
                pitScoutList.append("\(PitScoutingViewController.pitScoutingDataObj.robotNumber), PitScouting")
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
            pitScoutList.append("\(PitScoutingViewController.pitScoutingDataObj.robotNumber), PitScouting")
           // print("pitScoutList is \(pitScoutList)")
            UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
        }
        
        performSegue(withIdentifier: "PitScoutToMenu", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    DrivetrainType.selectedSegmentIndex = 2
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
                
            }
            else{
                if UserDefaults.standard.array(forKey: "teamList") != nil{
                    teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                    print("\(teamList) and \(teamList.count)")
                    
                }
                else{
                    print("teamList is nil")
                }
            }
            
            
           
            
            
            
            
            
        }
        else{
            Notes.text = "Type here..."
        }
        
        
        
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
