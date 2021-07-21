//
//  ExerciseViewModel.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 21/07/2021.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    
    @Published var exercises: [ExerciseModel] = []
    
    init() {
        getExercises()
    }
    
    func getExercises() {
        let newExercises = [
            ExerciseModel(name: "Lunges", picture: "lunges", description: "A lunge is a single-leg bodyweight exercise that works your hips, glutes, quads, hamstrings, and core and the hard-to-reach muscles of your inner thighs. Lunges can help you develop lower-body strength and endurance.", targetMuscles: ["legs"]),
            ExerciseModel(name: "Squats", picture: "squats", description: "", targetMuscles: ["legs"]),
            ExerciseModel(name: "Bike Crunches", picture: "bikecrunches", description: "", targetMuscles: ["legs"]),
            ExerciseModel(name: "Leg Raises", picture: "legraises", description: "", targetMuscles: ["legs"]),
            ExerciseModel(name: "1", picture: "1", description: "", targetMuscles: [""]),
            ExerciseModel(name: "2", picture: "2", description: "", targetMuscles: [""]),
            ExerciseModel(name: "3", picture: "3", description: "", targetMuscles: [""]),
            ExerciseModel(name: "4", picture: "4", description: "", targetMuscles: [""])
        ]
        
        exercises.append(contentsOf: newExercises)
    }
    
    // add any functions as delete/move
    
}
