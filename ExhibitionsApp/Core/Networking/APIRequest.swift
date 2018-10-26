//
//  APIRequest.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation
import Alamofire


struct APIRequest  {
    let apiMethod: String
    let httpMethod: HTTPMethod
    var headers: HTTPHeaders?
    var parameters: Parameters?
    var httpBody: Data?
    
    init(apiMethod: String, httpMethod: HTTPMethod,
         headers: HTTPHeaders? = nil, parameters: Parameters? = nil) {
        self.apiMethod = apiMethod
        self.httpMethod = httpMethod
        self.headers = headers
        self.parameters = parameters
        self.httpBody = nil
    }
    
    init(apiMethod: String, httpMethod: HTTPMethod,
         headers: HTTPHeaders? = nil, httpBody: Data) {
        self.apiMethod = apiMethod
        self.httpMethod = httpMethod
        self.headers = headers
        self.parameters = nil
        self.httpBody = httpBody
    }
}
