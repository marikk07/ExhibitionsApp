//
//  IExhibitsLoader.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation

protocol IExhibitsLoader {
    func getExhibitList(handler: @escaping ([Exhibit]) -> Void)
}
