//
//  ActualClock.swift
//  Standby Mode for iPhone 6s
//
//  Created by Elias Henkle on 5/21/25.
//
import SwiftUI
struct ActualClock: View{
    @State var date = Date()
    var timeFormat: DateFormatter{...}
        func timeString(date: Date) -> String {
            let time = timeFormat.string(from: date)
            return time
        }
    var body: some View {
    HStack {
    Text("\(date)")
            .foregroundColor(Color("darkMode"))
            .navigationBarHidden(true)
    }
    }
}
