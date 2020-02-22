//
//  ViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/10/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit
/// List of all the teams recorded on your device, used by MatchData, e.g., (example array needed)
var teamList = [String]()
/// List of all the teams recorded on your device, used by PitScouting, e.g.,(example array needed)
var pitScoutList = [String]()
/// Name of the Scout, e.g., Manav Mittal
var scoutName = ""
/// The number of the team that you are scouting, e.g., 2170.
var teamNumber = 0
/// The number of the match the team that you are scouting is playing in, e.g., 69
var matchNumber = 0
/// The color the team scouted is competing under, where true is blue and false is red, e.g., true
var teamColor = true
/// The intake type the robot uses to collect balls from the playing field, e.g., floor, feeding station
var intakeType = ""
/// Whether the decive running is an iPhone or iPad, where 0 is iPhone and 1 is iPad, e.g., 1
var runType = 1 //default is running as iPad
/// Whether the Team Scouted crosses the line in auto, e.g., 1
var autoLine = false //do they cross the line in auto
/// The amount of low goals scored in auto, e.g., 7
var autoLowGoal = 0 //low goals scored in auto
/// The amount of high goals scored in auto, e.g., 7
var autoHighGoal = 0 //high goals scored in auto
/// The amount of trench balls picked up in auto, e.g., 7
var autoTrenchBalls = 0 //trench balls picked up in auto
/// The amount of balls obtained from shield generator, e.g., 7
var autoShieldBalls = 0 //balls you get from shield generator
/// The action excercised on the control panel, e.g., nothing, spin, select
var controlPanel = "" //what did they do with the control panel ex. no, spin, select
/// The amount of low goals scored in teleop, e.g., 7
var lowGoalMade = 0 //low goals made in teleop
/// The amount of low goals shots taken in teleop, e.g., 7
var lowGoalTaken = 0 //shots taken intended for low goal taken in teleop
/// Leo needs to explain this (example array needed)
var highGoalMade = [0, 0, 0, 0] //low goals made in teleop array specifies location shot was
/// Leo needs to explain this (example array needed)
var highGoalTaken = [0, 0, 0, 0] //shots taken intended for low goal taken in teleop array specifies location shot was taken from
/// Whether or not the robot climbs, e.g., true
var climbing = false //do they climb
/// The amount of other robots they climbed with, e.g., 2
var climbingOtherRobots = 0 //how many other robots they climbed with
/// Whether or not the climb was balanced, e.g., true
var climbBalanced = false //was the climb balanced
/// The position of the user in the app, where 1 is Match Data, 2 is Enter Data, and 3 is TeleOp, e.g., 3
var matchPosition = 0 // 1 is Match Data, 2 is Enter Data, 3 teleop
/// Leo needs to explain this
var changeData = false //changing data from tableView?
/// Leo needs to explain this
var qrImage: UIImage!


// "2170; 1", 



//UIColor teamColor = UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0)

/// The original object that manages a view hierarchy for your UIKit app. Extends UIViewController
class ViewController: UIViewController {
    /// Integer that is changed when one of the four buttons is pressed, where when popup1Clicked is activated, 1 is MatchDataSegue, 2 is QRExportSegue, and 3 is viewDataSegue, and where popup2Clicked is activated, 1 is PitScoutSegue, 2 is WebExportSegue, and 3 is a UIApplication open command to open a website, e.g., 1
    var selectedMode = 0
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enterData: UIButton!
    @IBOutlet weak var viewData: UIButton!
    @IBOutlet weak var importData: UIButton!
 
    @IBOutlet weak var exportData: UIButton!
    
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupLabel: UILabel!

    @IBOutlet weak var popupButton1: UIButton!
    @IBOutlet weak var popupButton2: UIButton!
    
    @IBAction func popup1Clicked(_ sender: Any) {
        popupView.isHidden = true
        if(selectedMode == 1){
            matchPosition = 1
            performSegue(withIdentifier: "MatchDataSegue", sender: nil)
        }
        else if(selectedMode == 2){
            performSegue(withIdentifier: "QRExportSegue", sender: nil)
        }
        else if (selectedMode == 3){
            performSegue(withIdentifier: "viewDataSegue", sender: nil)
        }
    }
    
    @IBAction func popup2Clicked(_ sender: Any) {
        popupView.isHidden = true
        if(selectedMode == 1){
            
            performSegue(withIdentifier: "PitScoutSegue", sender: nil)
        }
        else if(selectedMode == 2){
            
            performSegue(withIdentifier: "WebExportSegue", sender: nil)
        }
        else if(selectedMode == 3){
            if let url = URL(string: "https://www.google.com") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func enterDataPressed(_ sender: Any) {

        popupView.isHidden = false
        popupLabel.text = "Enter Data"
        popupButton1.setTitle("Match Data", for: .normal)
        popupButton2.setTitle("Pit Scouting Data", for: .normal)
        selectedMode = 1
       // matchPosition = 0
      // performSegue(withIdentifier: "viewToEnterData1", sender: nil)
        
        
    }
    @IBAction func viewDataPressed(_ sender: Any) {
      //  let x = "Bruh" + "hsdf"
        popupView.isHidden = false
        popupLabel.text = "View Data"
        popupButton1.setTitle("View Local Data", for: .normal)
        popupButton2.setTitle("View Cloud Data", for: .normal)
        selectedMode = 3
        
        
    }
    @IBAction func importDataPressed(_ sender: Any) {
        performSegue(withIdentifier: "qrReaderSegue", sender: nil)
    }
    @IBAction func exportDataPressed(_ sender: Any) {
        popupView.isHidden = false
        popupLabel.text = "Export Data"
        popupButton1.setTitle("QR Export", for: .normal)
        popupButton2.setTitle("Web Server Export", for: .normal)
        selectedMode = 2
       // performSegue(withIdentifier: "QRExportSegue", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        popupView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*
      let d =  UserDefaults.standard
      d.removeObject(forKey: "pitScoutList")
        d.removeObject(forKey: "teamList")
       d.synchronize()
        */
        // MARK: - RunType is set
        
        
        if UIDevice.current.model.range(of:"iPad") != nil{
            //device is iPad
            runType = 1
        }
        else if UIDevice.current.model.range(of: "iPhone") != nil{
            //device is iPhone
            // print("deviceName is \(deviceName)")
            runType = 2
        }
      //  print("deviceName is \(deviceName)!")
        
        if(runType == 1){
            enterData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            viewData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            exportData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            importData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
           // pitScoutingButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            titleLabel2.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            
            
                popupButton1.titleLabel!.font = UIFont.init( name: "Optima-BoldItalic", size: 65)
                popupButton2.titleLabel!.font = UIFont.init( name: "Optima-BoldItalic", size: 65)
                popupLabel.font = UIFont.init( name: "Futura-MediumItalic", size: 70)
            
      
            
        }
        else{
            enterData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            viewData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            exportData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            importData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            // pitScoutingButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 75)
            titleLabel2.font = UIFont.init(name: "Futura-MediumItalic", size: 75)
            popupButton1.titleLabel!.font = UIFont.init( name: "Optima-BoldItalic", size: 40)
            popupButton2.titleLabel!.font = UIFont.init( name: "Optima-BoldItalic", size: 40)
            popupLabel.font = UIFont.init( name: "Futura-MediumItalic", size: 75)
        }
        
        
        
       // var bColor = UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0)

        
        
        imageView.image = UIImage(named: "GHSRoboticsLogo2170.png")
                view.sendSubviewToBack(imageView)
        
        enterData.titleLabel!.minimumScaleFactor = 0.01
        enterData.titleLabel!.numberOfLines = 2
        enterData.titleLabel!.adjustsFontSizeToFitWidth = true
        enterData.titleLabel!.textAlignment = NSTextAlignment.center
        enterData.setTitleColor(UIColor.init(red: 0, green: 0, blue: 0.5, alpha: 1.0), for: .normal)
        enterData.setTitle("Enter Data", for: .normal)
        viewData.setTitle("View Data", for: .normal)
        exportData.setTitle("Export Data", for: .normal)
        importData.setTitle("Import Data", for: .normal)
        viewData.titleLabel!.minimumScaleFactor = 0.01
        viewData.titleLabel!.numberOfLines = 2
        viewData.titleLabel!.adjustsFontSizeToFitWidth = true
        viewData.titleLabel!.textAlignment = NSTextAlignment.center
        viewData.setTitleColor(UIColor.init(red: 0, green: 0, blue: 0.5, alpha: 1.0), for: .normal)
        
        
        importData.titleLabel!.minimumScaleFactor = 0.01
        importData.titleLabel!.numberOfLines = 2
        importData.titleLabel!.adjustsFontSizeToFitWidth = true
        importData.titleLabel!.textAlignment = NSTextAlignment.center
        importData.setTitleColor(UIColor.init(red: 0, green: 0, blue: 0.5, alpha: 1.0), for: .normal)
        
        
        
        exportData.titleLabel!.minimumScaleFactor = 0.01
        exportData.titleLabel!.numberOfLines = 2
        exportData.titleLabel!.adjustsFontSizeToFitWidth = true
        exportData.titleLabel!.textAlignment = NSTextAlignment.center
        exportData.setTitleColor(UIColor.init(red: 0, green: 0, blue: 0.5, alpha: 1.0), for: .normal)
        
        changeData = false
        
        
        popupView.isHidden = true
        
        
    
    }


}




 
