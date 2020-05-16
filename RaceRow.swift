//
//  RaceRow.swift
//  00657025_HW4
//
//  Created by User23 on 2020/5/15.
//  Copyright © 2020 User23. All rights reserved.
//

import SwiftUI

struct RaceRow: View {
    var race: Race
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        return dateFormatter
    }()
    var body: some View {
        HStack {
            Text(race.name)
            Spacer()
            Text(dateFormatter.string(from: race.date))
        }
    .padding()
    }
}

struct RaceRow_Previews: PreviewProvider {
    static var previews: some View {
        RaceRow(race: Race(date: DateComponents(calendar: Calendar.current, year: 2020, month: 5, day: 15).date!, name: "台大1", point: "22:25", serviceError: 5, receiveMiss: 4, attackError: 3))
    }
}
