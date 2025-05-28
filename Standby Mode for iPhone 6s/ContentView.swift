//  ContentView.swift
//  Standby Mode for iPhone 6s
//  Created by Elias Henkle on 9/19/24.
import SwiftUI
struct ContentView: View {
    
        @State var isDark=false
    
    var body: some View {
            NavigationView {
                Home(isDark: $isDark)
                    .navigationBarHidden(true)
                    .preferredColorScheme(isDark ? .dark : .light)
            }
        }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home : View{
    @Binding var isDark : Bool
    var width = UIScreen.main.bounds.width
    @State var current_time = Time(min: 0, sac: 0, hour: 0)
    @State var receiver = Timer.publish(every: 1, on: .current, in: .default).autoconnect()
    var body : some View{
        VStack{
            HStack{
                Text("Clock")
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer(minLength: 0)
                
                Button(action: {isDark.toggle()}){
                    Image(systemName: isDark ? "sun.min.fill" : "moon.fill")
                        .font(.system(size:22))
                        .foregroundColor(isDark ? .black : .white)
                        .padding()
                        .background(Color.primary)
                    clipShape(Circle())
                }
            }
            .padding()
            Spacer(minLength:0)
            ZStack{
                Circle()
                    .fill(Color("darkMode").opacity(0.1))
                ForEach(0..<60, id: \.self){i in
                }
                Rectangle()
                    .fill(Color.primary)
                    .frame(width: 4.5, height: (width - 200) / 2)
                    .offset(y: -(width - 240) / 4)
                .rotationEffect(.init(degrees: Double(current_time.hour) * 30))
                
                Circle()
                    .fill(Color.darkMode)
                    .frame(width: 15, height: 15)
            }
        }
    }
    struct Time{
        var min : Int
        var sac : Int
        var hour : Int
    }
}
