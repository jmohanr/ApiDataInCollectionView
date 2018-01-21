//
//  ApiDataFile.swift
//  JaganInterViewTest
//
//  Created by Ammulu on 20/01/18.
//  Copyright © 2018 JaganMohan. All rights reserved.
//

import Foundation

struct HeroStats:Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
