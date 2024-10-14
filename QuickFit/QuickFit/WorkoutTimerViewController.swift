//
//  WorkoutTimerViewController.swift
//  QuickFit
//
//  Created by Adam Abukhdair on 7/16/24.
//

import UIKit
import AudioToolbox

class WorkoutTimerViewController: UIViewController {

    var workoutName: String?
    var timer: Timer?
    var exerciseDuration = 30
    var restDuration = 10
    var isExercise = true

    let timerLabel = UILabel()
    let currentExerciseLabel = UILabel()
    let nextIntervalLabel = UILabel()
    let startStopButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        currentExerciseLabel.text = workoutName
        currentExerciseLabel.textAlignment = .center
        currentExerciseLabel.font = UIFont.systemFont(ofSize: 24)
        currentExerciseLabel.translatesAutoresizingMaskIntoConstraints = false

        timerLabel.text = "\(exerciseDuration)"
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont.systemFont(ofSize: 48)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false

        nextIntervalLabel.text = "Rest"
        nextIntervalLabel.textAlignment = .center
        nextIntervalLabel.font = UIFont.systemFont(ofSize: 24)
        nextIntervalLabel.translatesAutoresizingMaskIntoConstraints = false

        startStopButton.setTitle("Start", for: .normal)
        startStopButton.addTarget(self, action: #selector(startStopTapped), for: .touchUpInside)
        startStopButton.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [currentExerciseLabel, timerLabel, nextIntervalLabel, startStopButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }

    @objc func startStopTapped() {
        if timer == nil {
            startStopButton.setTitle("Stop", for: .normal)
            startTimer()
        } else {
            startStopButton.setTitle("Start", for: .normal)
            stopTimer()
        }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @objc func updateTimer() {
        if isExercise {
            if exerciseDuration > 0 {
                exerciseDuration -= 1
                timerLabel.text = "\(exerciseDuration)"
            } else {
                isExercise = false
                exerciseDuration = 30
                nextIntervalLabel.text = "Exercise"
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
        } else {
            if restDuration > 0 {
                restDuration -= 1
                timerLabel.text = "\(restDuration)"
            } else {
                isExercise = true
                restDuration = 10
                nextIntervalLabel.text = "Rest"
                AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
            }
        }
    }
}
