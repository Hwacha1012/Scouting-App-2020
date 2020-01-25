//
//  EnterData2ViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/17/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

class EnterData2ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineLabel: UILabel!
    @IBOutlet weak var crossedSwitch: UISwitch!
    @IBOutlet weak var lowGoalLabel: UILabel!
    
    @IBOutlet weak var highGoalLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerCellsLabel: UILabel!
    @IBOutlet weak var trenchLabel: UILabel!

    @IBOutlet weak var shieldGenLabel: UILabel!
    @IBOutlet weak var lowAddButton: UIButton!
    @IBOutlet weak var lowMinusButton: UIButton!
    @IBOutlet weak var highAddButton: UIButton!
    @IBOutlet weak var highMinusButton: UIButton!
    
    @IBOutlet weak var trenchAddButton: UIButton!
    @IBOutlet weak var trenchMinusButton: UIButton!
    @IBOutlet weak var shieldAddButton: UIButton!
    @IBOutlet weak var shieldMinusButton: UIButton!
    @IBOutlet weak var teleOpButton: UIButton!
    
    @IBAction func lowGoalAddPressed(_ sender: Any) {
        autoLowGoal += 1
        updateLabels()
    }
    @IBAction func lowGoalMinusPressed(_ sender: Any) {
        //can't go below 0
        if (autoLowGoal > 0){
            autoLowGoal -= 1
            updateLabels()
        }
        
    }
    
    @IBAction func highGoalAddPressed(_ sender: Any) {
        autoHighGoal += 1
        updateLabels()
    }
    @IBAction func highGoalMinusPressed(_ sender: Any) {
        //can't go below 0
        //print("pressed")
        if (autoHighGoal > 0){
            autoHighGoal -= 1
            updateLabels()
        }
    }
    
    @IBAction func trenchAddPressed(_ sender: Any) {
        autoTrenchBalls += 1
        updateLabels()
    }
    @IBAction func trenchMinusPressed(_ sender: Any) {
        //can't go below 0
        if (autoTrenchBalls > 0){
            autoTrenchBalls -= 1
            updateLabels()
        }
    }
    @IBAction func shieldAddPressed(_ sender: Any) {
        autoShieldBalls += 1
        updateLabels()
    }
    @IBAction func shieldMinusPressed(_ sender: Any) {
        //can't go below 0
        if (autoShieldBalls > 0){
            autoShieldBalls -= 1
            updateLabels()
        }
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        autoLine = crossedSwitch.isOn
    }
    @IBAction func teleOpButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "AutoToTeleOp", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if (matchPosition > 2){
            //load previous data
            updateLabels()
        }
        else{
            //have new data
            lowGoalLabel.text = "Low Goal Balls: 0"
            highGoalLabel.text = "High Goal Balls: 0"
            trenchLabel.text = "Trench Run Balls Grabbed: 0"
            shieldGenLabel.text = "Shield Generator Balls Grabbed: 0"
            autoHighGoal = 0
            autoLowGoal = 0
            autoTrenchBalls = 0
            autoShieldBalls = 0
            crossedSwitch.setOn(false, animated: false)
            autoLine = false
            
        } 
        
        if (runType == 2) {
            lineLabel.font = UIFont.init(name: "Optimia-BoldItalic", size: 35)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateLabels(){
        crossedSwitch.setOn(autoLine, animated: false)
        lowGoalLabel.text = "Low Goal Balls: \(autoLowGoal)"
        highGoalLabel.text = "High Goal Balls: \(autoHighGoal)"
        trenchLabel.text = "Trench Run Balls Grabbed: \(autoTrenchBalls)"
        shieldGenLabel.text = "Shield Generator Balls Grabbed: \(autoShieldBalls)"
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
