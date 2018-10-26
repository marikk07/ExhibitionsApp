//
//  RequestBuilder.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation
import Alamofire

struct RequestBuilder {
    
    
    func getExhibitList() -> APIRequest {
        let url = "https://gist.githubusercontent.com/u-android/41ade05b6ae1133e7e86e9dfd55f1794/raw/bab1c383b0384d1a4c889b399ad7b13ae05634fa/ios%20challenge%20json"
        let request = self.commonAPIRequest(stringUrl: url, httpMethod: .get)
        return request
    }
    
    // MARK: - Private
    private func commonAPIRequest(stringUrl: String, httpMethod: HTTPMethod) -> APIRequest {
        return APIRequest(apiMethod: stringUrl, httpMethod: httpMethod)
    }
}
