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
    var tempMade = 0
    var tempTaken = 0
    
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
    @IBOutlet weak var wheelSegmentedControl: UISegmentedControl!
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
        controlPanel()
        
    }
    @IBAction func lowGoalButtonPressed(_ sender: Any) {
        location = 4
        shootLow()
        
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
        if(location < 4){
            tempTaken += 1
            popupLabel2.text = "Number of Balls Shot: \(highGoalTaken[location] + tempTaken)"
        }
        else if(location == 4){
            tempTaken += 1
            popupLabel2.text = "Number of Balls Shot: \(lowGoalTaken + tempTaken)"
        }
    }
    @IBAction func popupMinus1Pressed(_ sender: Any) {
        if(location < 4){
            if(highGoalTaken[location] + tempTaken > 0){
                tempTaken -= 1
                popupLabel2.text = "Number of Balls Shot: \(highGoalTaken[location] + tempTaken)"
            }
        }
        else if(location == 4){
            if(lowGoalTaken + tempTaken > 0){
                tempTaken -= 1
                popupLabel2.text = "Number of Balls Shot: \(lowGoalTaken + tempTaken)"
            }
            
        }
        
    }
    @IBAction func popupAdd2Pressed(_ sender: Any) {
        if(location < 4){
            tempMade += 1
            popupLabel3.text = "Number of Balls Made: \(highGoalMade[location] + tempMade)"
        }
        else if(location == 4){
            tempMade += 1
            popupLabel3.text = "Number of Balls Made: \(lowGoalMade + tempMade)"
        }
    }
    @IBAction func popupMinus2Pressed(_ sender: Any) {
        if(location < 4){
            if(highGoalMade[location] + tempMade > 0){
                tempMade -= 1
                popupLabel3.text = "Number of Balls Made: \(highGoalMade[location] + tempMade)"
            }
        }
        else if(location == 4){
            if(lowGoalMade + tempMade > 0){
                tempMade -= 1
                popupLabel2.text = "Number of Balls Made: \(lowGoalMade + tempMade)"
            }
            
        }
    }
    
    @IBAction func enterPressed(_ sender: Any) {
        if(location < 4){
            highGoalTaken[location] += tempTaken
            highGoalMade[location] += tempMade
        }
        else if (location == 4){
            lowGoalTaken += tempTaken
            lowGoalMade += tempMade
        }
        
        tempTaken = 0
        tempMade = 0
        popupView.isHidden = true
         
    }
    @IBAction func cancelPressed(_ sender: Any) {
        tempTaken = 0
        tempMade = 0
        popupView.isHidden = true
        
        
    }
    @IBAction func wheelControlChanged(_ sender: Any) {
        if(wheelSegmentedControl.selectedSegmentIndex == 0){
            
        }
        
    }
    
    func shootHigh(){
        popupView.isHidden = false
        wheelSegmentedControl.isHidden = true
        popupAdd1.isHidden = false
        popupMinus1.isHidden = false
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
        
        popupLabel2.text = "Number of Balls Shot: \(highGoalTaken[location])"
        popupLabel3.text = "Number of Balls Made: \(highGoalMade[location])"

    }
    
    func shootLow(){
        popupView.isHidden = false
        wheelSegmentedControl.isHidden = true
        popupAdd1.isHidden = false
        popupMinus1.isHidden = false
        popupLabel1.text = "Low Goal Shooting"
        popupLabel2.text = "Number of Balls Shot: \(lowGoalTaken)"
        popupLabel3.text = "Number of Balls Made: \(lowGoalMade)"
        
    }
    
    func controlPanel(){
        popupView.isHidden = false
        wheelSegmentedControl.isHidden = false
        popupAdd1.isHidden = true
        popupMinus1.isHidden = true
        
        
    }
    
    //func updateLabels(){
        
    //}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.isHidden = true
        enterButton.setTitle("Enter Data", for: .normal)
        cancelButton.setTitle("Cancel", for: .normal)
        
        if(teamColor){
            backgroundImage.image = UIImage(named: "TopViewBlue.png")
        }
        else{
            backgroundImage.image = UIImage(named: "TopViewRed.png")
        }
        
        
        if (matchPosition > 3){
            //load previous data
            //updateLabels()
            
        }
        else{
            //have new data
            for i in 0...3{
                highGoalMade[i] = 0
                highGoalTaken[i] = 0
            }
        }
        
        
        
       
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - BRUH

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
