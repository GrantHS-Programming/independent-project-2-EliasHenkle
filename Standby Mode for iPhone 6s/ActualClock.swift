//
//  ActualClock.swift
//  Standby Mode for iPhone 6s
//
//  Created by Elias Henkle on 5/21/25.
//
import SwiftUI
class UserInputModel: ObservableObject{
    @StateObject private var userInputModel = UserInputModel()
    @Published var text: String = ""
}
struct ActualClock: View{
    @State private var showingSheet = false
    @State private var mainText = ""
    @State var date = Date()
    @State private var uInput: String = ""
    var dateFormat: DateFormatter{
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    var timeFormat: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
    func timeString(date: Date) -> String {
        let time = timeFormat.string(from: date)
        return time
    }
    func dateString(date: Date) -> String {
        let date = dateFormat.string(from: date)
        return date
    }
    var body: some View {
        VStack(spacing: 10) {
            Text("\(timeString(date: date))")
                .foregroundColor(Color("darkMode"))
                .navigationBarHidden(true)
                .font(.system(size: 45.0))
            Text("\(dateString(date: date))")
                .foregroundColor(Color("darkMode"))
                .navigationBarHidden(true)
                .font(.system(size: 100.0))
            TextField("Your text will appear here", text: $mainText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        Button("Edit Text in Sheet") {
                            showingSheet = true
                        }
                        .sheet(isPresented: $showingSheet) {
                            TextInputSheet(text: $mainText)
                        }
        }
        struct TextInputSheet: View{
            @Binding var text: String
            @Environment(\.dismiss) var dismiss
            var body some View{
                NavigationView {
                           VStack {
                               TextField("Type something...", text: $text)
                                   .textFieldStyle(RoundedBorderTextFieldStyle())
                                   .padding()

                               Spacer()
                           }
                           .navigationTitle("Enter Text")
                           .toolbar {
                               ToolbarItem(placement: .confirmationAction) {
                                   Button("Done") {
                                       dismiss()
                                   }
                               }
                           }
                       }
            }
            
        }
        .onReceive(
            Timer.publish(every: 1, on: .main, in: .common).autoconnect())
        { _ in
            self.date = Date()
        }
    }
}
