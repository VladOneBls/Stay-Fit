//
//  WorkoutsView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 03/04/2021.
//

import SwiftUI

struct WorkoutsView: View {
    
    @State var currentTab = 0
    
    @State private var cardioWorkouts = ["WARM UP", "LEGS ON FIRE", "STRONGER MUSCLES", "TONING", "BUTT & THIGHS", "1", "2", "3"]
    @State private var absWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var legsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    @State private var armsWorkouts = ["Workout 1", "Workout 2", "Workout 3", "Workout 4", "Workout 5", "Workout 6", "Workout 7", "Workout 8"]
    
    var body: some View {
        
        ZStack {
            
            Image("background")
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                NavigationView {
                    
                    ZStack {
                        
                        Image("background")
                            .offset(y: -70)
                            .edgesIgnoringSafeArea(.all)
                            //.navigationTitle("Home")
                            .navigationBarHidden(true)
                        
                        ScrollView {
                            
                            switch currentTab {
                            
                            // CARDIO TAB
                            case 0:
                                ForEach(cardioWorkouts.indices, id: \.self) { index in
                                    
                                    NavigationLink(
                                        destination: WorkoutDetailedView(),
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
                            
                        }.offset(y: 100) // closing ScrollView
                        
                        Picker(selection: $currentTab, label: Text("")) {
                            Text("Cardio").tag(0)
                            Text("Abs").tag(1)
                            Text("Legs").tag(2)
                            Text("Arms").tag(3)
                        }.pickerStyle(SegmentedPickerStyle())
                        .padding(.top, -390)
                        .padding(.horizontal, 20)
                        
                    } // closing ZStack
                    
                } // closing Navigation View
                
                // CATEGORY PICKER
                
                
                Spacer()
                
            } // closing second ZStack
        } // closing first ZStack
        
        
        
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}


struct Cardio : View {
    
    var body : some View {
        
        Text("Cardio")
        
    }
}

struct Abs : View {
    
    var body : some View {
        
        Text("Abs")
        
    }
}

struct Legs : View {
    
    var body : some View {
        
        Text("Legs")
        
    }
}

struct Arms : View {
    
    var body : some View {
        
        Text("Arms")
        
    }
}
