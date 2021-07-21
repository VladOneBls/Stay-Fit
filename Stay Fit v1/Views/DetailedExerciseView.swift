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
    let description: String
    
    var body: some View {
        ZStack {
            Image("background").edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("lunges")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: 380, height: 200)
//                    .cornerRadius(20)
                
                Text(exerciseName)
                    .font(.largeTitle).bold()
                    .foregroundColor(.black)
                
                Text(description)
                    .padding(40)
                
                Spacer()
                
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
                            .padding(.top, 50)
                    }).padding(.bottom, 120)
            }.padding(.top, 20)
        } // closing first ZStack
    }
}

struct DetailedExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedExerciseView(exerciseName: "Exercise Name", description: "Description")
            .environmentObject(ExerciseViewModel())
    }
}
