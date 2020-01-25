//
//  TeleOpViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/21/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

class TeleOpViewController: UIViewController {
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var sortaCloseButton: UIButton!
    @IBOutlet weak var trenchButton: UIButton!
    @IBOutlet weak var farButton: UIButton!
    @IBOutlet weak var climbingButton: UIButton!
    @IBOutlet weak var controlArrow: UIImageView!
    @IBOutlet weak var lowGoalArrow: UIImageView!
    
    @IBOutlet weak var controlPanelButton: UIButton!
    @IBOutlet weak var lowGoalButton: UIButton!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func closeButtonPressed(_ sender: Any) {
    }
    @IBAction func sortaCloseButtonPressed(_ sender: Any) {
    }
    @IBAction func trenchButtonPressed(_ sender: Any) {
    }
    @IBAction func farButtonPressed(_ sender: Any) {
    }
    @IBAction func climbingButtonPressed(_ sender: Any) {
    }
    
    @IBAction func controlPanelButtonPressed(_ sender: Any) {
    }
    @IBAction func lowGoalButtonPressed(_ sender: Any) {
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if (matchPosition > 3){
            //load previous data
            //updateLabels()
            
        }
        else{
            //have new data
          /*  lowGoalLabel.text = "Low Goal Balls: 0"
            highGoalLabel.text = "High Goal Balls: 0"
            trenchLabel.text = "Trench Run Balls Grabbed: 0"
            shieldGenLabel.text = "Shield Generator Balls Grabbed: 0"
            autoHighGoal = 0
            autoLowGoal = 0
            autoTrenchBalls = 0
            autoShieldBalls = 0
            crossedSwitch.setOn(false, animated: false)
            autoLine = false
 */
            
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
