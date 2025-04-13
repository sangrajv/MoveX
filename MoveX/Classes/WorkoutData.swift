//
//  WorkoutData.swift
//  MoveX
//
//  Created by Yashika Saini on 2025-04-12.
//

import UIKit

class WorkoutData: NSObject {
    var id: Int?
    var title: String?
    var imageName: String?
    var time: String?
    var exercises: [String] = []

    func initWithData(id: Int, title: String, imageName: String, time: String, exercises: [String]) {
        self.id = id
        self.title = title
        self.imageName = imageName
        self.time = time
        self.exercises = exercises
    }
}
