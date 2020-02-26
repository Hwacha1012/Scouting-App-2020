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
    
    /**
    - Parameter sender: The button is pressed by the user
    */
    
    @IBAction func matchDataWebsite_Pressed(_ sender: Any) {
        if let url = URL(string: "http://ec2-52-71-196-37.compute-1.amazonaws.com/matchdata/html") {
            UIApplication.shared.open(url)
        }
        
    }
    
    /**
     - Parameter sender: The button is pressed by the user 2: Electric Boogaloo
     */
    
    @IBAction func pitScoutingWebsite_Pressed(_ sender: Any) {
        if let url = URL(string: "http://ec2-52-71-196-37.compute-1.amazonaws.com/pitscouting/html") {
        UIApplication.shared.open(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///The string for the QR code
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
        ///The string for the QR code yet again
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
        
        qrCodeString = qrCodeString.replacingOccurrences(of: "notes= ", with: "notes=none")
        qrCodeString2 = qrCodeString2.replacingOccurrences(of: "notes= ", with: "notes=none")
        ///The entire pitscouting data strings, seperated by vertical lines.
        var pitArray = qrCodeString.components(separatedBy: "|")
        for i in 0...pitArray.count-1{

            send_post(jsonStr: pitArray[i], endpoint: "pitscouting")

            let res = send_post(jsonStr: pitArray[i], endpoint: "pitscouting")
            print(res)

        }
        ///Same thing as above except for Match Data
        let matchArray = qrCodeString2.components(separatedBy: "|")
        for i in 0...matchArray.count-1{
            send_post(jsonStr: matchArray[i], endpoint: "matchdata")

            let res = send_post(jsonStr: matchArray[i], endpoint: "matchdata")
            print(res)

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
    

    
    /**
        Sends the informaton to the server to allow for view.
        - Parameter jsonStr: The JSON string
        - Parameter endpoint: Where the string is finished 
        - Throws:If the error value is ticked spits out an error
    */
    
    func send_post(jsonStr:String,endpoint:String)-> String
    {
        ///For error checking
        var result = ""
        let requestUrl = URL(string:"http://ec2-52-71-196-37.compute-1.amazonaws.com/"+endpoint)!
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        let postString=jsonStr;
        request.httpBody = postString.data(using:String.Encoding.utf8);
        let task = URLSession.shared.dataTask(with:request) {
            (data,response,error) in
            if let error = error{
                print("ERROR FOUD")
                result = "ERROR FOUND"
            }
            if let data = data,let dataString = String(data:data,encoding:.utf8){
                print("Response data String:\n \(dataString)")
                result = dataString
            }
        }
        task.resume()
        while(result == "")
        {
        }
        return result
    }

}
