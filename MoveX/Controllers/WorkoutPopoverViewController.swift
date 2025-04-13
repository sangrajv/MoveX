//
//  WorkoutPopoverViewController.swift
//  MoveX
//
//  Created by Yashika Saini on 2025-04-12.
//
//  Description: This view controller is responsible for displaying detailed information
//               about a selected workout in a popover. It shows the workout title, time,
//               image, and a list of exercises.
//

import UIKit

class WorkoutPopoverViewController: UIViewController {
    
    //adding segue
    @IBAction func unwindToWorkoutPopOver(segue: UIStoryboardSegue) {
        
    }
    

    // Label displaying the title of the workout
    @IBOutlet var titleLabel: UILabel!
        
    // Label showing the duration/time of the workout
    @IBOutlet var timeLabel: UILabel!
        
    // Image view displaying the main image representing the workout
    @IBOutlet var masterImageView: UIImageView!
        
    // Text view listing the exercises included in the workout
    @IBOutlet var exercisesLabel: UITextView!

    // Object containing all the workout details passed to this view
    var workoutData: WorkoutData?

    override func viewDidLoad() {
        super.viewDidLoad()

        // WHY: Populate UI elements with workout data passed from the AppDelegate.
        if let workout = workoutData {
            titleLabel.text = workout.title
            timeLabel.text = "Time: \(workout.time ?? "")"
            masterImageView.image = UIImage(named: workout.imageName ?? "")
            exercisesLabel.text = workout.exercises.joined(separator: "\n")
        }
    }

}
