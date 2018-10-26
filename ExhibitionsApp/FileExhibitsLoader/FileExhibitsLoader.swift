//
//  FileExhibitsLoader.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation

class FileExhibitsLoader: IExhibitsLoader {
    let requestSender: RequestSender
    let requestBuilder: RequestBuilder
    
    // MARK: - Init
    init(requestSender: RequestSender, requestBuilder: RequestBuilder) {
        self.requestSender = requestSender
        self.requestBuilder = requestBuilder
    }
    
    func getExhibitList(handler: @escaping ([Exhibit]) -> Void) {
        let request = self.requestBuilder.getExhibitList()
        self.requestSender.sendRequest(request, responseType: [Exhibit].self, success: { [weak self] (response) in
            DispatchQueue.main.async { handler(response) }
            },
        failure: { [weak self] (error) in
            print(error.localizedDescription)
        })
    }
}
