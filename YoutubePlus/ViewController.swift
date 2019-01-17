//
//  ViewController.swift
//  YoutubePlus
//
//  Created by Marysa Williams on 12/5/18.
//  Copyright © 2018 Marysa Williams. All rights reserved.
//

import UIKit
//import FirebaseCore
import GoogleSignIn
import GoogleAPIClientForREST
//import FirebaseAnalytics
import Alamofire
import SwiftyJSON

class ViewController: UIViewController{

    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    let apiKey = "AIzaSyAZfLJXYWGT1A6Sx28UGrIzjUAKMDvMCw0"
    let baseURL="https://www.googleapis.com/youtube/v3"
    let service = GTLRYouTubeService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.apiKey=apiKey
        fetchChannelResource()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func fetchChannelResource() {
        let query = GTLRYouTubeQuery_ChannelsList.query(withPart: "snippet,statistics")
        query.identifier = "UC_x5XG1OV2P6uZZ5FSM9Ttw"
        // To retrieve data for the current user's channel, comment out the previous
        // line (query.identifier ...) and uncomment the next line (query.mine ...)
        // query.mine = true
        service.executeQuery(query,
                             delegate: self,
                             didFinish:  #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
    }
    
    @objc func displayResultWithTicket(
        ticket: GTLRServiceTicket,
        finishedWithObject response : GTLRYouTube_ChannelListResponse,
        error : NSError?) {
        
        if let error = error {
            print("!!!Error occured!!!" + error.localizedDescription)
            return
        }
        
        var outputText = ""
        if let channels = response.items, !channels.isEmpty {
            let channel = response.items![0]
            let title = channel.snippet!.title
            let description = channel.snippet?.descriptionProperty
            let viewCount = channel.statistics?.viewCount
            outputText += "title: \(title!)\n"
            outputText += "description: \(description!)\n"
            outputText += "view count: \(viewCount!)\n"
        }
        print(outputText)
    }
    

}

