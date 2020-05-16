//
//  PlayerRow.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/14.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct PlayerRow: View {
    var player: Player
    var body: some View {
        HStack {
            Text(player.name)
            Spacer()
            Text(player.position)
            Image(systemName: player.starter ? "tag.fill" : "tag")
        }
    .padding()
    }
}

struct PlayerRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRow(player: Player(name: "莎賓娜", department: "??", age: "大四", position: "欄中", height: "182.2", weight: "60", bodyFat: 20, starter: false, hit: "100.0", total: "100.0"))
    }
}
