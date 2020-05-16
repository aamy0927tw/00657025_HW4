//
//  RaceData.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/15.
//  Copyright © 2020 User23. All rights reserved.
//

import Foundation

class RaceData: ObservableObject {
    @Published var races = [Race]() {
        didSet {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(races) {
                UserDefaults.standard.set(data, forKey: "races")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "races") {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Race].self, from: data) {
                races = decodedData
            }
        }
    }
}
