//
//  ClockView.swift
//  Standby Mode for iPhone 6s
//
//  Created by Elias Henkle on 10/17/24.
//

import SwiftUI
struct ClockView: View{
    @StateObject private var userInputModel = UserInputModel()
    var width = UIScreen.main.bounds.width
    @State private var uInput: String = ""
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
                TextField("Submit", text: $uInput)
                        .padding()
                    Button(action: {
                        print("User input: \(uInput)")
                    })
                    {
                Text("Submit")
                        .background(Color.darkMode)
                        .foregroundColor(.black)
                        .cornerRadius(5)
                }
            }
        }
    }
}
