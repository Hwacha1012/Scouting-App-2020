//
//  TeleOpViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/21/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit
var location = 0

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
        location = 0
        shootHigh()
    }
    @IBAction func sortaCloseButtonPressed(_ sender: Any) {
        location = 1
        shootHigh()
    }
    @IBAction func trenchButtonPressed(_ sender: Any) {
        location = 2
        shootHigh()
    }
    @IBAction func farButtonPressed(_ sender: Any) {
        location = 3
        shootHigh()
    }
    @IBAction func climbingButtonPressed(_ sender: Any) {
    }
    
    @IBAction func controlPanelButtonPressed(_ sender: Any) {
    }
    @IBAction func lowGoalButtonPressed(_ sender: Any) {
    }
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupLabel1: UILabel!
    @IBOutlet weak var popupLabel2: UILabel!
    @IBOutlet weak var popupAdd1: UIButton!
    @IBOutlet weak var popupMinus1: UIButton!
    @IBOutlet weak var popupLabel3: UILabel!
    @IBOutlet weak var popupAdd2: UIButton!
    @IBOutlet weak var popupMinus2: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBAction func popupAdd1Pressed(_ sender: Any) {
    }
    @IBAction func popupMinus1Pressed(_ sender: Any) {
    }
    @IBAction func popupAdd2Pressed(_ sender: Any) {
    }
    @IBAction func popupMinus2Pressed(_ sender: Any) {
    }
    @IBAction func enterPressed(_ sender: Any) {
    }
    @IBAction func cancelPressed(_ sender: Any) {
    }
    
    func shootHigh(){
        popupView.isHidden = false
       // popupLabel1.isHidden = false
       // popupLabel2.isHidden = false
        // popupLabel3.isHidden = false
        if(location == 0){
            popupLabel1.text = "High Shooting From Sector"
            
        }
        else if (location == 1){
            popupLabel1.text = "High Shooting From Close Shield Generator"
        }
        else if (location == 2){
            popupLabel1.text = "High Shooting From Trench"
        }
        else{
            popupLabel1.text = "High Shooting From Far Shield Generator"
        }
        
        popupLabel2.text = "Number of Balls Shot: 0"
        popupLabel3.text = "Number of Balls Made: 0"
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.isHidden = true
        
        
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
