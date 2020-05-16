//
//  PlayerData.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/14.
//  Copyright © 2020 User23. All rights reserved.
//

import Foundation

class PlayerData: ObservableObject {
    @Published var players = [Player]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(players) {
                UserDefaults.standard.set(data, forKey: "players")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "players") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Player].self, from: data) {
                players = decodedData
            }
        }
    }
}
