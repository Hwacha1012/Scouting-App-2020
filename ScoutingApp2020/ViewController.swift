//
//  ViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/10/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit
var teamList = [String]()
var pitScoutList = [String]()
var intakeType = ""

var autoLine = false
var autoLowGoal = 0
var autoHighGoal = 0
var autoTrenchBalls = 0
var autoShieldBalls = 0

var controlPanel = ""
var lowGoalMade = 0
var lowGoalTaken = 0
var highGoalMade = [Int]()
var highGoalTaken = [Int]()
var defenseTime = 0
var climbing = false
var climbingOtherRobots = 0
var climbBalanced = false



// "2170; 1", 



//UIColor teamColor = UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0)

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var enterData: UIButton!
    @IBOutlet weak var viewData: UIButton!
    @IBOutlet weak var importData: UIButton!
 
    @IBOutlet weak var exportData: UIButton!
    @IBAction func enterDataPressed(_ sender: Any) {
        //EnterData1ViewController.present(<#T##self: UIViewController##UIViewController#>)
        //EnterData1ViewController.modalPresentationStyle = .fullScreen
        //present(EnterData1ViewController, animated: true)
        
       performSegue(withIdentifier: "viewToEnterData1", sender: nil)
    }
    @IBAction func viewDataPressed(_ sender: Any) {
    }
    @IBAction func importDataPressed(_ sender: Any) {
    }
    @IBAction func exportDataPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var runType = 2
        
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
        }
        else{
            enterData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            viewData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            exportData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            importData.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            // pitScoutingButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 75)
            titleLabel2.font = UIFont.init(name: "Futura-MediumItalic", size: 75)
        }
        
       // var bColor = UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0)

        
        
        imageView.image = UIImage(named: "GHSRoboticsLogo2170.png")
                view.sendSubviewToBack(imageView)
        
        enterData.titleLabel!.minimumScaleFactor = 0.01
        enterData.titleLabel!.numberOfLines = 2
        enterData.titleLabel!.adjustsFontSizeToFitWidth = true
        enterData.titleLabel!.textAlignment = NSTextAlignment.center
        enterData.setTitleColor(UIColor.init(red: 0, green: 1, blue: 0.50196078431, alpha: 1.0), for: .normal)
        enterData.setTitle("Enter Data", for: .normal)
        
        viewData.titleLabel!.minimumScaleFactor = 0.01
        viewData.titleLabel!.numberOfLines = 2
        viewData.titleLabel!.adjustsFontSizeToFitWidth = true
        viewData.titleLabel!.textAlignment = NSTextAlignment.center
        viewData.setTitleColor(UIColor.init(red: 0, green: 1, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        
        importData.titleLabel!.minimumScaleFactor = 0.01
        importData.titleLabel!.numberOfLines = 2
        importData.titleLabel!.adjustsFontSizeToFitWidth = true
        importData.titleLabel!.textAlignment = NSTextAlignment.center
        importData.setTitleColor(UIColor.init(red: 0, green: 1, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        
        
        exportData.titleLabel!.minimumScaleFactor = 0.01
        exportData.titleLabel!.numberOfLines = 2
        exportData.titleLabel!.adjustsFontSizeToFitWidth = true
        exportData.titleLabel!.textAlignment = NSTextAlignment.center
        exportData.setTitleColor(UIColor.init(red: 0, green: 1, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        
    
    }


}

