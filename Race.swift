//
//  Race.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/15.
//  Copyright © 2020 User23. All rights reserved.
//

import Foundation

struct Race: Identifiable, Codable {
    var id = UUID()
    var date = Date()
    var name: String
    var point: String
    var serviceError: Int //發球失誤
    var receiveMiss: Int //接球失誤
    var attackError: Int //進攻失誤
}
