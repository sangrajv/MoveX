//
//  WorkoutData.swift
//  MoveX
//
//  Created by Yashika Saini on 2025-04-12.
//
// Description:
// This class serves as a data model representing a workout. It contains properties like
// the workout's ID, title, image name, time duration, and a list of included exercises.
// This model is used throughout the app to populate UI components and transfer workout data.

import UIKit

class WorkoutData: NSObject {
    // The unique identifier for this workout instance.
    var id: Int?
        
    // The title or name of the workout (e.g., "Full Body Warm Up").
    var title: String?
        
    // The name of the image associated with the workout.
    var imageName: String?
        
    // The total time allocated for the workout.
    var time: String?
        
    // An array containing the list of exercise names in the workout.
    var exercises: [String] = []

    // Initializes a WorkoutData object with all necessary workout properties.
    //
    // Parameters:
    // - id: The workout's unique identifier.
    // - title: The name/title of the workout.
    // - imageName: The filename of the image for this workout.
    // - time: The duration of the workout.
    // - exercises: The list of exercises in this workout.
    //
    // WHY: Allows for quickly setting all properties of the workout in one place,
    // which helps when populating this model from the Sqlite database.
    func initWithData(id: Int, title: String, imageName: String, time: String, exercises: [String]) {
        self.id = id
        self.title = title
        self.imageName = imageName
        self.time = time
        self.exercises = exercises
    }
}
