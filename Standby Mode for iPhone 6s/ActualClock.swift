//
//  ActualClock.swift
//  Standby Mode for iPhone 6s
//
//  Created by Elias Henkle on 5/21/25.
//
import SwiftUI

class UserInputModel: ObservableObject {
    @Published var text: String = ""
}
struct TextInputSheet: View {
    @Binding var text: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
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
struct ActualClock: View {
    @State private var showingSheet = false
    @State private var mainText = ""
    @State var date = Date()
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }
    var timeFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }
    func timeString(date: Date) -> String {
        return timeFormat.string(from: date)
    }
    func dateString(date: Date) -> String {
        return dateFormat.string(from: date)
    }
    var body: some View {
        VStack(spacing: 10) {
            Text("\(timeString(date: date))")
                .foregroundColor(Color("darkMode"))
                .font(.system(size: 45.0))
            Text("\(dateString(date: date))")
                .foregroundColor(Color("darkMode"))
                .font(.system(size: 100.0))
            TextField("Your text will appear here", text: $mainText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Edit Status")
                {
                showingSheet = true
            }
            .foregroundColor(Color("darkMode"))
            .sheet(isPresented: $showingSheet) {
                TextInputSheet(text: $mainText)
            }
        }
        .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
            self.date = Date()
        }
    }
}
