//
//  WorkoutPopoverViewController.swift
//  MoveX
//
//  Created by Yashika Saini on 2025-04-12.
//

import UIKit

class WorkoutPopoverViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
        @IBOutlet var timeLabel: UILabel!
        @IBOutlet var masterImageView: UIImageView!
        @IBOutlet var exercisesLabel: UITextView!

        var workoutData: WorkoutData?

        override func viewDidLoad() {
            super.viewDidLoad()

            if let workout = workoutData {
                titleLabel.text = workout.title
                timeLabel.text = "Time: \(workout.time ?? "")"
                masterImageView.image = UIImage(named: workout.imageName ?? "")
                exercisesLabel.text = workout.exercises.joined(separator: "\n")
            }
        }

}
