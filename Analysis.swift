//
//  Analysis.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/15.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct Analysis: View {
    @ObservedObject var raceData = RaceData()
    var percentages: [Double] = [0, 0, 0]
    var count: [Double] = [0, 0, 0]
    var totalCount: Int = 0
    var angle: [Angle]
    
    init(raceData: RaceData) {
        self.raceData = raceData
        for data in raceData.races {
            totalCount += data.serviceError
            totalCount += data.receiveMiss
            totalCount += data.attackError
            count[0] += Double(data.serviceError)
            count[1] += Double(data.receiveMiss)
            count[2] += Double(data.attackError)
        }
        percentages[0] = count[0] / Double(totalCount)
        percentages[1] = count[1] / Double(totalCount)
        percentages[2] = count[2] / Double(totalCount)
        angle = [Angle]()
        var degree: Double = 0
        for percentage in percentages {
            angle.append(.degrees(degree))
            degree += 360 * percentage
        }
    }
    
    var body: some View {
        VStack {
            if self.raceData.races.count != 0 {
                Text("比賽失誤總分析")
                    .font(.system(size: 40))
                ZStack {
                    PieChart(startAngle: self.angle[0], endAngle: self.angle[1])
                        .fill(Color.purple)
                    PieChart(startAngle: self.angle[1], endAngle: self.angle[2])
                        .fill(Color.blue)
                    PieChart(startAngle: self.angle[2], endAngle: .zero)
                        .fill(Color.pink)
                }
                .frame(width: 230, height: 230)
                .padding()
                HStack {
                    Image(systemName: "square.fill")
                        .foregroundColor(.purple)
                    Text("發球失誤 \(percentages[0])")
                        .font(.system(size: 20))
                }
                HStack {
                    Image(systemName: "square.fill")
                        .foregroundColor(.blue)
                    Text("接球失誤 \(percentages[1])")
                        .font(.system(size: 20))
                }
                HStack {
                    Image(systemName: "square.fill")
                        .foregroundColor(.pink)
                    Text("進攻失誤 \(percentages[2])")
                        .font(.system(size: 20))
                }
            }
            else {
                Text("還沒輸入比賽資料喔!!")
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct Analysis_Previews: PreviewProvider {
    static var previews: some View {
        Analysis(raceData: RaceData())
    }
}
