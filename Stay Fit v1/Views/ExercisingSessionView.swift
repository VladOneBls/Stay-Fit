//
//  ExercisingSessionView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 20/07/2021.
//

import SwiftUI

struct ExercisingSessionView: View {
    
    @ObservedObject var timerManager = TimerManager()
    
    @State var exerciseName = "Lunges"
    
    var body: some View {
        VStack {
            Image("lunges")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
//            Rectangle()
//                .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
//                .frame(width: 380, height: 200)
//                .cornerRadius(20)
            
            Text(exerciseName)
                .font(.largeTitle).bold()
                .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
            
            ZStack {
                Circle()
                    .stroke(Color(red: 243/255, green: 189/255, blue: 126/255), lineWidth: 12)
                    .frame(width: 280, height: 280)
                
                if timerManager.timerMode == .finished {
                    Text("End")
                        .font(.system(size: 150))
                        .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                        .padding(.vertical, 60)
                }
                else {
                    Text("\(timerManager.secondsLeft)")
                        .font(.system(size: 150))
                        .foregroundColor((Color(red: 161/255, green: 99/255, blue: 68/255)))
                        .padding(.vertical, 60)
                }
            }
            
            Button(action: {
                if timerManager.timerMode != .finished {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(seconds: 5)
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                }
            }, label: {
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
                    .padding()
            })
            
            // PLAY/PAUSE BUTTON
//            if timerManager.timerMode != .finished {
//                Button(action: {
//                    if self.timerManager.timerMode == .initial {
//                        self.timerManager.setTimerLength(seconds: 5)
//                    }
//                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
//                }, label: {
//                    Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 80, height: 80)
//                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
//                        .padding()
//                })
//            }
//            else {
//                Button(action: {
//                    
//                }, label: {
//                    Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 80, height: 80)
//                        .foregroundColor((Color(red: 243/255, green: 189/255, blue: 126/255)))
//                        .padding()
//                })
//            }
            
            
            // RESTART BUTTON
            Button(action: {
                self.timerManager.reset()
            }, label: {
                HStack(spacing: 15) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                    Text("Restart")
                        .foregroundColor(.white).bold()
                }
                .padding()
                .background((Color(red: 243/255, green: 189/255, blue: 126/255)))
                .cornerRadius(50)
            })
            
            Spacer()
        }
        .offset(y: 50)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ExercisingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisingSessionView()
    }
}
