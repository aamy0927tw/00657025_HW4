//
//  RaceList.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/15.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct RaceList: View {
    @ObservedObject var raceData = RaceData()
    @State private var showEditRace = false
    let color = UIColor(red: 102/255, green: 255/255, blue: 230/255, alpha: 0.3)
    var body: some View {
        NavigationView {
            List {
                ForEach(raceData.races) { (race) in
                    NavigationLink(destination: RaceEditor(raceData: self.raceData, editRace: race)) {
                        RaceRow(race: race)
                    }
                }
                .onMove { (indexSet, index) in
                    self.raceData.races.move(fromOffsets: indexSet, toOffset: index)
                }
                .onDelete { (IndexSet) in
                    self.raceData.races.remove(atOffsets: IndexSet)
                }
                .listRowBackground(Color.init(color))
            }
            .navigationBarTitle("比賽列表")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showEditRace = true
            }, label: {
                Image(systemName: "plus.circle.fill")
            }))
                .sheet(isPresented: $showEditRace) {
                    NavigationView {
                        RaceEditor(raceData: self.raceData)
                    }
            }
        }
    }
}

struct RaceList_Previews: PreviewProvider {
    static var previews: some View {
        RaceList()
    }
}
