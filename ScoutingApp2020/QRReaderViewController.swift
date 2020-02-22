//
//  QRReaderViewController.swift
//  ScoutingApp2020
//
//  Created by Leonard Liu on 2/18/20.
//  Copyright © 2020 Leonard Liu. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation


var dataToAdd = ""
var arraySeperatedByCommas = [String]()
var arraySeperatedByTeams = [String]()
var arrayOfValues = [String]()
var arrayOfMatchTeams = [String]()
var arrayOfPitTeams = [String]()
var arrayOfSuperTeams = [String]()
var teamName = ""
var pSTeamName = ""

class QRReaderViewController: UIViewController {

    
    var captureSession = AVCaptureSession()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                      AVMetadataObject.ObjectType.code39,
                                      AVMetadataObject.ObjectType.code39Mod43,
                                      AVMetadataObject.ObjectType.code93,
                                      AVMetadataObject.ObjectType.code128,
                                      AVMetadataObject.ObjectType.ean8,
                                      AVMetadataObject.ObjectType.ean13,
                                      AVMetadataObject.ObjectType.aztec,
                                      AVMetadataObject.ObjectType.pdf417,
                                      AVMetadataObject.ObjectType.itf14,
                                      AVMetadataObject.ObjectType.dataMatrix,
                                      AVMetadataObject.ObjectType.interleaved2of5,
                                      AVMetadataObject.ObjectType.qr]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataToAdd = ""
              
              guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
              let videoInput: AVCaptureDeviceInput
              
              do {
                  // Get an instance of the AVCaptureDeviceInput class using the previous device object.
                  let input = try AVCaptureDeviceInput(device: captureDevice)
                  
                  // Set the input device on the capture session.
                  captureSession.addInput(input)
                  
                  // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
                  let captureMetadataOutput = AVCaptureMetadataOutput()
                  captureSession.addOutput(captureMetadataOutput)
                  
                  // Set delegate and use the default dispatch queue to execute the call back
                  captureMetadataOutput.setMetadataObjectsDelegate(self as! AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
                  captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
                  //            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                  
              } catch {
                  // If any error occurs, simply print it out and don't continue any more.
                  print(error)
                  return
              }
              
              // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
              videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
              videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
              videoPreviewLayer?.frame = view.layer.bounds
              view.layer.addSublayer(videoPreviewLayer!)
              
              // Start video capture.
              captureSession.startRunning()
              
              // Move the message label and top bar to the front
              //  view.bringSubview(toFront: messageLabel)
              //  view.bringSubview(toFront: topbar)
              
              //view.bringSubviewToFront(backButton)
              
              // Initialize QR Code Frame to highlight the QR code
              qrCodeFrameView = UIView()
              
              if let qrCodeFrameView = qrCodeFrameView {
                  qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                  qrCodeFrameView.layer.borderWidth = 2
                  view.addSubview(qrCodeFrameView)
                  view.bringSubviewToFront(qrCodeFrameView)
              }
        // Do any additional setup after loading the view.
    }
    

    func returnToMainMenu(){
        
        
        
        
           //  let testString = "sjndakfhiwaejksdfn sdhfijwerda"
           
           
          // arraySeperatedByCommas = dataToAdd.components(separatedBy: ",")
           //arraySeperatedByCommas = testString.components(separatedBy: ",")
         //  print(arraySeperatedByCommas)
           
           //  teamNum = arraySeperatedByCommas[0]
        //   teamNumber = "\(arraySeperatedByCommas[0]); \(arraySeperatedByCommas[1])"
           
        //   print(arraySeperatedByCommas.count)
        
               
          // else if arraySeperatedByCommas.count > 26{
        
        
        arrayOfMatchTeams = dataToAdd.components(separatedBy: "||")
        arrayOfPitTeams = dataToAdd.components(separatedBy: "//")
        
        if arrayOfMatchTeams.count > 1{
            for index in 1...arrayOfMatchTeams.count - 2{
                let a = arrayOfMatchTeams[index].components(separatedBy: "matchText=")
                
                print("a[0] is \(a[0])")
                let b = a[1].components(separatedBy: "&")
                let c = arrayOfMatchTeams[index].components(separatedBy: "teamText=")
                let d = c[1].components(separatedBy: "&")
                
                teamName = "\(d[0]); \(b[0])"
                if UserDefaults.standard.array(forKey: "teamList") == nil{
                    // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                   // print("teamNum is \(teamNum)")
                 
                 
                    teamList.append(teamName)
                    print("teamlist is \(teamList)!")
                    UserDefaults.standard.set(teamList, forKey: "teamList")
                    UserDefaults.standard.set(arrayOfMatchTeams[index], forKey: "\(teamName)")
                    print("Value is \(arrayOfMatchTeams[index])")
                    //print("teamNum is \(teamName)")
                    let test = UserDefaults.standard.object(forKey: "\(teamName)")
                    print(test)
                    
                }
                else if UserDefaults.standard.array(forKey: "teamList")!.isEmpty == false{
                    
                    teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                    breakLoop = false
                    for index in 0...teamList.count - 1 {
                        if teamName == teamList[index]{
                            breakLoop = true
                            
                        }
                    }
                    print("breakLoop is \(breakLoop)")
                    if breakLoop == false{
                        teamList.append(teamName)
                        print(teamList)
                    }
                    else if breakLoop == true{
                        let indexOfElement = teamList.index(of: "\(teamName)")
                        teamList.remove(at: indexOfElement!)
                        teamList.append(teamName)
                        print(teamList)
                    }
                    
                    UserDefaults.standard.set(teamList, forKey: "teamList")
                    UserDefaults.standard.set(arrayOfMatchTeams[index], forKey: "\(teamName)")
                    print("Value is \(arrayOfMatchTeams[index])")
       
                    
                }
                else{
                    teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                    teamList.append(teamName)
                    print("teamlist is \(teamList)")
                    UserDefaults.standard.set(teamList, forKey: "teamList")
                    UserDefaults.standard.set(arrayOfMatchTeams[index], forKey: "\(teamName)")
                    print("Value is \(arrayOfMatchTeams[index])")
                    print("teamNum is !\(teamName)")
                    let test = UserDefaults.standard.object(forKey: "\(teamName)")
                    print(test)
                }
                
                
                
                
            }
            
            
            
            
        }
        
        if arrayOfPitTeams.count > 1{
                              print("hi?!?")
                              for index in 1...arrayOfPitTeams.count - 2{
                                  
                                let a = arrayOfPitTeams[index].components(separatedBy: "robotNumber=")
                                let b = a[1].components(separatedBy: "&")
                                
                                  //arrayOfValues = arrayOfPitTeams[index].components(separatedBy: ",")
                                  
                                  //teamNum = arrayOfValues[0]
                                  pSTeamName = "\(b[0]); Pit Scouting"
                                  print("pSTeam Number is \(pSTeamName)!!!!!!!")
                                  if pSTeamName != ""{
                                      print("got here")
                                      if UserDefaults.standard.array(forKey: "pitScoutList") == nil{
                                          // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                                          print("pSteamNum is \(pSTeamName)")
                                          pitScoutList.append(pSTeamName)
                                          print("pitScoutList is \(pitScoutList)!")
                                          UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                                          UserDefaults.standard.set(arrayOfPitTeams[index], forKey: "\(pSTeamName)")
                                          print("Value is \(arrayOfPitTeams[index])")
                                          print("pSteamNum is \(pSTeamName)")
                                          let test = UserDefaults.standard.object(forKey: "\(pSTeamName)")
                                          print(test)
                                          
                                      }
                                      else if UserDefaults.standard.array(forKey: "pitScoutList")!.isEmpty == false{
                                          
                                          pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                                          breakLoop = false
                                          for index in 0...pitScoutList.count - 1 {
                                              if pSTeamName == pitScoutList[index]{
                                                  breakLoop = true
                                                  
                                              }
                                          }
                                          print("breakLoop2 is \(breakLoop)")
                                          if breakLoop == false{
                                              pitScoutList.append(pSTeamName)
                                              print(pitScoutList)
                                          }
                                          else if breakLoop == true{
                                              let indexOfElement = pitScoutList.index(of: "\(pSTeamName)")
                                              pitScoutList.remove(at: indexOfElement!)
                                              pitScoutList.append(pSTeamName)
                                              print(pitScoutList)
                                          }
                                          
                                          UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                                          UserDefaults.standard.set(arrayOfPitTeams[index], forKey: "\(pSTeamName)")
                                          print("Value is \(arrayOfPitTeams[index])")
                                          print("teamNum is !\(pSTeamName)")
                                          let test = UserDefaults.standard.object(forKey: "\(pSTeamName)")
                                          print(test)
                                          
                                      }
                                      else{
                                          pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                                          pitScoutList.append(pSTeamName)
                                          print("pitScoutList is \(pitScoutList)")
                                          UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                                          UserDefaults.standard.set(arrayOfPitTeams[index], forKey: "\(pSTeamName)")
                                          print("Value is \(arrayOfPitTeams[index])")
                                          print("pSteamNum is !\(pSTeamName)")
                                          let test = UserDefaults.standard.object(forKey: "\(pSTeamName)")
                                          print(test)
                                      }
                                      
                                      
                                  }
            }
        }
        
        /*
               if true{
                   
               arrayOfMatchTeams = dataToAdd.components(separatedBy: "||")
               arrayOfPitTeams = dataToAdd.components(separatedBy: "//")
               //arrayOfSuperTeams = dataToAdd.components(separatedBy: "''")
               //print("array of pit teams = \(arrayOfPitTeams)")
               
               if arrayOfMatchTeams.count > 1{
                   for index in 1...arrayOfMatchTeams.count - 2{
                       
                      // arrayOfValues = arrayOfMatchTeams[index].components(separatedBy: ",")
                       
                       //teamNum = arrayOfValues[0]
                  //     teamNum = "\(arrayOfValues[0]); \(arrayOfValues[1])"
                      // print("team Number is \(teamNum)!!!!!!!")
                    //   if teamNum != ""{
                         //  print("got here")
                  //  teamName = 
                    
                           if UserDefaults.standard.array(forKey: "teamList") == nil{
                               // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                              // print("teamNum is \(teamNum)")
                            
                            
                               teamList.append(teamNum)
                               print("teamlist is \(teamList)!")
                               UserDefaults.standard.set(teamList, forKey: "teamList")
                               UserDefaults.standard.set(arrayOfMatchTeams[index], forKey: "\(teamNum)")
                               print("Value is \(arrayOfMatchTeams[index])")
                               print("teamNum is \(teamNum)")
                               let test = UserDefaults.standard.object(forKey: "\(teamNum)")
                               print(test)
                               
                           }
                           else if UserDefaults.standard.array(forKey: "teamList")!.isEmpty == false{
                               
                               teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                               breakLoop = false
                               for index in 0...teamList.count - 1 {
                                   if teamNum == teamList[index]{
                                       breakLoop = true
                                       
                                   }
                               }
                               print("breakLoop is \(breakLoop)")
                               if breakLoop == false{
                                   teamList.append(teamNum)
                                   print(teamList)
                               }
                               else if breakLoop == true{
                                   let indexOfElement = teamList.index(of: "\(teamNum)")
                                   teamList.remove(at: indexOfElement!)
                                   teamList.append(teamNum)
                                   print(teamList)
                               }
                               
                               UserDefaults.standard.set(teamList, forKey: "teamList")
                               UserDefaults.standard.set(arrayOfMatchTeams[index], forKey: "\(teamNum)")
                               print("Value is \(arrayOfMatchTeams[index])")
                               print("teamNum is !\(teamNum)")
                               let test = UserDefaults.standard.object(forKey: "\(teamNum)")
                               print(test)
                               
                           }
                           else{
                               teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                               teamList.append(teamNum)
                               print("teamlist is \(teamList)")
                               UserDefaults.standard.set(teamList, forKey: "teamList")
                               UserDefaults.standard.set(arrayOfMatchTeams[index], forKey: "\(teamNum)")
                               print("Value is \(arrayOfMatchTeams[index])")
                               print("teamNum is !\(teamNum)")
                               let test = UserDefaults.standard.object(forKey: "\(teamNum)")
                               print(test)
                           }
                           
                           
                      // }
                   }
                   
                   
               }
               
                   if arrayOfPitTeams.count > 1{
                       print("hi?!?")
                       for index in 1...arrayOfPitTeams.count - 2{
                           
                           arrayOfValues = arrayOfPitTeams[index].components(separatedBy: ",")
                           
                           //teamNum = arrayOfValues[0]
                           pSteamNum = "\(arrayOfValues[0]); Pit Scouting"
                           print("pSTeam Number is \(pSteamNum)!!!!!!!")
                           if pSteamNum != ""{
                               print("got here")
                               if UserDefaults.standard.array(forKey: "pitScoutList") == nil{
                                   // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                                   print("pSteamNum is \(pSteamNum)")
                                   pitScoutList.append(pSteamNum)
                                   print("pitScoutList is \(pitScoutList)!")
                                   UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                                   UserDefaults.standard.set(arrayOfPitTeams[index], forKey: "\(pSteamNum)")
                                   print("Value is \(arrayOfPitTeams[index])")
                                   print("pSteamNum is \(pSteamNum)")
                                   let test = UserDefaults.standard.object(forKey: "\(pSteamNum)")
                                   print(test)
                                   
                               }
                               else if UserDefaults.standard.array(forKey: "pitScoutList")!.isEmpty == false{
                                   
                                   pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                                   breakLoop = false
                                   for index in 0...pitScoutList.count - 1 {
                                       if pSteamNum == pitScoutList[index]{
                                           breakLoop = true
                                           
                                       }
                                   }
                                   print("breakLoop2 is \(breakLoop)")
                                   if breakLoop == false{
                                       pitScoutList.append(pSteamNum)
                                       print(pitScoutList)
                                   }
                                   else if breakLoop == true{
                                       let indexOfElement = pitScoutList.index(of: "\(pSteamNum)")
                                       pitScoutList.remove(at: indexOfElement!)
                                       pitScoutList.append(pSteamNum)
                                       print(pitScoutList)
                                   }
                                   
                                   UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                                   UserDefaults.standard.set(arrayOfPitTeams[index], forKey: "\(pSteamNum)")
                                   print("Value is \(arrayOfPitTeams[index])")
                                   print("teamNum is !\(pSteamNum)")
                                   let test = UserDefaults.standard.object(forKey: "\(pSteamNum)")
                                   print(test)
                                   
                               }
                               else{
                                   pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                                   pitScoutList.append(pSteamNum)
                                   print("pitScoutList is \(pitScoutList)")
                                   UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                                   UserDefaults.standard.set(arrayOfPitTeams[index], forKey: "\(pSteamNum)")
                                   print("Value is \(arrayOfPitTeams[index])")
                                   print("pSteamNum is !\(pSteamNum)")
                                   let test = UserDefaults.standard.object(forKey: "\(pSteamNum)")
                                   print(test)
                               }
                               
                               
                           }
                       }
                       
                       
                   }
                   
                   if arrayOfSuperTeams.count > 1{
                       print("hi?!?")
                       for index in 1...arrayOfSuperTeams.count - 2{
                           
                           arrayOfValues = arrayOfSuperTeams[index].components(separatedBy: ",")
                           
                           //teamNum = arrayOfValues[0]
                           teamNum = "\(arrayOfValues[0]); \(arrayOfValues[1])"
                           print("teamNum is \(teamNum) 1234")
                          // print("pSTeam Number is \(pSteamNum)!!!!!!!")
                           if teamNum != ""{
                               print("got here")
                               if UserDefaults.standard.array(forKey: "superScoutList") == nil{
                                   // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                                  // print("pSteamNum is \(pSteamNum)")
                                   superScoutList.append(teamNum)
                                 //  print("pitScoutList is \(pitScoutList)!")
                                   UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
                                   UserDefaults.standard.set(arrayOfSuperTeams[index], forKey: "\(teamNum)")
                                  // print("Value is \(arrayOfSuperTeams[index])")
                                  // print("pSteamNum is \(pSteamNum)")
                                //   let test = UserDefaults.standard.object(forKey: "\(pSteamNum)")
                                //   print(test)
                                   
                               }
                               else if UserDefaults.standard.array(forKey: "superScoutList")!.isEmpty == false{
                                   
                                   superScoutList = UserDefaults.standard.array(forKey: "superScoutList") as! [String]
                                   breakLoop = false
                                   for index in 0...superScoutList.count - 1 {
                                       if teamNum == superScoutList[index]{
                                           breakLoop = true
                                           
                                       }
                                   }
                                   print("breakLoop2 is \(breakLoop)")
                                   if breakLoop == false{
                                       superScoutList.append(teamNum)
                                       //print(pitScoutList)
                                   }
                                   else if breakLoop == true{
                                       let indexOfElement = superScoutList.index(of: "\(teamNum)")
                                       superScoutList.remove(at: indexOfElement!)
                                       superScoutList.append(teamNum)
                                      // print(pitScoutList)
                                   }
                                   
                                   UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
                                   UserDefaults.standard.set(arrayOfSuperTeams[index], forKey: "\(teamNum)")
                                   //print("Value is \(superScoutList[index])")
                                 //  print("teamNum is !\(pSteamNum)")
                                //   let test = UserDefaults.standard.object(forKey: "\(pSteamNum)")
                                //   print(test)
                                   
                               }
                               else{
                                   superScoutList = UserDefaults.standard.array(forKey: "superScoutList") as! [String]
                                   superScoutList.append(teamNum)
                                  // print("pitScoutList is \(pitScoutList)")
                                   UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
                                   UserDefaults.standard.set(arrayOfSuperTeams[index], forKey: "\(teamNum)")
                                 //  print("Value is \(arrayOfPitTeams[index])")
                                //   print("pSteamNum is !\(pSteamNum)")
                                  // let test = UserDefaults.standard.object(forKey: "\(pSteamNum)")
                                   //print(test)
                               }
                               
                               
                           }
                       }
                       
                       
                   }
               
               
               
           }
           
           /* else if arraySeperatedByCommas.count > 16 && arraySeperatedByCommas.count % 15 == 1{
            arraySeperatedByTeams = dataToAdd.components(separatedBy: "|||")
            
            for index in 0...arraySeperatedByTeams.count - 1{
            
            arrayOfValues = arraySeperatedByTeams[index].components(separatedBy: ",")
            
            //teamNum = arrayOfValues[0]
            teamNum = "\(arrayOfValues[0]); \(arrayOfValues[1])"
            print("team Number is \(teamNum)!!!!!!!")
            if teamNum != ""{
            print("got here")
            if UserDefaults.standard.array(forKey: "teamList") == nil{
            // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
            print("teamNum is \(teamNum)")
            teamList.append(teamNum)
            print("teamlist is \(teamList)!")
            UserDefaults.standard.set(teamList, forKey: "teamList")
            UserDefaults.standard.set(arraySeperatedByTeams[index], forKey: "\(teamNum)")
            print("Value is \(arraySeperatedByTeams[index])")
            print("teamNum is \(teamNum)")
            let test = UserDefaults.standard.object(forKey: "\(teamNum)")
            print(test)
            
            }
            else if UserDefaults.standard.array(forKey: "teamList")!.isEmpty == false{
            
            teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
            breakLoop = false
            for index in 0...teamList.count - 1 {
            if teamNum == teamList[index]{
            breakLoop = true
            
            }
            }
            print("breakLoop is \(breakLoop)")
            if breakLoop == false{
            teamList.append(teamNum)
            print(teamList)
            }
            else if breakLoop == true{
            let indexOfElement = teamList.index(of: "\(teamNum)")
            teamList.remove(at: indexOfElement!)
            teamList.append(teamNum)
            print(teamList)
            }
            
            UserDefaults.standard.set(teamList, forKey: "teamList")
            UserDefaults.standard.set(arraySeperatedByTeams[index], forKey: "\(teamNum)")
            print("Value is \(arraySeperatedByTeams[index])")
            print("teamNum is !\(teamNum)")
            let test = UserDefaults.standard.object(forKey: "\(teamNum)")
            print(test)
            
            }
            else{
            teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
            teamList.append(teamNum)
            print("teamlist is \(teamList)")
            UserDefaults.standard.set(teamList, forKey: "teamList")
            UserDefaults.standard.set(arraySeperatedByTeams[index], forKey: "\(teamNum)")
            print("Value is \(arraySeperatedByTeams[index])")
            print("teamNum is !\(teamNum)")
            let test = UserDefaults.standard.object(forKey: "\(teamNum)")
            print(test)
            }
            
            
            }
            }
            
            
            
            //seperate arraySeperatedByCommas into each team's data and add each
            //make a new arraySeperatedByCommas where its split up by "|" to split team data and do array of data with each but do that only in here because this else if allows multiple team datas
            
            
            
            
            
            }
            */
           */
           
           performSegue(withIdentifier: "segueAfterScan", sender: nil)
           
       }
    
    
    func launchApp(decodedURL: String) {
          
            if presentedViewController != nil {
              return
          }
    
          
          /* let alertPrompt = UIAlertController(title: "Open App", message: "You're going to open \(decodedURL)", preferredStyle: .actionSheet)
           let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: { (action) -> Void in
           
           if let url = URL(string: decodedURL) {
           if UIApplication.shared.canOpenURL(url) {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
           }
           }
           })
           
           let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
           
           alertPrompt.addAction(confirmAction)
           alertPrompt.addAction(cancelAction)
           
           present(alertPrompt, animated: true, completion: nil)
           */
          print("decodedURL is \(decodedURL)")
          dataToAdd = decodedURL
          
          returnToMainMenu()
          //performSegue(withIdentifier: "segueAfterQRScan", sender: nil)
          
          
      }

}


   
    
 extension QRReaderViewController: AVCaptureMetadataOutputObjectsDelegate {
        
        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            // Check if the metadataObjects array is not nil and it contains at least one object.
            if metadataObjects.count == 0 {
                //  qrCodeFrameView?.frame = CGRect.zero
                // messageLabel.text = "No QR code is detected"
                return
            }
            
            // Get the metadata object.
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            
            if supportedCodeTypes.contains(metadataObj.type) {
                // If the found metadata is equal to the QR code metadata (or barcode) then update the status label's text and set the bounds
                let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
                qrCodeFrameView?.frame = barCodeObject!.bounds
                
                if metadataObj.stringValue != nil {
                    launchApp(decodedURL: metadataObj.stringValue!)
     
                }
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

