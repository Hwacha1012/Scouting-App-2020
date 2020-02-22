//
//  ViewDataViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 2/7/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit
var teamNumberFromButton = ""


class ViewDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBAction func changeDataPressed(_ sender: Any) {
        let buttonPosition:CGPoint = (sender as AnyObject).convert(CGPoint.zero, to:self.tableView)
            let indexPath1 = self.tableView.indexPathForRow(at: buttonPosition)
            
            if indexPath1![1] < teamList.count {
                teamNumberFromButton = teamList[(indexPath1![1])]
                changeData = true
                performSegue(withIdentifier: "editMatchData", sender: nil)
            }
            else {
                teamNumberFromButton = pitScoutList[(indexPath1![1] - teamList.count)]
                changeData = true
                performSegue(withIdentifier: "showPitScouting", sender: nil)
            }
            
            
            
           // print("teamNumberFromButton is \(teamNumberFromButton)")
           // print(indexPath1![1])
            
           
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(pitScoutList.count + teamList.count)
        return (pitScoutList.count + teamList.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         
         let row = indexPath.row
         //cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
         var fontSize: CGFloat!
         if runType == 1{
             fontSize = 36
             
         }
         else if runType == 2{
             fontSize = 18
         }
         print(fontSize)
         cell.textLabel?.font = UIFont.init(name: "Futura-MediumItalic", size: fontSize)
         // cell.textLabel?.font = UIFont.init
         cell.textLabel?.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
         
         if row < teamList.count {
             cell.textLabel?.text = "Team \(teamList[row])"
         }
         else{
             cell.textLabel?.text = "Team \(pitScoutList[row-teamList.count])"
         }

         
        /* if teamList.count == 0{
             cell.textLabel?.text = "Team \(pitScoutList[row])"
         }
         else if row > (teamList.count - 1) && row < ((teamList.count - 1) + pitScoutList.count){
             cell.textLabel?.text = "Team \(pitScoutList[((row + 1) - (teamList.count + 1))])"
         }
         else if row >= ((teamList.count - 1) + pitScoutList.count){
             cell.textLabel?.text = "Match \(superScoutList[((row + 1) - (teamList.count + 1 + pitScoutList.count))])"
         }
             
         else {
             cell.textLabel?.text = "Team \(teamList[row])"
         }
         */
         
         return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            print("Deleted")
            
            if indexPath.row < teamList.count {
                UserDefaults.standard.removeObject(forKey: "\(teamList[indexPath.row])")
                teamList.remove(at: indexPath.row)
            }
           // else if indexPath.row >= teamList.count && indexPath.row < teamList.count + pitScoutList.count{
            else{
                
                UserDefaults.standard.removeObject(forKey: "\(pitScoutList[(indexPath.row-teamList.count)])")
                pitScoutList.remove(at: (indexPath.row-teamList.count))
            }
            

        /*
            if indexPath.row > (teamList.count - 1) && indexPath.row < (teamList.count + pitScoutList.count - 1){
                //cell.textLabel?.text = "Team \(pitScoutList[(row - (teamList.count + 1))])"
                UserDefaults.standard.removeObject(forKey: "\(pitScoutList[(indexPath.row - (teamList.count))])")
                pitScoutList.remove(at: (indexPath.row - (teamList.count)))
            }
            else if teamList.count == 0{
                UserDefaults.standard.removeObject(forKey: "\(pitScoutList[indexPath.row])")
                pitScoutList.remove(at: indexPath.row)
            }
            else {
                UserDefaults.standard.removeObject(forKey: "\(teamList[indexPath.row])")
                teamList.remove(at: indexPath.row)
            }
          */
            // UserDefaults.standard.removeObject(forKey: "\(teamList[indexPath.row])")
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            //self.catNames.remove(at: indexPath.row)
            //tableView.beginUpdates()
            // print("here!")
            
            // print("here")
            //self.tableView.endUpdates()
            // print("here!!")
            
            
            //tableView.reloadData()
            // self.tableView.deleteRows(at: <#T##[IndexPath]#>, with: .)
            //print("hi")
            
            UserDefaults.standard.set(teamList, forKey: "teamList")
            UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
            
           // print("teamList is \(teamList)")
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if UserDefaults.standard.array(forKey: "teamList") != nil{
            teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
            print("\(teamList) and \(teamList.count)")
            
        }
        else{
            print("teamList is nil")
        }
        
        if UserDefaults.standard.array(forKey: "pitScoutList") != nil{
            pitScoutList = UserDefaults.standard.object(forKey: "pitScoutList") as! [String]
            print("\(pitScoutList) and \(pitScoutList.count)")
            
        }
        else{
            print("pitScoutList is nil")
        }
        tableView.rowHeight = 60
        //teamList.removeFirst()
       // teamList.append("Test")
       // print(teamList[0])
            
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
