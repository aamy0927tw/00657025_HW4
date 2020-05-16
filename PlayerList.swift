//
//  PlayerList.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/14.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct PlayerList: View {
    @ObservedObject var playerData = PlayerData()
    @State private var showEditPlayer = false
    let color = UIColor(red: 102/255, green: 255/255, blue: 230/255, alpha: 0.3)
    var body: some View {
        NavigationView {
            List {
                ForEach(playerData.players) { (player) in
                    NavigationLink(destination: PlayerEditor(playerData: self.playerData, editPlayer: player)) {
                        PlayerRow(player: player)
                    }
                }
                .onMove { (indexSet, index) in
                    self.playerData.players.move(fromOffsets: indexSet, toOffset: index)
                }
                .onDelete { (IndexSet) in
                    self.playerData.players.remove(atOffsets: IndexSet)
                }
                .listRowBackground(Color.init(color))
            }
            .navigationBarTitle("球員列表")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showEditPlayer = true
            }, label: {
                Image(systemName: "plus.circle.fill")
            }))
                .sheet(isPresented: $showEditPlayer) {
                    NavigationView {
                        PlayerEditor(playerData: self.playerData)
                    }
            }
        }
    }
}

struct PlayerList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerList()
    }
}
