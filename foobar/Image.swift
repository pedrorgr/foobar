//
//  Image.swift
//
//  Created by Pedro Ribeiro on 14/05/2016
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Image: NSObject, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kImageTitleKey: String = "title"
	internal let kImageObjectIdKey: String = "objectId"
	internal let kImageObjectCodeKey: String = "objectCode"
	internal let kImageTypeKey: String = "type"


    // MARK: Properties
	public var title: String?
	public var objectId: String?
	public var objectCode: String?
	public var type: String?


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
		title =  json[kImageTitleKey].string
		objectId = json[kImageObjectIdKey].string
		objectCode = json[kImageObjectCodeKey].string
		type = json[kImageTypeKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title!, forKey: kImageTitleKey)
		}
		if objectId != nil {
			dictionary.updateValue(objectId!, forKey: kImageObjectIdKey)
		}
		if objectCode != nil {
			dictionary.updateValue(objectCode!, forKey: kImageObjectCodeKey)
		}
		if type != nil {
			dictionary.updateValue(type!, forKey: kImageTypeKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObjectForKey(kImageTitleKey) as? String
		self.objectId = aDecoder.decodeObjectForKey(kImageObjectIdKey) as? String
		self.objectCode = aDecoder.decodeObjectForKey(kImageObjectCodeKey) as? String
		self.type = aDecoder.decodeObjectForKey(kImageTypeKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(title, forKey: kImageTitleKey)
		aCoder.encodeObject(objectId, forKey: kImageObjectIdKey)
		aCoder.encodeObject(objectCode, forKey: kImageObjectCodeKey)
		aCoder.encodeObject(type, forKey: kImageTypeKey)

    }

}
