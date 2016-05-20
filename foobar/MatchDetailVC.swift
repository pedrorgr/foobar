//
//  MatchDetailViewController.swift
//  foobar
//
//  Created by Pedro Ribeiro on 14/05/16.
//  Copyright © 2016 Pedro Ribeiro. All rights reserved.
//

import UIKit
import Alamofire

class MatchDetailViewController: UIViewController {

    var matchDetail: Matches?

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel.init(frame: CGRect.init(x: 150, y: 150, width: 100, height: 20))
        let label1 = UILabel.init(frame: CGRect.init(x: 200, y: 200, width: 100, height: 20))

        label.text = matchDetail?.name
        label.textColor = UIColor.whiteColor()
        label1.textColor = UIColor.whiteColor()
        view.addSubview(label)
        view.addSubview(label1)

        // Do any additional setup after loading the view.

    
        view.backgroundColor = UIColor.blackColor()
        let logo = UIImageView.init(frame: CGRect.init(x: 20, y: 100, width: 50, height: 50))
        let logo1 = UIImageView.init(frame: CGRect.init(x: 100, y: 100, width: 50, height: 50))

        view.addSubview(logo)
        view.addSubview(logo1)
        let url = (matchDetail!.teams!.first!.logoUrl)!
        label1.text = matchDetail?.teams?.first?.name
        let url1 = (matchDetail!.teams!.last!.logoUrl)!
        Utils.setLogo(url, image: logo)
        Utils.setLogo(url1, image: logo1)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
