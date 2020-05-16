//
//  PlayerEditor.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/14.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct PlayerEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var playerData: PlayerData
    @State private var name = ""
    @State private var department = ""
    @State private var age = ""
    @State private var position = ""
    @State private var height = ""
    @State private var weight = ""
    @State private var bodyFat = 17
    @State private var starter = false
    @State private var showAlert = false
    @State private var isAnalysis = false
    @State private var showPlayerAnalysis = false
    @State private var hitString: String = ""
    @State private var totalString: String = ""
    
    let ages = ["大一", "大二", "大三", "大四", "大五", "碩一", "碩二"]
    let positions = ["舉球", "大砲", "欄中", "舉對", "自由"]
    
    var editPlayer: Player?
    var body: some View {
        Form {
            TextField("名字", text: $name)
            TextField("系所", text: $department)
            VStack(alignment: .leading) {
                Picker("年級", selection: $age) {
                    ForEach(ages, id: \.self) { (age) in
                        Text(age)
                    }
                }
            }
            VStack(alignment: .leading) {
                Picker("位置", selection: $position) {
                    ForEach(positions, id: \.self) { (position)in
                        Text(position)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Group {
                TextField("身高", text: $height)
                TextField("體重", text: $weight)
                Stepper("體脂 \(bodyFat)", value: $bodyFat, in: 0...50)
                Toggle("先發", isOn: $starter)
                Toggle("球員分析", isOn: $isAnalysis)
                if isAnalysis {
                    HStack {
                        Text("總球數")
                        TextField("總球數", text: $totalString)
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Text("欲分析的球數")
                        TextField("欲分析的球數", text: $hitString)
                            .keyboardType(.numberPad)
                    }
                    NavigationLink(destination: PlayerAnalysis(name: self.name, position: self.position, hitString: self.hitString, totalString: self.totalString)) {
                        Text("查看分析結果")
                    }
                }
            }
        }
        .navigationBarTitle(editPlayer == nil ? "新增球員" : "修改資料")
        .navigationBarItems(trailing: Button("儲存") {
            if(self.name == "") || (self.department == "") || (self.age == "") || (self.position == "") || (self.height == "") || (self.weight == "") {
                self.showAlert = true
            }
            else {
                let player = Player(name: self.name, department: self.department, age: self.age, position: self.position, height: self.height, weight: self.weight, bodyFat: self.bodyFat, starter: self.starter, hit: self.hitString, total: self.totalString)
                if let editPlayer = self.editPlayer {
                    let index = self.playerData.players.firstIndex {
                        $0.id == editPlayer.id
                    }!
                    self.playerData.players[index] = player
                }
                else {
                    self.playerData.players.insert(player, at: 0)
                }
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .alert(isPresented: $showAlert) {
            () -> Alert in
            return Alert(title: Text("無法儲存"), message: Text("有東西忘了填喔!!"))
        })
        .onAppear {
            if let editPlayer = self.editPlayer {
                self.name = editPlayer.name
                self.department = editPlayer.department
                self.age = editPlayer.age
                self.position = editPlayer.position
                self.height = editPlayer.height
                self.weight = editPlayer.weight
                self.bodyFat = editPlayer.bodyFat
                self.starter = editPlayer.starter
                self.hitString = editPlayer.hit
                self.totalString = editPlayer.total
            }
        }
    }
}

struct PlayerEditor_Previews: PreviewProvider {
    static var previews: some View {
        PlayerEditor(playerData: PlayerData())
    }
}
