//
//  Player.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/14.
//  Copyright © 2020 User23. All rights reserved.
//

import Foundation

struct Player: Identifiable, Codable {
    var id = UUID()
    var name: String
    var department: String
    var age: String
    var position: String
    var height: String
    var weight: String
    var bodyFat: Int
    var starter: Bool
    var hit: String
    var total: String
}
