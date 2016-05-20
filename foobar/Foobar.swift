//
//  Foobar.swift
//
//  Created by Pedro Ribeiro on 14/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Foobar: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFoobarRelatedToObjectCodeKey: String = "relatedToObjectCode"
	internal let kFoobarHasStandingsKey: String = "hasStandings"
	internal let kFoobarImageKey: String = "image"
	internal let kFoobarRelatedToObjectIdKey: String = "relatedToObjectId"
	internal let kFoobarMatchesKey: String = "matches"
	internal let kFoobarAdditionalNameKey: String = "additionalName"
	internal let kFoobarNameKey: String = "name"


    // MARK: Properties
	public var relatedToObjectCode: String?
	public var hasStandings: Bool = false
	public var image: Image?
	public var relatedToObjectId: String?
	public var matches: [Matches]?
	public var additionalName: String?
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
		relatedToObjectCode = json[kFoobarRelatedToObjectCodeKey].string
		hasStandings = json[kFoobarHasStandingsKey].boolValue
		image = Image(json: json[kFoobarImageKey])
		relatedToObjectId = json[kFoobarRelatedToObjectIdKey].string
		matches = []
		if let items = json[kFoobarMatchesKey].array {
			for item in items {
				matches?.append(Matches(json: item))
			}
		} else {
			matches = nil
		}
		additionalName = json[kFoobarAdditionalNameKey].string
		name = json[kFoobarNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if relatedToObjectCode != nil {
			dictionary.updateValue(relatedToObjectCode!, forKey: kFoobarRelatedToObjectCodeKey)
		}
		dictionary.updateValue(hasStandings, forKey: kFoobarHasStandingsKey)
		if image != nil {
			dictionary.updateValue(image!.dictionaryRepresentation(), forKey: kFoobarImageKey)
		}
		if relatedToObjectId != nil {
			dictionary.updateValue(relatedToObjectId!, forKey: kFoobarRelatedToObjectIdKey)
		}
		if matches?.count > 0 {
			var temp: [AnyObject] = []
			for item in matches! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kFoobarMatchesKey)
		}
		if additionalName != nil {
			dictionary.updateValue(additionalName!, forKey: kFoobarAdditionalNameKey)
		}
		if name != nil {
			dictionary.updateValue(name!, forKey: kFoobarNameKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.relatedToObjectCode = aDecoder.decodeObjectForKey(kFoobarRelatedToObjectCodeKey) as? String
		self.hasStandings = aDecoder.decodeBoolForKey(kFoobarHasStandingsKey)
		self.image = aDecoder.decodeObjectForKey(kFoobarImageKey) as? Image
		self.relatedToObjectId = aDecoder.decodeObjectForKey(kFoobarRelatedToObjectIdKey) as? String
		self.matches = aDecoder.decodeObjectForKey(kFoobarMatchesKey) as? [Matches]
		self.additionalName = aDecoder.decodeObjectForKey(kFoobarAdditionalNameKey) as? String
		self.name = aDecoder.decodeObjectForKey(kFoobarNameKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(relatedToObjectCode, forKey: kFoobarRelatedToObjectCodeKey)
		aCoder.encodeBool(hasStandings, forKey: kFoobarHasStandingsKey)
		aCoder.encodeObject(image, forKey: kFoobarImageKey)
		aCoder.encodeObject(relatedToObjectId, forKey: kFoobarRelatedToObjectIdKey)
		aCoder.encodeObject(matches, forKey: kFoobarMatchesKey)
		aCoder.encodeObject(additionalName, forKey: kFoobarAdditionalNameKey)
		aCoder.encodeObject(name, forKey: kFoobarNameKey)

    }

}
