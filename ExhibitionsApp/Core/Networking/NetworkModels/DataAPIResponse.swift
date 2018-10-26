//
//  DataAPIResponse.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation

enum DataAPIResponse<T: Decodable>: Decodable {
    case data(value: T)
    case error(ErrorResponse)
    
    enum CodingKeys: String, CodingKey {
        case data = "list"
        case error = "error"
    }
    
    init(from decoder: Decoder) throws {
        
        let value = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            let data = try value.decode(T.self, forKey: .data)
            self = .data(value: data)
        } catch {
            do {
                let errors = try value.decode([ErrorResponse].self, forKey: .error)
                self = .error(errors[0])
            } catch {
                #if DEBUG
                fatalError("Unable to decode response")
                #else
                throw NSError(domain: "Unable to decode response", code: -99999, userInfo: nil)
                #endif
            }
        }
    }
}
