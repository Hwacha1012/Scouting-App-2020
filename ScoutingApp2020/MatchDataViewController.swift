//
//  MatchDataViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/21/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

class MatchDataViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scoutLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var scoutText: UITextField!
    @IBOutlet weak var teamText: UITextField!
    @IBOutlet weak var matchText: UITextField!
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    @IBAction func segmentedChanged(_ sender: Any) {
        if(colorSegmentedControl.selectedSegmentIndex == 0){
            teamColor = true
        }
        else{
            teamColor = false
        }
        
        update()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if (matchPosition > 1){
            //load previous data
            update()
        }
        else{
            //have new data
            
            scoutName = ""
            teamNumber = 0
            matchNumber = 0
            teamColor = true
            
        }
        
    }
    
    func update(){
        scoutText.text = scoutName
        teamText.text = "\(teamNumber)"
        matchText.text = "\(matchNumber)"
        if(teamColor){
            colorSegmentedControl.selectedSegmentIndex = 0
        }
        else{
            colorSegmentedControl.selectedSegmentIndex = 1
        }
        
        
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
