//
//  ViewController.swift
//  foobar
//
//  Created by Pedro Ribeiro on 14/05/16.
//  Copyright © 2016 Pedro Ribeiro. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration
import Alamofire

struct FoobarAPI {
    
    enum Router: URLRequestConvertible {
        
        static let baseURLString = "http://api.whatsthescore.com"
        
        case GetMatches(String)
        
        var URLRequest: NSMutableURLRequest {
            let (path, parameters): (String, [String: AnyObject]) = {
                switch self {
                    
                case .GetMatches(let filter):
                    let params = ["status":"\(filter)"]
                    return ("/api/test/match/", params)
         
                }
            }()
            
            let URL = NSURL(string: Router.baseURLString)
            let URLRequest = NSMutableURLRequest(URL: URL!.URLByAppendingPathComponent(path))
            URLRequest.HTTPMethod = Method.GET.rawValue
            
            
            let encoding = ParameterEncoding.URL
            
            return encoding.encode(URLRequest, parameters: parameters).0
        }
    }
    
}




public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
}

