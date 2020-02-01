//
//  PitScoutingViewController.swift
//  ScoutingApp2020
//
//  Created by ghsrobotics on 1/25/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

class PitScoutingViewController: UIViewController {

    @IBOutlet weak var RobotNumber: UITextField!
    
    
    @IBOutlet weak var DrivetrainType: UISegmentedControl!
    
    
    @IBOutlet weak var Intake: UISegmentedControl!
    
    
    @IBOutlet weak var Capacity: UISegmentedControl!
    
    
    @IBOutlet weak var AutoLineCrossing: UISwitch!
    
    
    @IBOutlet weak var AutoHighGoalBalls: UITextField!
    
    
    @IBOutlet weak var AutoLowGoalBalls: UITextField!
    
    @IBOutlet weak var Next: UIButton!
    
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
