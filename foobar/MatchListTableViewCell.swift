//
//  MatchListTableViewCell.swift
//  foobar
//
//  Created by Pedro Ribeiro on 15/05/16.
//  Copyright © 2016 Pedro Ribeiro. All rights reserved.
//

import UIKit

class MatchListTableViewCell: UITableViewCell {
    
    let homeTeamLabel: UILabel
    let awayTeamLabel: UILabel
    let scoreLabel: UILabel
    let homeTeamLogo: UIImageView
    let awayTeamLogo: UIImageView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        homeTeamLabel = UILabel()
        homeTeamLabel.textColor = UIColor.whiteColor()
        homeTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        homeTeamLogo = UIImageView()
        
        
        awayTeamLabel = UILabel()
        awayTeamLabel.textColor = UIColor.whiteColor()
        awayTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        awayTeamLogo = UIImageView()

        scoreLabel = UILabel()
        scoreLabel.textColor = UIColor.whiteColor()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(homeTeamLabel)
        addSubview(awayTeamLabel)
        addSubview(homeTeamLogo)
        addSubview(awayTeamLogo)
        addSubview(scoreLabel)

        
        let views = ["homeTeam": homeTeamLabel, "awayTeam": awayTeamLabel, "score": scoreLabel ]
        var layoutConstraints = [NSLayoutConstraint]()
        
        layoutConstraints.append(scoreLabel.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
        layoutConstraints.append(scoreLabel.centerYAnchor.constraintEqualToAnchor(centerYAnchor))
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("[awayTeam]-|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:[awayTeam]|", options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activateConstraints(layoutConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
