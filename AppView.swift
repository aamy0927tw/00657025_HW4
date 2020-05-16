//
//  AppView.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/16.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var playerData = PlayerData()
    @ObservedObject var raceData = RaceData()
    var body: some View {
        TabView {
            PlayerList(playerData: self.playerData).tabItem {
                Image(systemName: "person.2.fill")
                Text("球員")
            }
            RaceList(raceData: self.raceData).tabItem {
                Image(systemName: "rosette")
                Text("比賽")
            }
            Analysis(raceData: self.raceData).tabItem {
                Image(systemName: "cursor.rays")
                Text("分析")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
