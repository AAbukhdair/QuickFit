//
//  SettingsViewController.swift
//  QuickFit
//
//  Created by Adam Abukhdair on 7/16/24.
//

import UIKit

class SettingsViewController: UIViewController {

    let soundSwitch = UISwitch()
    let soundLabel = UILabel()
    let vibrationSwitch = UISwitch()
    let vibrationLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupUI()
    }

    func setupUI() {
        soundLabel.text = "Enable Sound"
        soundLabel.translatesAutoresizingMaskIntoConstraints = false

        soundSwitch.translatesAutoresizingMaskIntoConstraints = false

        vibrationLabel.text = "Enable Vibration"
        vibrationLabel.translatesAutoresizingMaskIntoConstraints = false

        vibrationSwitch.translatesAutoresizingMaskIntoConstraints = false

        let stackView = UIStackView(arrangedSubviews: [soundLabel, soundSwitch, vibrationLabel, vibrationSwitch])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
