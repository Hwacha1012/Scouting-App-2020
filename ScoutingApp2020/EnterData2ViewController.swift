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
    
    @IBAction func lowGoalAddPressed(_ sender: Any) {
    }
    @IBAction func lowGoalMinusPressed(_ sender: Any) {
    }
    
    @IBAction func highGoalAddPressed(_ sender: Any) {
    }
    @IBAction func highGoalMinusPressed(_ sender: Any) {
    }
    
    @IBAction func trenchAddPressed(_ sender: Any) {
    }
    @IBAction func trenchMinusPressed(_ sender: Any) {
    }
    @IBAction func shieldAddPressed(_ sender: Any) {
    }
    @IBAction func shieldMinusPressed(_ sender: Any) {
    }
    
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
