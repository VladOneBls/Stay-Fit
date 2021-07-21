//
//  ExerciseModel.swift
//  Stay Fit v1
//
//  Created by Vlad Balash on 20/07/2021.
//

import Foundation

struct ExerciseModel: Identifiable {
    
    let id: String = UUID().uuidString
    let name: String
    let picture: String
    let description: String
    let targetMuscles: [String]
    
}
