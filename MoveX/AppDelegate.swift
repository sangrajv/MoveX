//
//  MoveX
//
//  Created by Yashika Saini on 2025-04-12.
//



import UIKit
import GoogleSignIn
import FirebaseCore
import FirebaseFirestore
import SQLite3
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var databaseName = "fitness.db"
    var databasePath = ""
    var workoutData: [WorkoutData] = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        print("Firestore: \(db)")

        // Setup SQLite DB
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDir = documentPaths[0]
        databasePath = documentsDir.appending("/" + databaseName)

        checkAndCreateDatabase()
        readWorkoutData()
        requestNotificationAuthorization()
        scheduleWorkoutReminder(hour: 22, minute: 08)
        UNUserNotificationCenter.current().delegate = self

        return true
    }
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Notification authorization granted.")
            } else {
                print("Notification authorization denied.")
            }
        }
    }
    
    func scheduleWorkoutReminder(hour: Int, minute: Int) {
            let center = UNUserNotificationCenter.current()

            // Remove any existing notification with the same ID
            center.removePendingNotificationRequests(withIdentifiers: ["WorkoutReminder"])

            let content = UNMutableNotificationContent()
            content.title = "Workout Time 💪"
            content.body = "Don't forget your workout today!"
            content.sound = UNNotificationSound.default

            var dateComponents = DateComponents()
            dateComponents.hour = hour
            dateComponents.minute = minute

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let request = UNNotificationRequest(identifier: "WorkoutReminder", content: content, trigger: trigger)

            center.add(request) { error in
                if let error = error {
                    print("Failed to schedule notification: \(error)")
                } else {
                    print("Workout reminder scheduled for \(hour):\(minute).")
                }
            }
        }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.banner, .sound])
        }
    
    
    

    func checkAndCreateDatabase() {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: databasePath) {
            print("Database already exists at: \(databasePath)")
            return
        }

        if let bundleDBPath = Bundle.main.path(forResource: "fitness", ofType: "db") {
            do {
                try fileManager.copyItem(atPath: bundleDBPath, toPath: databasePath)
                print("Database copied to Documents directory.")
            } catch {
                print("Error copying database: \(error)")
            }
        } else {
            print("fitness.db not found in bundle.")
        }
    }

    func readWorkoutData() {
        workoutData.removeAll()

        var db: OpaquePointer?
        if sqlite3_open(databasePath, &db) != SQLITE_OK {
            print("Unable to open database.")
            return
        }

        let workoutQuery = "SELECT * FROM workouts"
        var workoutStmt: OpaquePointer?

        if sqlite3_prepare_v2(db, workoutQuery, -1, &workoutStmt, nil) == SQLITE_OK {
            while sqlite3_step(workoutStmt) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(workoutStmt, 0))
                let title = String(cString: sqlite3_column_text(workoutStmt, 1))
                let imageName = String(cString: sqlite3_column_text(workoutStmt, 2))
                let time = String(cString: sqlite3_column_text(workoutStmt, 3))

                let workout = WorkoutData()
                workout.initWithData(id: id, title: title, imageName: imageName, time: time, exercises: [])

                // Fetch exercises for this workout
                let exerciseQuery = "SELECT name FROM exercises WHERE workoutId = \(id)"
                var exerciseStmt: OpaquePointer?

                if sqlite3_prepare_v2(db, exerciseQuery, -1, &exerciseStmt, nil) == SQLITE_OK {
                    while sqlite3_step(exerciseStmt) == SQLITE_ROW {
                        let exerciseName = String(cString: sqlite3_column_text(exerciseStmt, 0))
                        workout.exercises.append(exerciseName)
                    }
                    sqlite3_finalize(exerciseStmt)
                }

                workoutData.append(workout)
                print("Loaded workout: \(title) with \(workout.exercises.count) exercises")
            }
            sqlite3_finalize(workoutStmt)
        } else {
            print("Failed to prepare workout statement.")
        }

        sqlite3_close(db)
    }

    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

