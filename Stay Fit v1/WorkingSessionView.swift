//
//  WorkingSessionView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 09/07/2021.
//

import SwiftUI

struct WorkingSessionView: View {
    
    @State var currentTab = 0
    @State private var cardioWorkouts = ["WARM UP", "LEGS ON FIRE", "STRONGER MUSCLES", "TONING", "BUTT & THIGHS", "1", "2", "3"]
    @State private var absWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var legsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var armsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                    //.navigationTitle("Home")
                    .navigationBarHidden(true)
                VStack {
                    Picker(selection: $currentTab, label: Text("")) {
                        Text("Cardio").tag(0)
                        Text("Abs").tag(1)
                        Text("Legs").tag(2)
                        Text("Arms").tag(3)
                    }.pickerStyle(SegmentedPickerStyle())
                    .padding(.top, -365)
                    .padding(.horizontal, 20)
                    
                    ScrollView {
                        
                        switch currentTab {
                        
                        // CARDIO TAB
                        case 0:
                            ForEach(cardioWorkouts.indices, id: \.self) { index in
                                
                                NavigationLink(
                                    destination: Text("Detailed Exercise"),
                                    label: {
                                        Text(self.cardioWorkouts[index])
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .frame(width: 360, height: 100, alignment: .center)
                                            .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                            .cornerRadius(8)
                                    }).padding(1)
                            }
                            
                        // ABS TAB
                        case 1:
                            ForEach(absWorkouts.indices, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    //TODO
                                    
                                }, label: {
                                    Text(self.absWorkouts[index])
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 360, height: 100, alignment: .center)
                                        .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                        .cornerRadius(8)
                                }).padding(1)
                            }
                            
                        // LEGS TAB
                        case 2:
                            ForEach(legsWorkouts.indices, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    //TODO
                                    
                                }, label: {
                                    Text(self.legsWorkouts[index])
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 360, height: 100, alignment: .center)
                                        .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                        .cornerRadius(8)
                                }).padding(1)
                            }
                            
                        // ARMS TAB
                        case 3:
                            ForEach(armsWorkouts.indices, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    //TODO
                                    
                                }, label: {
                                    Text(self.armsWorkouts[index])
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 360, height: 100, alignment: .center)
                                        .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                        .cornerRadius(8)
                                }).padding(1)
                            }
                            
                        default:
                            Text("ERROR")
                        } // closing switch
                        
                    } // closing ScrollView
                }
            }
        }
        
    }
}

struct WorkingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        WorkingSessionView()
    }
}
