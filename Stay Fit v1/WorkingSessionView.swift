import SwiftUI
import UserNotifications

struct WorkingSessionView: View {
    
    let font = Font.system(size: 70).bold()
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var seconds = 30
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Rectangle() // replace with workout image
                .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .frame(width: 350, height: 200)
                .cornerRadius(20)
            
            Text("ExerciseName") // replace with exercise name
                .font(.largeTitle).bold()
                .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                .padding(.top, 10)
            
            // COUNTDOWN TIMER
            VStack {
                // Circle + Countdown
                ZStack {
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(Color.black.opacity(0.09), style: StrokeStyle(lineWidth: 25, lineCap: .round))
                        .frame(width: 220, height: 250)
                    
                    Circle()
                        .trim(from: 0, to: self.to)
                        .stroke((Color(red: 243/255, green: 189/255, blue: 126/255)), style: StrokeStyle(lineWidth: 25, lineCap: .round))
                        .frame(width: 220, height: 250)
                        .rotationEffect(.init(degrees: -90))
                    
                    Text("\(self.seconds)")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                        .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                }
            }.padding(.top, 40)
            .onAppear(perform: {
                UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                }
            })
            .onReceive(self.time) { (_) in
                if self.start {
                    if self.seconds != 0 {
                        self.seconds -= 1
                        withAnimation(.default){
                            self.to = CGFloat(self.seconds) / 30
                        }
                    }
                    else {
                        self.start.toggle()
                    }
                }
            } // closing countdown timer
            
            HStack {
                // Back Button
                Button(action: {
                    // code
                }, label: {
                    Image(systemName: "lessthan")
                        .font(font)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
                // Play/Pause Button
                Button(action: {
                    if self.seconds == 15 {
                        self.seconds = 0
                        withAnimation(.default) {
                            self.to = 0
                        }
                    }
                    self.start.toggle()
                }, label: {
                    
                    Image(systemName: self.start ? "pause.circle.fill" : "play.circle.fill")
                        .font(font)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                })
                // Forward Button
                Button(action: {
                    // code
                }, label: {
                    Image(systemName: "greaterthan")
                        .font(font)
                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                        .padding()
                })
            }.padding(.bottom, 10).padding(.top,40)
            
            // Restart Button
            Button(action: {
                self.seconds = 30
                withAnimation(.default) {
                    self.to = 0
                }
            }) {
                HStack(spacing: 15) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                    Text("Restart")
                        .foregroundColor(.white).bold()
                }
                .padding()
                .background((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .cornerRadius(50)
            }
        }
    }
}

struct WorkingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        WorkingSessionView()
    }
}
