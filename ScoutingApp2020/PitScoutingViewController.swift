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
/// The Class that deals with PitScoutingData and Initializes all variables in a format that can be inserted into a JSON.
class PitScoutingData: Codable {
    /// Variable that holds the value of robotNumber as a String
    public var robotNumber:String
    /// Variable that holds the value of driveTrainType as a String
    public var driveTrainType:String
    /// Variable that holds the value of intake as a String
    public var intake:String
    /// Variable that holds the value of capacity as a String
    public var capacity:String
    /// Variable that holds the value of AutoLineCrossing as a Bool
    public var AutoLineCrossing:Bool
    /// Variable that holds the value of AutoHighBalls as a String
    public var AutoHighBalls:String
    /// Variable that holds the value of AutoLowBalls as a String
    public var AutoLowBalls:String
    /// Variable that holds the value of climb as a Bool
    public var climb:Bool
    /// Variable that holds the value of notes as a String
    public var notes:String
    
    /**
    Initializes the variables used in the JSON string
     - Parameter robotNumber: robotNumber as a String
     - Parameter driveTrainType: driveTrainType as a String
     - Parameter intake: intake as a String
     - Parameter capacity: capacity as a String
     - Parameter AutoLineCrossing: AutoLineCrossing as a Bool
     - Parameter AutoHighBalls: AutoHighBalls as a String
     - Parameter AutoLowBalls :AutoLowBalls as a String
     - Parameter climb: climb as a Bool
     - Parameter notes: notes as a String
     */
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
/// The original object that manages a view hierarchy for the UIKit in the PitScouting View Controller. Extends UIViewController
class PitScoutingViewController: UIViewController {
    /// An Object that contains data that is to be serialized and saved on the AWS Server. Initialized with the default values for robotNumber, driveTrainType, intake, capacity, AutoLineCrossing, AutoHighBalls, AutoLowBalls, climb, and notes.
    public static var pitScoutingDataObj = PitScoutingData(robotNumber: "", driveTrainType:"Tank", intake:"Floor", capacity:"1", AutoLineCrossing:true, AutoHighBalls:"", AutoLowBalls:"", climb:true, notes:"")
    
    public struct Throwable<T: Decodable>: Decodable {
        let result: Result<T, Error>

        init(from decoder: Decoder) throws {
            result = Result(catching: { try T(from: decoder) })
        }
    }
    
    
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
    
    /**
        A function that  serializes robotNumber, driveTrainType, intake, capacity, AutoLineCrossing, AutoHighBalls, AutoLowBalls, climb, and notes into JSON format using an array
        - Parameter teamNumber: meant to be robotNumber as a String, e.g., 2170
        - Parameter driveTrainType: driveTrainType as a String
        - Parameter intake: intake as a String
        - Parameter capacity: capacity as a String
        - Parameter AutoLineCrossing: AutoLineCrossing as a Bool
        - Parameter AutoHighBalls: AutoHighBalls as a String
        - Parameter AutoLowBalls :AutoLowBalls as a String
        - Parameter climb: climb as a Bool
        - Parameter notes: notes as a String
        - Parameter pretty: somewhat still necessary; formerly used to display text in the console
        - returns: The JSON string that was serialized by the function
     */
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
       
        if(PitScoutingViewController.pitScoutingDataObj.notes.contains("Type here...") ?? false){
            let a = PitScoutingViewController.pitScoutingDataObj.notes.components(separatedBy: "Type here...")
            PitScoutingViewController.pitScoutingDataObj.notes = a[1]
        }
        
        if ( PitScoutingViewController.pitScoutingDataObj.notes == "")
        {
             PitScoutingViewController.pitScoutingDataObj.notes = "NONE"
        }
        
        /// An array used to combine all of the variables into one giant string sent as a JSON, as swift is stupid and you can't add strings together
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
    /**
     A function used to deserialize a list of JSON strings
     - Parameter jsonString: The list JSON string in a single string to be deserialized
     - returns: The Deserialized list of JSONs
     */
    func DeserializeList(jsonString:String) ->
        [Throwable<PitScoutingData>]{
        let jsonData = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        var teamData = try! decoder.decode([Throwable<PitScoutingData>].self, from: jsonData);
        print(teamData)
        // let products = throwables.compactMap { try? $0.result.get() }

        return teamData
    }
    /**
    A function used to deserialize a single JSON strings
     - Parameter jsonString: The  JSON string to be deserialized
     - returns: The Deserialized JSON
    */
    func Deserialize(jsonString:String) ->
            PitScoutingData{
            let jsonData = jsonString.data(using: .utf8)!
            let decoder = JSONDecoder()
                PitScoutingViewController.pitScoutingDataObj = try! decoder.decode(PitScoutingData.self, from: jsonData);
                return dump(PitScoutingViewController.pitScoutingDataObj)
    }
    /**
    A function used to send a post request(A request to add an additional JSON String to the data to the AWS Server at: http://ec2-52-71-196-37.compute-1.amazonaws.com/pitscouting )
     - Parameter jsonStr: The  JSON string to be sent to the server
     - returns: The response from the server
    */
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
    /**
    A function used to send a get request(A request to get the full JSON string from the server at:  http://ec2-52-71-196-37.compute-1.amazonaws.com/pitscouting )
     - returns: The full JSON String from the AWS Server
     */
    func send_get() -> [Throwable<PitScoutingData>]
    {
        var teamData: [Throwable<PitScoutingData>] = Array()
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
                teamData = self.DeserializeList(jsonString:dataString)
            }
            
        }
        task.resume()
        return teamData
    }
    
    /**
     Checks whether number was inputted into the text box, and turns green if the input text was a number, otherwise keeps it red
     - Parameter text: The input text from the user
     - returns: A boolean that tells whether the input text was a number or not
     */
    func validateNumber(text: String) -> Bool {
        var result = false
        // test password
           let num = Int(text);

           if num != nil {
              result = true
           }
        return result
    }

/**
     Code no longer is necessary
*/
    @IBAction func buttonPressed(_ sender: Any) {
      print("You may enter")

    }
/**
         Checks whether the user input for robotNumber is a a legitamate answer and reacts accordingly
*/
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
        if(Notes.text!.contains("Type here...") ?? false){
            let a = Notes.text!.components(separatedBy: "Type here...")
            Notes.text! = a[1]
        }
        if (Notes.text! == "")
        {
            Notes.text! = "NONE"
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
        print("payload is \(payload)");
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
              
              
             // var data = Deserialize(jsonString: defaults.object(forKey: pitScoutList[counter]) as! String)
            
            
            //use defaults.object(forKey: pitScoutList[counter] instead of pitTeams[index]
            
            var dataToAdd2 = defaults.string(forKey: pitScoutList[counter])
              
            //defaults.
            let pitArr = dataToAdd2!.components(separatedBy: "=")
              var pitArr2 = Array(repeating: "", count: pitArr.count - 1)
              
              for i in 1...pitArr.count - 1{
                  let a = pitArr[i].components(separatedBy: "&")
                  pitArr2[i-1] = a[0]
              }
                  
                  PitScoutingViewController.pitScoutingDataObj = PitScoutingData(robotNumber: pitArr2[0], driveTrainType:pitArr2[1], intake:pitArr2[2], capacity:pitArr2[3], AutoLineCrossing:Bool(pitArr2[4])!, AutoHighBalls:pitArr2[5], AutoLowBalls:pitArr2[6], climb:Bool(pitArr2[7])!, notes:pitArr2[8])
              
              
                RobotNumber.text =  PitScoutingViewController.pitScoutingDataObj.robotNumber
                RobotNumber.backgroundColor = UIColor.green
                print("driveTrain type is \( PitScoutingViewController.pitScoutingDataObj.driveTrainType)")
                if( PitScoutingViewController.pitScoutingDataObj.driveTrainType == "Tank"){
                    DrivetrainType.selectedSegmentIndex = 0
                }
                else if( PitScoutingViewController.pitScoutingDataObj.driveTrainType == "Mechanum"){
                    DrivetrainType.selectedSegmentIndex = 1
                }
                else if( PitScoutingViewController.pitScoutingDataObj.driveTrainType == "H-Drive"){
                    DrivetrainType.selectedSegmentIndex = 2
                }
                else if( PitScoutingViewController.pitScoutingDataObj.driveTrainType == "Swerve"){
                    DrivetrainType.selectedSegmentIndex = 3
                }
                if( PitScoutingViewController.pitScoutingDataObj.intake == "Floor"){
                    Intake.selectedSegmentIndex = 0
                
                }
                else{
                    Intake.selectedSegmentIndex = 1
                }
                
                Capacity.selectedSegmentIndex = (Int( PitScoutingViewController.pitScoutingDataObj.capacity) ?? 1) - 1
                AutoLineCrossing.isOn =  PitScoutingViewController.pitScoutingDataObj.AutoLineCrossing
                AutoHighGoalBalls.text =  PitScoutingViewController.pitScoutingDataObj.AutoHighBalls
                AutoHighGoalBalls.backgroundColor = UIColor.green
                AutoLowGoalBalls.text =  PitScoutingViewController.pitScoutingDataObj.AutoLowBalls
                AutoLowGoalBalls.backgroundColor = UIColor.green
                Climbing.isOn =  PitScoutingViewController.pitScoutingDataObj.climb
                Notes.text =  PitScoutingViewController.pitScoutingDataObj.notes
                
            

          
          
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
}
