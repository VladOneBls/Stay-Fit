//
//  ActivityView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 03/04/2021.
//

import SwiftUI

struct ActivityView: View {
    
    @State var currentTab = 0
    
    var body: some View {
        
        VStack {
            
            // CATEGORY PICKER
            Picker(selection: $currentTab, label: Text("")) {
                Text("Cardio").tag(0)
                Text("Abs").tag(1)
                Text("Legs").tag(2)
                Text("Arms").tag(3)
            }.pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 20)
            
            NavigationView {
                
                ZStack {
                    
                    Image("background")
                        .ignoresSafeArea()
                        
                        .navigationBarTitle("Activity")
                    
                    VStack {
                        
                        Spacer()
                        
                        Text("Activity")
                        
                        Spacer()
                        
                        Text("Second row")
                        
                        Spacer()
                        
                    }
                    
                }
                
            }
            
        }
        
        
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
