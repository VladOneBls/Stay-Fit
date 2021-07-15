//
//  WorkingSessionView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 09/07/2021.
//

import SwiftUI
import UserNotifications

struct WorkingSessionView: View {
    
    let font = Font.system(size: 54).bold()
    
    @State var start = false
    @State var to : CGFloat = 0
    @State var count = 0
    @State var time = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            VStack {
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: 350, height: 200)
                    .cornerRadius(20)
                
                Text("WorkoutName")
                    .padding(.top, 50)
                    .font(.title)
                
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
                            .stroke(Color.red, style: StrokeStyle(lineWidth: 25, lineCap: .round))
                            .frame(width: 220, height: 250)
                            .rotationEffect(.init(degrees: -90))
                        
                        VStack {
                            
                            Text("\(self.count)")
                                .font(.system(size: 65))
                                .fontWeight(.bold)
                            
                            Text("Of 15")
                                .font(.title)
                                .padding(.top)
                        }
                    }
                    
                    // Play + Restart Buttons
                    HStack(spacing: 20) {
                        
                        Button(action: {
                            if self.count == 15 {
                                self.count = 0
                                withAnimation(.default) {
                                    self.to = 0
                                }
                            }
                            self.start.toggle()
                        }) {
                            HStack(spacing: 15) {
                                Image(systemName: self.start ? "pause.fill" : "play.fill")
                                    .foregroundColor(.white)
                                
                                Text(self.start ? "Pause" : "Play")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                            .background(Color.red)
                            .clipShape(Capsule())
                            .shadow(radius: 6)
                        }
                        
                        Button(action: {
                            self.count = 0
                            withAnimation(.default) {
                                self.to = 0
                            }
                        }) {
                            HStack(spacing: 15) {
                                Image(systemName: "arrow.clockwise")
                                    .foregroundColor(.red)
                                
                                Text("Restart")
                                    .foregroundColor(.red)
                            }
                            .padding(.vertical)
                            .frame(width: (UIScreen.main.bounds.width / 2) - 55)
                            .background(Capsule().stroke(Color.red, lineWidth: 2))
                            .shadow(radius: 6)
                        }
                    } // closing HStack for buttons
                    .padding(.top, 30)
                }
                .onAppear(perform: {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { (_, _) in
                    }
                })
                .onReceive(self.time) { (_) in
                    if self.start {
                        if self.count != 15 {
                            self.count += 1
                            print("hello")
                            withAnimation(.default){
                                self.to = CGFloat(self.count) / 15
                            }
                        }
                        else {
                            self.start.toggle()
                            //self.Notify()
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    Button(action: {
                        // code
                    }, label: {
                        Image(systemName: "lessthan")
                            .font(font)
                            .foregroundColor(.red)
                            .padding()
                    })
                    
                    Button(action: {
                        // code
                    }, label: {
                        Image(systemName: "play.circle.fill")
                            .font(font)
                            .foregroundColor(.red)
                    })
                    
                    Button(action: {
                        // code
                    }, label: {
                        Image(systemName: "greaterthan")
                            .font(font)
                            .foregroundColor(.red)
                            .padding()
                    })
                }.padding(.bottom, 30)
            }
        }
    }
}

struct WorkingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        WorkingSessionView()
    }
}
