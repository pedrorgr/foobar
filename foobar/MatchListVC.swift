//
//  ViewController.swift
//  foobar
//
//  Created by Pedro Ribeiro on 14/05/16.
//  Copyright © 2016 Pedro Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

enum filters:Int {
    case all
    case live
    case finished
}

class MatchListVC: UIViewController, UITableViewDelegate {
    
    var dataProvider: MatchDataProviderViewController?
    var leagues = [Foobar]()
    var matchFilters = ["All", "Live", "Finished"]
    
    var tableView: UITableView  =   UITableView()
    
    
    override func loadView() {
        super.loadView()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Set Filter Segment Control
        let customSC = UISegmentedControl.init(items: self.matchFilters)
        customSC.selectedSegmentIndex = 0
        let frame = UIScreen.mainScreen().bounds
        customSC.frame = CGRectMake(frame.minX + 10, frame.minY + 50,
                                    frame.width, 50)
        // Style the Segmented Control
        customSC.backgroundColor = UIColor.clearColor()
        customSC.addTarget(self, action: #selector(self.filterMatches(_:)), forControlEvents: .ValueChanged)
        
        
        self.view.addSubview(customSC)
        
        //Set List Match table
        let tableframe = CGRect.init(x: 0, y: 100, width: frame.width, height: frame.height - 200)
        tableView = UITableView(frame: tableframe)
        tableView.delegate = self
        tableView.backgroundColor = nil
        tableView.backgroundColor =  UIColor.clearColor()
        tableView.separatorStyle = .None
        dataProvider?.registerCellsForTableView(tableView)
        
        view.addSubview(tableView)
        populateList("")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateList(status:String) {
        
        print(FoobarAPI.Router.GetMatches(status).URLRequest.URLString)
        Alamofire.request(FoobarAPI.Router.GetMatches(status)).validate().responseJSON { response in
            switch response.result {
            case .Success:

                print(response.result.value)
                
                self.leagues = []
                
                for league in (response.result.value as! [AnyObject]){
                    self.leagues.append(Foobar.init(object: league))
                }
                self.dataProvider!.list = self.leagues
                self.tableView.dataSource = self.dataProvider

                self.tableView.reloadData()
                
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let destination = MatchDetailViewController()
        destination.matchDetail = leagues[indexPath.section].matches![indexPath.row]
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    
    
    func filterMatches(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            populateList("\(filters.init(rawValue: sender.selectedSegmentIndex)!)")
        case 1:
            populateList("\(filters.init(rawValue: sender.selectedSegmentIndex)!)")
        case 2:
            populateList("\(filters.init(rawValue: sender.selectedSegmentIndex)!)")
        default:
            populateList("")
        }
    }
}

