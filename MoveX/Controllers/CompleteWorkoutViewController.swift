//
//  CompleteWorkoutViewController.swift
//  MoveX
//
//  Created by Yashika Saini on 2025-04-13.
//

import UIKit
import AVFoundation

// Description:
// This view controller is displayed upon completion of a workout.
// It shows celebratory visuals, plays cheering audio, and applies bouncing animations
// to reinforce a sense of achievement and motivate the user.
class CompleteWorkoutViewController: UIViewController {
    
    // Label displaying the main title message.
    @IBOutlet var titleLabel: UILabel!

    // Label showing a congratulatory emoji.
    @IBOutlet var emojiLabel: UILabel!

    // A second emoji label for visual variety.
    @IBOutlet var emoji2Label: UILabel!

    // Image view showing a celebratory image.
    @IBOutlet var celebrationImageView: UIImageView!

    // AVAudioPlayer instance for playing the celebration sound.
    var soundPlayer: AVAudioPlayer?

    // The name of the audio file to play (cheering sound).
    let songName = "cheer"

    // Called after the controller's view is loaded into memory.
    // WHY: Triggers audio playback as soon as the view is ready.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    playSong()

    // Do any additional setup after loading the view.
    }
    
    // Called after the view is added to the window and appears onscreen.
    // WHY: Starts bounce animations after the view is fully visible.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        applyBounce(to: titleLabel)
        applyBounce(to: emojiLabel)
        applyBounce(to: emoji2Label)
        applyBounce(to: celebrationImageView)
    }
    
    // Applies a bounce animation to the specified view.
    // WHY: Adds a dynamic and fun visual effect to emphasize celebration.
    func applyBounce(to view: UIView) {
        let bounce = CAKeyframeAnimation(keyPath: "transform.scale")
        bounce.values = [1.0, 1.2, 0.9, 1.1, 1.0]
        bounce.keyTimes = [0, 0.2, 0.5, 0.8, 1.0]
        bounce.duration = 0.8
        bounce.repeatCount = .infinity
        view.layer.add(bounce, forKey: "bounce")
    }

    // Loads and plays the cheering sound.
    // WHY: Enhances the user experience with audio feedback to celebrate the workout completion.
    func playSong() {
        if let soundURL = Bundle.main.path(forResource: songName, ofType: "mp3") {
            let url = URL(fileURLWithPath: soundURL)
            soundPlayer = try? AVAudioPlayer(contentsOf: url)
            soundPlayer?.currentTime = 30
            soundPlayer?.volume = 1.0
            soundPlayer?.numberOfLoops = -1
            soundPlayer?.play()
        } else {
            print("Audio file not found")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
