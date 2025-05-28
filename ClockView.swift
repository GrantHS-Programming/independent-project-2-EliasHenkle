//
//  ClockView.swift
//  Standby Mode for iPhone 6s
//
//  Created by Elias Henkle on 10/17/24.
//

import SwiftUI

struct ClockView: View{
    var width = UIScreen.main.bounds.width
    var body: some View{
        @State var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
        NavigationView{
            VStack{
                HStack {
                    Image(systemName: "deskclock.fill")
                        .imageScale(.large)
                        .foregroundStyle(Color("darkMode"))
                    Text("Clock.")
                        .font(.title)
                        .foregroundStyle(Color("darkMode"))
                }
                NavigationLink(destination: ActualClock()){
                    Text("Continue to Interface")
                        .foregroundColor(Color("darkMode"))
                }
            }
        }
    }
}
