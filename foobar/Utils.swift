//
//  Utils.swift
//  foobar
//
//  Created by Pedro Ribeiro on 15/05/16.
//  Copyright © 2016 Pedro Ribeiro. All rights reserved.
//

import Foundation
import Alamofire

class Utils {
    
    class func setLogo(url:String, image: UIImageView) {
        
        Alamofire.request(.GET, url).response() {
            (_, _, data, _) in
            image.image = UIImage(data:data!)
        }
    }
}