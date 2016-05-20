//
//  MatchDataProviderViewController.swift
//  foobar
//
//  Created by Pedro Ribeiro on 15/05/16.
//  Copyright © 2016 Pedro Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

class MatchDataProviderViewController: NSObject, UITableViewDataSource {
    
    private let cellIdentifer = "Cell"
    var cache:NSCache!
    var list = [Foobar]()
    func registerCellsForTableView(tableView: UITableView) {
        tableView.registerClass(MatchListTableViewCell.self, forCellReuseIdentifier: cellIdentifer)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return list.count
    }

    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return list[section].name
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].matches!.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifer, forIndexPath: indexPath) as! MatchListTableViewCell
        
        //I should guard the unrapping and check the number flag for away team
        
        
        let match = list[indexPath.section].matches![indexPath.row]
        
        var score = ""
        
        cell.homeTeamLabel.text = "\(match.teams!.first!.name!)"
        cell.awayTeamLabel.text = "\(match.teams!.last!.name!)"

        
        if let scoreAway = match.teams!.first!.results!.runningscore {
            score = scoreAway
        } else {
            score = "-"
        }
        if let scoreHome = match.teams!.last!.results!.runningscore {
            score = score + " " + scoreHome
        } else {
            score = score + " " + "-"
        }
        
        
        cell.scoreLabel.text = score
        
   

        cell.backgroundColor =  UIColor.clearColor()
        
        return cell
        
    }
}
