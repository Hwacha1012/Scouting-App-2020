//
//  EnterData1ViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 1/17/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

class EnterData1ViewController: UIViewController {
    @IBOutlet weak var matchData: UIButton!
    
    @IBOutlet weak var pitScouting: UIButton!
    @IBAction func matchDataPressed(_ sender: Any) {
        performSegue(withIdentifier: "EnterData1ToEnterData2", sender: nil)
    }
    @IBAction func pitScoutPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
 //   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     //   performSegue(withIdentifier: "EnterData1ToEnterData2", sender: nil)
   // }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
