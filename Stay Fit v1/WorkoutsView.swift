//
//  WorkoutsView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 03/04/2021.
//

import SwiftUI

struct WorkoutsView: View {
    
    @State var currentTab = 0
    
    @State private var names = ["WARM UP", "LEGS ON FIRE", "STRONGER MUSCLES", "TONING", "BUTT & THIGHS", "1", "2", "3"]
    
    var body: some View {
        
        ZStack {
            
            Image("background")
            
            VStack {
                
                Picker(selection: $currentTab, label: Text("")) {
                    Text("Cardio").tag(0)
                    Text("Abs").tag(1)
                    Text("Legs").tag(2)
                    Text("Arms").tag(3)
                }.pickerStyle(SegmentedPickerStyle())
                .padding(.top, 90)
                .padding(.horizontal, 20)
                
                Spacer()
                
                if currentTab == 0 {
                    
                    NavigationView {
                        
                        ScrollView {
                            
                            ForEach(names.indices, id: \.self) { index in
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                        .frame(width: 360, height: 100, alignment: .center)
                                    
                                    Text(self.names[index])
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                }.padding([.leading, .trailing])
                            }
                        }
                    }
                }
                
                if currentTab == 1 {
                    Text("Abs")
                }
                if currentTab == 2 {
                    Text("Legs")
                }
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
