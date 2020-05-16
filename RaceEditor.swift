//
//  RaceEditor.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/15.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct RaceEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var raceData: RaceData
    @State private var date = Date()
    @State private var name = ""
    @State private var point = ""
    @State private var serviceError = 0
    @State private var receiveMiss = 0
    @State private var attackError = 0
    @State private var showAlert = false
        
    var editRace: Race?
    var body: some View {
        Form {
            TextField("比賽隊伍", text: $name)
            DatePicker("比賽日期", selection: $date,in: ...Date(), displayedComponents: .date)
            TextField("比分", text: $point)
            Stepper("發球失誤 \(serviceError)", value: $serviceError, in: 0...20)
            Stepper("接球失誤 \(receiveMiss)", value: $receiveMiss, in: 0...20)
            Stepper("進攻失誤 \(attackError)", value: $attackError, in: 0...20)
        }
        .navigationBarTitle(editRace == nil ? "新增比賽" : "修改比賽")
        .navigationBarItems(trailing: Button("儲存") {
            if(self.name == "") || (self.point == "") {
                self.showAlert = true
            }
            else {
                let race = Race(date: self.date, name: self.name, point: self.point, serviceError: self.serviceError, receiveMiss: self.receiveMiss, attackError: self.attackError)
                if let editRace = self.editRace {
                    let index = self.raceData.races.firstIndex {
                        $0.id == editRace.id
                    }!
                    self.raceData.races[index] = race
                }
                else {
                    self.raceData.races.insert(race, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .alert(isPresented: $showAlert) {
            () -> Alert in
            return Alert(title: Text("無法儲存"), message: Text("有輸入是空白的!!"))
        })
            .onAppear {
                if let editRace = self.editRace {
                    self.date = editRace.date
                    self.name = editRace.name
                    self.point = editRace.point
                    self.serviceError = editRace.serviceError
                    self.receiveMiss = editRace.receiveMiss
                    self.attackError = editRace.attackError
                }
            }
        }
}

struct RaceEditor_Previews: PreviewProvider {
    static var previews: some View {
        RaceEditor(raceData: RaceData())
    }
}
