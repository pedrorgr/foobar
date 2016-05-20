//
//  Matches.swift
//
//  Created by Pedro Ribeiro on 14/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Matches: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMatchesStatusIdKey: String = "statusId"
	internal let kMatchesElapsedTextKey: String = "elapsedText"
	internal let kMatchesTournamentNameKey: String = "tournamentName"
	internal let kMatchesOutcomeKey: String = "outcome"
	internal let kMatchesStatusCodeKey: String = "statusCode"
	internal let kMatchesElapsedKey: String = "elapsed"
	internal let kMatchesStartDateKey: String = "startDate"
	internal let kMatchesNameKey: String = "name"
	internal let kMatchesStatusShortDescKey: String = "statusShortDesc"
	internal let kMatchesCountryNameKey: String = "countryName"
	internal let kMatchesBallPossessionKey: String = "ballPossession"
	internal let kMatchesPredictionOpenedKey: String = "predictionOpened"
	internal let kMatchesInternalIdentifierKey: String = "id"
	internal let kMatchesTournamentIdKey: String = "tournamentId"
	internal let kMatchesCountryIdKey: String = "countryId"
	internal let kMatchesStatusDescKey: String = "statusDesc"
	internal let kMatchesSportIdKey: String = "sportId"
	internal let kMatchesTeamsKey: String = "teams"
	internal let kMatchesIsTickingKey: String = "isTicking"
	internal let kMatchesTournamentShortNameKey: String = "tournamentShortName"


    // MARK: Properties
	public var statusId: Int?
	public var elapsedText: String?
	public var tournamentName: String?
	public var outcome: String?
	public var statusCode: String?
	public var elapsed: Int?
	public var startDate: Int?
	public var name: String?
	public var statusShortDesc: String?
	public var countryName: String?
	public var ballPossession: Int?
	public var predictionOpened: Bool = false
	public var internalIdentifier: Int?
	public var tournamentId: Int?
	public var countryId: Int?
	public var statusDesc: String?
	public var sportId: Int?
	public var teams: [Teams]?
	public var isTicking: Bool = false
	public var tournamentShortName: String?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		statusId = json[kMatchesStatusIdKey].int
		elapsedText = json[kMatchesElapsedTextKey].string
		tournamentName = json[kMatchesTournamentNameKey].string
		outcome = json[kMatchesOutcomeKey].string
		statusCode = json[kMatchesStatusCodeKey].string
		elapsed = json[kMatchesElapsedKey].int
		startDate = json[kMatchesStartDateKey].int
		name = json[kMatchesNameKey].string
		statusShortDesc = json[kMatchesStatusShortDescKey].string
		countryName = json[kMatchesCountryNameKey].string
		ballPossession = json[kMatchesBallPossessionKey].int
		predictionOpened = json[kMatchesPredictionOpenedKey].boolValue
		internalIdentifier = json[kMatchesInternalIdentifierKey].int
		tournamentId = json[kMatchesTournamentIdKey].int
		countryId = json[kMatchesCountryIdKey].int
		statusDesc = json[kMatchesStatusDescKey].string
		sportId = json[kMatchesSportIdKey].int
		teams = []
		if let items = json[kMatchesTeamsKey].array {
			for item in items {
				teams?.append(Teams(json: item))
			}
		} else {
			teams = nil
		}
		isTicking = json[kMatchesIsTickingKey].boolValue
		tournamentShortName = json[kMatchesTournamentShortNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if statusId != nil {
			dictionary.updateValue(statusId!, forKey: kMatchesStatusIdKey)
		}
		if elapsedText != nil {
			dictionary.updateValue(elapsedText!, forKey: kMatchesElapsedTextKey)
		}
		if tournamentName != nil {
			dictionary.updateValue(tournamentName!, forKey: kMatchesTournamentNameKey)
		}
		if outcome != nil {
			dictionary.updateValue(outcome!, forKey: kMatchesOutcomeKey)
		}
		if statusCode != nil {
			dictionary.updateValue(statusCode!, forKey: kMatchesStatusCodeKey)
		}
		if elapsed != nil {
			dictionary.updateValue(elapsed!, forKey: kMatchesElapsedKey)
		}
		if startDate != nil {
			dictionary.updateValue(startDate!, forKey: kMatchesStartDateKey)
		}
		if name != nil {
			dictionary.updateValue(name!, forKey: kMatchesNameKey)
		}
		if statusShortDesc != nil {
			dictionary.updateValue(statusShortDesc!, forKey: kMatchesStatusShortDescKey)
		}
		if countryName != nil {
			dictionary.updateValue(countryName!, forKey: kMatchesCountryNameKey)
		}
		if ballPossession != nil {
			dictionary.updateValue(ballPossession!, forKey: kMatchesBallPossessionKey)
		}
		dictionary.updateValue(predictionOpened, forKey: kMatchesPredictionOpenedKey)
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kMatchesInternalIdentifierKey)
		}
		if tournamentId != nil {
			dictionary.updateValue(tournamentId!, forKey: kMatchesTournamentIdKey)
		}
		if countryId != nil {
			dictionary.updateValue(countryId!, forKey: kMatchesCountryIdKey)
		}
		if statusDesc != nil {
			dictionary.updateValue(statusDesc!, forKey: kMatchesStatusDescKey)
		}
		if sportId != nil {
			dictionary.updateValue(sportId!, forKey: kMatchesSportIdKey)
		}
		if teams?.count > 0 {
			var temp: [AnyObject] = []
			for item in teams! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kMatchesTeamsKey)
		}
		dictionary.updateValue(isTicking, forKey: kMatchesIsTickingKey)
		if tournamentShortName != nil {
			dictionary.updateValue(tournamentShortName!, forKey: kMatchesTournamentShortNameKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.statusId = aDecoder.decodeObjectForKey(kMatchesStatusIdKey) as? Int
		self.elapsedText = aDecoder.decodeObjectForKey(kMatchesElapsedTextKey) as? String
		self.tournamentName = aDecoder.decodeObjectForKey(kMatchesTournamentNameKey) as? String
		self.outcome = aDecoder.decodeObjectForKey(kMatchesOutcomeKey) as? String
		self.statusCode = aDecoder.decodeObjectForKey(kMatchesStatusCodeKey) as? String
		self.elapsed = aDecoder.decodeObjectForKey(kMatchesElapsedKey) as? Int
		self.startDate = aDecoder.decodeObjectForKey(kMatchesStartDateKey) as? Int
		self.name = aDecoder.decodeObjectForKey(kMatchesNameKey) as? String
		self.statusShortDesc = aDecoder.decodeObjectForKey(kMatchesStatusShortDescKey) as? String
		self.countryName = aDecoder.decodeObjectForKey(kMatchesCountryNameKey) as? String
		self.ballPossession = aDecoder.decodeObjectForKey(kMatchesBallPossessionKey) as? Int
		self.predictionOpened = aDecoder.decodeBoolForKey(kMatchesPredictionOpenedKey)
		self.internalIdentifier = aDecoder.decodeObjectForKey(kMatchesInternalIdentifierKey) as? Int
		self.tournamentId = aDecoder.decodeObjectForKey(kMatchesTournamentIdKey) as? Int
		self.countryId = aDecoder.decodeObjectForKey(kMatchesCountryIdKey) as? Int
		self.statusDesc = aDecoder.decodeObjectForKey(kMatchesStatusDescKey) as? String
		self.sportId = aDecoder.decodeObjectForKey(kMatchesSportIdKey) as? Int
		self.teams = aDecoder.decodeObjectForKey(kMatchesTeamsKey) as? [Teams]
		self.isTicking = aDecoder.decodeBoolForKey(kMatchesIsTickingKey)
		self.tournamentShortName = aDecoder.decodeObjectForKey(kMatchesTournamentShortNameKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(statusId, forKey: kMatchesStatusIdKey)
		aCoder.encodeObject(elapsedText, forKey: kMatchesElapsedTextKey)
		aCoder.encodeObject(tournamentName, forKey: kMatchesTournamentNameKey)
		aCoder.encodeObject(outcome, forKey: kMatchesOutcomeKey)
		aCoder.encodeObject(statusCode, forKey: kMatchesStatusCodeKey)
		aCoder.encodeObject(elapsed, forKey: kMatchesElapsedKey)
		aCoder.encodeObject(startDate, forKey: kMatchesStartDateKey)
		aCoder.encodeObject(name, forKey: kMatchesNameKey)
		aCoder.encodeObject(statusShortDesc, forKey: kMatchesStatusShortDescKey)
		aCoder.encodeObject(countryName, forKey: kMatchesCountryNameKey)
		aCoder.encodeObject(ballPossession, forKey: kMatchesBallPossessionKey)
		aCoder.encodeBool(predictionOpened, forKey: kMatchesPredictionOpenedKey)
		aCoder.encodeObject(internalIdentifier, forKey: kMatchesInternalIdentifierKey)
		aCoder.encodeObject(tournamentId, forKey: kMatchesTournamentIdKey)
		aCoder.encodeObject(countryId, forKey: kMatchesCountryIdKey)
		aCoder.encodeObject(statusDesc, forKey: kMatchesStatusDescKey)
		aCoder.encodeObject(sportId, forKey: kMatchesSportIdKey)
		aCoder.encodeObject(teams, forKey: kMatchesTeamsKey)
		aCoder.encodeBool(isTicking, forKey: kMatchesIsTickingKey)
		aCoder.encodeObject(tournamentShortName, forKey: kMatchesTournamentShortNameKey)

    }

}
