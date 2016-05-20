//
//  Results.swift
//
//  Created by Pedro Ribeiro on 14/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Results: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kResultsRunningscoreKey: String = "runningscore"
	internal let kResultsHalftimeKey: String = "halftime"


    // MARK: Properties
	public var runningscore: String?
	public var halftime: String?


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
		runningscore = json[kResultsRunningscoreKey].string
		halftime = json[kResultsHalftimeKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if runningscore != nil {
			dictionary.updateValue(runningscore!, forKey: kResultsRunningscoreKey)
		}
		if halftime != nil {
			dictionary.updateValue(halftime!, forKey: kResultsHalftimeKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.runningscore = aDecoder.decodeObjectForKey(kResultsRunningscoreKey) as? String
		self.halftime = aDecoder.decodeObjectForKey(kResultsHalftimeKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(runningscore, forKey: kResultsRunningscoreKey)
		aCoder.encodeObject(halftime, forKey: kResultsHalftimeKey)

    }

}
