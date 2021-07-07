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
    @State private var absWorkouts = ["1", "2", "3"]
    
    var body: some View {
        
        ZStack {
            
            Image("background")
            
            VStack {
                
                // CATEGORY PICKER
                Picker(selection: $currentTab, label: Text("")) {
                    Text("Cardio").tag(0)
                    Text("Abs").tag(1)
                    Text("Legs").tag(2)
                    Text("Arms").tag(3)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.top, 90)
                .padding(.horizontal, 20)
                
                Spacer()
                
                // CARDIO TAB
                if currentTab == 0 {
                    
                    NavigationView {
                        
                        ScrollView {
                            
                            ForEach(cardioWorkouts.indices, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    //TODO
                                    
                                }, label: {
                                    Text(self.cardioWorkouts[index])
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .frame(width: 360, height: 100, alignment: .center)
                                        .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                        .cornerRadius(8)
                                }).padding(1)
                                
                            }
                        }
                    }
                }
                
                // ABS TAB
                if currentTab == 1 {
                    
                    NavigationView {
                        
                        ScrollView {
                            
                            ForEach(absWorkouts.indices, id: \.self) { index in
                                
                                // TODO: to be transformed into buttons instead of rectangles with text
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                        .frame(width: 360, height: 100, alignment: .center)
                                    
                                    Text(self.absWorkouts[index])
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                }.padding([.leading, .trailing])
                            }
                        }
                    }
                    
                }
                
                //LEGS TAB
                if currentTab == 2 {
                    Text("Legs")
                }
                
                // ARMS TAB
                if currentTab == 3 {
                    Text("Arms")
                }
                
                Spacer()
                
            }
            
        }
        
        
        
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
