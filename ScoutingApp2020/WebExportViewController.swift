//
//  WebExportViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 2/8/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit


class WebExportViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
          var qrCodeString = ""
          if UserDefaults.standard.array(forKey: "pitScoutList")?.isEmpty == false{
              pitScoutList = UserDefaults.standard.object(forKey: "pitScoutList") as! [String]
           //   print("\(pitScoutList) and \(pitScoutList.count)")
              
              for index in 0...(pitScoutList.count - 1){
                  if UserDefaults.standard.object(forKey: "\(pitScoutList[index])") != nil{
                      let addString2 = UserDefaults.standard.object(forKey: "\(pitScoutList[index])")
                      
                      if qrCodeString == ""{
                          qrCodeString = " \(addString2!)"
                      }
                      else{
                          qrCodeString = "\(qrCodeString) | \(addString2!)"
                          
                      }
                      
                  }
              }
              
            qrCodeString = "\(qrCodeString) | "
          }
        var qrCodeString2 = ""
        if UserDefaults.standard.array(forKey: "teamList")?.isEmpty == false{
            teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
         //   print("\(pitScoutList) and \(pitScoutList.count)")
            
            for index in 0...(teamList.count - 1){
                if UserDefaults.standard.object(forKey: "\(teamList[index])") != nil{
                    let addString2 = UserDefaults.standard.object(forKey: "\(teamList[index])")
                    
                    if qrCodeString2 == ""{
                        qrCodeString2 = " \(addString2!)"
                    }
                    else{
                        qrCodeString2 = "\(qrCodeString2) | \(addString2!)"
                        
                    }
                    
                }
            }
            
          qrCodeString2 = "\(qrCodeString2) | "
        }
        
          print("qrString is \(qrCodeString2)")
        
        
        let pitArray = qrCodeString.components(separatedBy: "|")
        for i in 0...pitArray.count-1{
            send_post(jsonStr: pitArray[i], endpoint: "pitScouting")
        }
        
        let matchArray = qrCodeString2.components(separatedBy: "|")
        for i in 0...matchArray.count-1{
            send_post(jsonStr: matchArray[i], endpoint: "matchData")
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
    

    
    
    
    func send_post(jsonStr:String,endpoint:String)-> String
    {
        var result = jsonStr
        let requestUrl = URL(string:"http://ec2-52-71-196-37.compute-1.amazonaws.com/"+endpoint)!
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let postString=jsonStr;
        request.httpBody = postString.data(using:String.Encoding.utf8);
        let task = URLSession.shared.dataTask(with:request) {
            (data,response,error) in
            if let error = error{
                print("ERROR FOUD")
                return
            }
            if let data = data,let dataString = String(data:data,encoding:.utf8){
                print("Response data String:\n \(dataString)")
            }
        }
        task.resume()
        return result
    }

}
