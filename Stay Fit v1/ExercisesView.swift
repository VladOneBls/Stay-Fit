//
//  ExercisesView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 03/04/2021.
//

import SwiftUI

struct ExercisesView: View {
    
    @State private var exercises = ["Exercise 1", "Exercise 2", "Exercise 3", "Exercise 4", "Exercise 5", "Exercise 6", "Exercise 7", "Exercise 8", "Exercise 9"]
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Image("background")
                    .offset(y: -70)
                
                ScrollView {
                    
                    ForEach(exercises.indices, id: \.self) { index in
                        
                        NavigationLink(
                            destination: WorkoutDetailedView(),
                            label: {
                                Text(self.exercises[index])
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 100, alignment: .center)
                                    .background(Color(red: 243/255, green: 189/255, blue: 126/255)) //TODO: replace with relevant image
                                    .cornerRadius(8)
                            }).padding(1)
                        
                    }
                    
                }.offset(y: 80) // closing ScrollView
                
                
            } // close first ZStack
        } // close NavigationView
        
    } // close body
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
