//
//  MotivationModel.swift
//  App343
//
//  Created by DJUNA on 23/02/2024.
//

import SwiftUI

struct MotivationModel: Codable, Hashable {

    var errors: Bool?
    var rows: [Podcasts]?
}

struct Podcasts: Codable, Hashable {
 
    var id: Int?
    
    var title: String?
    var image: String?
    var audio: String?
    var duration: Int?
}

