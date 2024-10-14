//
//  CustomTimerViewController.swift
//  QuickFit
//
//  Created by Adam Abukhdair on 7/16/24.
//

import UIKit

class CustomTimerViewController: UIViewController {

    let intervalLabel = UILabel()
    let intervalTextField = UITextField()
    let exerciseLabel = UILabel()
    let exerciseTextField = UITextField()
    let restLabel = UILabel()
    let restTextField = UITextField()
    let saveButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        intervalLabel.text = "Number of Intervals:"
        intervalLabel.translatesAutoresizingMaskIntoConstraints = false

        intervalTextField.placeholder = "Enter intervals"
        intervalTextField.borderStyle = .roundedRect
        intervalTextField.translatesAutoresizingMaskIntoConstraints = false

        exerciseLabel.text = "Exercise Duration (sec):"
        exerciseLabel.translatesAutoresizingMaskIntoConstraints = false

        exerciseTextField.placeholder = "Enter exercise duration"
        exerciseTextField.borderStyle = .roundedRect
        exerciseTextField.translatesAutoresizingMaskIntoConstraints = false

        restLabel.text = "Rest Duration (sec):"
        restLabel.translatesAutoresizingMaskIntoConstraints = false

        restTextField.placeholder = "Enter rest duration"
        restTextField.borderStyle = .roundedRect
        restTextField.translatesAutoresizingMaskIntoConstraints = false

        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [intervalLabel, intervalTextField, exerciseLabel, exerciseTextField, restLabel, restTextField, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            intervalTextField.widthAnchor.constraint(equalToConstant: 200),
            exerciseTextField.widthAnchor.constraint(equalToConstant: 200),
            restTextField.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
