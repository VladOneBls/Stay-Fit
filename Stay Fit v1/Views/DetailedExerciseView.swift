//
//  DetailedExerciseView.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 20/07/2021.
//

import SwiftUI

struct DetailedExerciseView: View {
    
    @EnvironmentObject var exerciseViewModel: ExerciseViewModel
        
    let exerciseName: String
    let steps: [String]
    
    var body: some View {
        ZStack {
            Image("background").edgesIgnoringSafeArea(.all)
            
            VStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 390, height: 250)
                
                Text(exerciseName)
                    .font(.largeTitle).bold()
                    .foregroundColor(.black)
                
                List {
                    ForEach(0..<steps.count) { index in
                        HStack (spacing: 15) {
                            Text("\(index+1)")
                                .font(.title2).bold()
                                .foregroundColor(.gray)

                            Text(steps[index])
                                .foregroundColor(.black)
                                .padding(3)
                        }
                    }
                }
                    
                .frame(width: 370, height: 400)
                .cornerRadius(10)
                
                NavigationLink(
                    destination: ExercisingSessionView(exerciseName: exerciseName),
                    label: {
                        Text("START")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 370, height: 50, alignment: .center)
                            .background(Color(red: 243/255, green: 189/255, blue: 126/255))
                            .cornerRadius(5)
                            .padding(.bottom, 10)
                    })
            }
            .offset(y: 35)
            .edgesIgnoringSafeArea(.all)
            
        } // closing first ZStack
    }
}

struct DetailedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedExerciseView(exerciseName: "Exercise Name", steps: ["1", "2", "3", "4", "5"])
            .environmentObject(ExerciseViewModel())
    }
}
