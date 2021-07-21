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
            ExerciseModel(name: "Lunges", logo: "", picture: "lunges", video: "", steps: ["Stand with your feet wider than your hips and feet pointed slightly out", "Begin bending your knees until parallel to the floor with your back as straight as possible", "Push back up until standing position", "Repeat", "Finish"], targetMuscles: ["legs"]),
            ExerciseModel(name: "Squats", logo: "", picture: "squats", video: "", steps: [""], targetMuscles: ["legs"]),
            ExerciseModel(name: "Bike Crunches", logo: "", picture: "bikecrunches", video: "", steps: [""], targetMuscles: ["legs"]),
            ExerciseModel(name: "Leg Raises", logo: "", picture: "legraises", video: "", steps: [""], targetMuscles: ["legs"]),
            ExerciseModel(name: "1", logo: "", picture: "1", video: "", steps: [""], targetMuscles: [""]),
            ExerciseModel(name: "2", logo: "", picture: "2", video: "", steps: [""], targetMuscles: [""]),
            ExerciseModel(name: "3", logo: "", picture: "3", video: "", steps: [""], targetMuscles: [""]),
            ExerciseModel(name: "4", logo: "", picture: "4", video: "", steps: [""], targetMuscles: [""])
        ]
        
        exercises.append(contentsOf: newExercises)
    }
    
    // add any functions as delete/move
    
}
