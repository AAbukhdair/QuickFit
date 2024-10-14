//
//  WorkoutsViewController.swift
//  QuickFit
//
//  Created by Adam Abukhdair on 7/16/24.
//

import UIKit

class WorkoutsViewController: UITableViewController {

    let workouts = ["HIIT", "Tabata", "Yoga"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "WorkoutCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath)
        cell.textLabel?.text = workouts[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let workoutTimerVC = WorkoutTimerViewController()
        workoutTimerVC.workoutName = workouts[indexPath.row]
        self.navigationController?.pushViewController(workoutTimerVC, animated: true)
    }
}
