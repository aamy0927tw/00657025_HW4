//
//  PlayerAnalysis.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/16.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct PlayerAnalysis: View {
    var name: String = ""
    var position: String = ""
    var totalString: String = ""
    var hitString: String = ""
    var total: Double = 0.0
    var hit: Double = 0.0
    var rate: Double = 0.0
    @State private var trimEnd: CGFloat = 0
    
    init(name: String, position: String, hitString: String, totalString: String) {
        self.name = name
        self.position = position
        self.hitString = hitString
        self.totalString = totalString
        self.hit = (hitString as NSString).doubleValue
        self.total = (totalString as NSString).doubleValue
        rate = hit / total
    }
    
    var body: some View {
        VStack {
            Text("\(name) 分析")
                .font(.system(size: 50))
            Text("位置: \(position)")
                .font(.system(size: 20))
            Spacer()
            ZStack {
                Text("\(rate)")
                    .font(.system(size: 33))
                Circle()
                    .trim(from: 0, to: trimEnd)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .frame(width: 250, height: 250)
                    .animation(.linear(duration: 0.8))
                    .onAppear {
                        self.trimEnd = CGFloat(self.rate)
                }
            }
            Spacer()
        }
    .padding()
    }
}

struct PlayerAnalysis_Previews: PreviewProvider {
    static var previews: some View {
        PlayerAnalysis(name: "123", position: "555", hitString: "75.0", totalString: "100.0")
    }
}
