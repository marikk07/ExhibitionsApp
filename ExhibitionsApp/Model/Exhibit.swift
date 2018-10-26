//
//  Exhibit.swift
//  ExhibitionsApp
//
//  Created by Maryan Pasichniak on 10/26/18.
//  Copyright © 2018 Maryan Pasichniak. All rights reserved.
//

import Foundation

struct Exhibit: Decodable {
    let title: String
    let images: [String]
    var selectedIndex: Int?
}

