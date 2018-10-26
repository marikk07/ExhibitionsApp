//
//  RequestSender.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation

protocol RequestSender {
    func sendRequest<Response>(_ request: APIRequest,
                               responseType: Response.Type,
                               success: @escaping (Response) -> (),
                               failure: @escaping (ApiError) -> ()) where Response: Decodable
}
