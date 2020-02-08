//
//  QRExportViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 2/8/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit

class QRExportViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    func generateQRCode(from string: String) -> UIImage? {
          let data = string.data(using: String.Encoding.ascii)
          
          if let filter = CIFilter(name: "CIQRCodeGenerator") {
              filter.setValue(data, forKey: "inputMessage")
              let transform = CGAffineTransform(scaleX: 3, y: 3)
              
              if let output = filter.outputImage?.transformed(by: transform) {
                  return UIImage(ciImage: output)
              }
          }
          
          return nil
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        var qrCodeString = ""
        
        
        
        //if UserDefaults.standard.array(forKey: "teamList") != nil
        if UserDefaults.standard.array(forKey: "teamList")?.isEmpty == false{
            teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
            //print("\(teamList) and \(teamList.count)")
            
            for index in 0...(teamList.count - 1){
                if UserDefaults.standard.object(forKey: "\(teamList[index])") != nil{
                    let addString = UserDefaults.standard.object(forKey: "\(teamList[index])")
                    
                    if qrCodeString == ""{
                        qrCodeString = " || \(addString!)"
                    }
                    else{
                        qrCodeString = "\(qrCodeString) || \(addString!)"
                        
                    }
                    
                }
            }
            qrCodeString = "\(qrCodeString) || "
        }

        
        if UserDefaults.standard.array(forKey: "pitScoutList")?.isEmpty == false{
            pitScoutList = UserDefaults.standard.object(forKey: "pitScoutList") as! [String]
         //   print("\(pitScoutList) and \(pitScoutList.count)")
            
            for index in 0...(pitScoutList.count - 1){
                if UserDefaults.standard.object(forKey: "\(pitScoutList[index])") != nil{
                    let addString2 = UserDefaults.standard.object(forKey: "\(pitScoutList[index])")
                    
                    if qrCodeString == ""{
                        qrCodeString = " // \(addString2!)"
                    }
                    else{
                        qrCodeString = "\(qrCodeString) // \(addString2!)"
                        
                    }
                    
                }
            }
            
            qrCodeString = "\(qrCodeString) // "
        }
        
        qrImage = generateQRCode(from: qrCodeString)
        imageView.image = qrImage
        
        
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
