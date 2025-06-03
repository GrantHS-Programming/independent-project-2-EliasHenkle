//
//  ActualClock.swift
//  Standby Mode for iPhone 6s
//
//  Created by Elias Henkle on 5/21/25.
//
import SwiftUI
struct ActualClock: View{
    @State var date = Date()
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
            
        }
        .onReceive(
            Timer.publish(every: 1, on: .main, in: .common).autoconnect())
        { _ in
            self.date = Date()
        }
    }
}

@AssistantEntity(schema: .books.book)
struct BookEntity {
    struct Query: EntityStringQuery {
        func entities(for identifiers: [BookEntity.ID]) async throws -> [BookEntity] { [] }
        func entities(matching string: String) async throws -> [BookEntity] { [] }
    }
    
    static var defaultQuery = Query()
    var displayRepresentation: DisplayRepresentation { "Unimplemented" }
    
    let id = UUID()
    
    var title: String?
    var seriesTitle: String?
    var author: String?
    var genre: String?
    var purchaseDate: Date?
    var contentType: <#BookContentType#>?
    var url: URL?
}
