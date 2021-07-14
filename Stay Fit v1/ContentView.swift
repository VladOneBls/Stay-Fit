//
//  ContentView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 31/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected = 1
    
    var body: some View {
        
        TabView(selection: $selected) {
            
            HomeView().tabItem ({
                Image(systemName: "house.fill")
                Text("Home")
            }).tag(0)
            
            ExercisesView().tabItem ({
                Image(systemName: "gamecontroller.fill")
                Text("Exercises")
            }).tag(1)
            
            WorkoutsView().tabItem ({
                Image(systemName: "stopwatch.fill")
                Text("Workouts")
            }).tag(2)
            
            ActivityView().tabItem ({
                Image(systemName: "chart.bar.xaxis")
                Text("Activity")
            }).tag(3)
            
            SettingsView().tabItem ({
                Image(systemName: "gearshape.2.fill")
                Text("Settings")
            }).tag(4)
            
        }.accentColor(Color(red: 161/255, green: 99/255, blue: 68/255))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
