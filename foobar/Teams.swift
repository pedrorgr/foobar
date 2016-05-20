//
//  Teams.swift
//
//  Created by Pedro Ribeiro on 14/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Teams: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kTeamsNumberKey: String = "number"
	internal let kTeamsResultsKey: String = "results"
	internal let kTeamsShortNameKey: String = "shortName"
	internal let kTeamsInternalIdentifierKey: String = "id"
	internal let kTeamsOutcomeKey: String = "outcome"
	internal let kTeamsRedCardsTotalKey: String = "redCardsTotal"
	internal let kTeamsLogoUrlKey: String = "logoUrl"
	internal let kTeamsNameKey: String = "name"


    // MARK: Properties
	public var number: Int?
	public var results: Results?
	public var shortName: String?
	public var internalIdentifier: Int?
	public var outcome: String?
	public var redCardsTotal: Int?
	public var logoUrl: String?
	public var name: String?


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
		number = json[kTeamsNumberKey].int
		results = Results(json: json[kTeamsResultsKey])
		shortName = json[kTeamsShortNameKey].string
		internalIdentifier = json[kTeamsInternalIdentifierKey].int
		outcome =  json[kTeamsOutcomeKey].string
		redCardsTotal = json[kTeamsRedCardsTotalKey].int
		logoUrl = json[kTeamsLogoUrlKey].string
		name = json[kTeamsNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if number != nil {
			dictionary.updateValue(number!, forKey: kTeamsNumberKey)
		}
		if results != nil {
			dictionary.updateValue(results!.dictionaryRepresentation(), forKey: kTeamsResultsKey)
		}
		if shortName != nil {
			dictionary.updateValue(shortName!, forKey: kTeamsShortNameKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kTeamsInternalIdentifierKey)
		}
		if outcome != nil {
			dictionary.updateValue(outcome!, forKey: kTeamsOutcomeKey)
		}
		if redCardsTotal != nil {
			dictionary.updateValue(redCardsTotal!, forKey: kTeamsRedCardsTotalKey)
		}
		if logoUrl != nil {
			dictionary.updateValue(logoUrl!, forKey: kTeamsLogoUrlKey)
		}
		if name != nil {
			dictionary.updateValue(name!, forKey: kTeamsNameKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.number = aDecoder.decodeObjectForKey(kTeamsNumberKey) as? Int
		self.results = aDecoder.decodeObjectForKey(kTeamsResultsKey) as? Results
		self.shortName = aDecoder.decodeObjectForKey(kTeamsShortNameKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kTeamsInternalIdentifierKey) as? Int
		self.outcome = aDecoder.decodeObjectForKey(kTeamsOutcomeKey) as? String
		self.redCardsTotal = aDecoder.decodeObjectForKey(kTeamsRedCardsTotalKey) as? Int
		self.logoUrl = aDecoder.decodeObjectForKey(kTeamsLogoUrlKey) as? String
		self.name = aDecoder.decodeObjectForKey(kTeamsNameKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(number, forKey: kTeamsNumberKey)
		aCoder.encodeObject(results, forKey: kTeamsResultsKey)
		aCoder.encodeObject(shortName, forKey: kTeamsShortNameKey)
		aCoder.encodeObject(internalIdentifier, forKey: kTeamsInternalIdentifierKey)
		aCoder.encodeObject(outcome, forKey: kTeamsOutcomeKey)
		aCoder.encodeObject(redCardsTotal, forKey: kTeamsRedCardsTotalKey)
		aCoder.encodeObject(logoUrl, forKey: kTeamsLogoUrlKey)
		aCoder.encodeObject(name, forKey: kTeamsNameKey)

    }

}
