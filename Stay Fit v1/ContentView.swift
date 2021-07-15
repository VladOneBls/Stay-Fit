//
//  ContentView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 31/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarTitle("Home")
                    //.navigationBarHidden(true)
                
                VStack {
                    // QUOTE
                    Text("Our bodies communicate to us clearly and specifically, if we are willing to listen to them")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title2)
                        .padding()
                        .padding(.top, 100)
                    
                    // AUTHOR
                    Text("- Shakti Gawain")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                        .padding(.leading, 200)
                    
                    Spacer()
                    
                    HStack {
                        NavigationLink(
                            destination: WorkoutsView(),
                            label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 170, height: 170, alignment: .center)
                                        .cornerRadius(10)
                                    Text("Workouts")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                            })
                        
                        NavigationLink(
                            destination: ExercisesView(),
                            label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.black)
                                        .frame(width: 170, height: 170, alignment: .center)
                                        .cornerRadius(10)
                                    Text("Exercises")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                }
                            })
                    }
                    
                    Spacer()
                }
            }
        }
    }
}
