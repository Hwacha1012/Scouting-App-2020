//
//  WebExportViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 2/8/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit


class WebExportViewController: UIViewController {
    @IBOutlet weak var matchDataWebsite: UIButton!
    
    @IBOutlet weak var pitScoutingWebsite: UIButton!
    
    @IBAction func matchDataWebsite_Pressed(_ sender: Any) {
        if let url = URL(string: "http://ec2-52-71-196-37.compute-1.amazonaws.com/matchdata/html") {
            UIApplication.shared.open(url)
        }
        
    }
    
    
    @IBAction func pitScoutingWebsite_Pressed(_ sender: Any) {
        if let url = URL(string: "http://ec2-52-71-196-37.compute-1.amazonaws.com/pitscouting/html") {
        UIApplication.shared.open(url)
        }
    }
    
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
        if UserDefaults.standard.array(forKey: "matchDataList")?.isEmpty == false{
            pitScoutList = UserDefaults.standard.object(forKey: "matchDataList") as! [String]
         //   print("\(pitScoutList) and \(pitScoutList.count)")
            
            for index in 0...(pitScoutList.count - 1){
                if UserDefaults.standard.object(forKey: "\(pitScoutList[index])") != nil{
                    let addString2 = UserDefaults.standard.object(forKey: "\(pitScoutList[index])")
                    
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
