//
//  ViewController.swift
//  ConstraintsHW
//
//  Created by Efimov Aleksandr Igorevich on 08.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var leftLabel: UILabel = {
        let label = UILabel(frame: .zero)
//        label.text = "Left label"
        label.text = "Left label text фыв фыв фыв ывф в"
        label.backgroundColor = .brown
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var rightLabel: UILabel = {
        let label = UILabel(frame: .zero)
//        label.text = "Right label"
        label.text = "Right label text ыфвфывфыв ы вы в"
        label.backgroundColor = .blue
        label.textColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(leftLabel)
        self.view.addSubview(rightLabel)
        self.view.addSubview(imageView)
        setupLandscapeModeConstraintsForLabelsAndImageView()
        setupPortaitModeConstraintsForLabels()
        setupPortaitModeContraintsForImageView()
        
        if view.frame.width > view.frame.height {
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.activate(portraitConstraints)
        }
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
    
    private func setupPortaitModeConstraintsForLabels() {
        leftLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        rightLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        let constraints = [
            leftLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            leftLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            leftLabel.trailingAnchor.constraint(equalTo: rightLabel.leadingAnchor, constant: -16),
            
            rightLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            rightLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            rightLabel.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 16)
        ]
        portraitConstraints.append(contentsOf: constraints)
    }
    
    private func setupPortaitModeContraintsForImageView() {
        let marginFromCenter = 0 - self.view.safeAreaLayoutGuide.layoutFrame.height / 10
        let constraints = [
            imageView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: marginFromCenter),
            imageView.topAnchor.constraint(lessThanOrEqualTo: rightLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ]
        portraitConstraints.append(contentsOf: constraints)
    }
    
    private func setupLandscapeModeConstraintsForLabelsAndImageView() {
        let constraints = [
            leftLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            leftLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            leftLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -16),
            
            imageView.topAnchor.constraint(equalTo: leftLabel.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leftLabel.trailingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: rightLabel.leadingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: leftLabel.bottomAnchor),
            imageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            rightLabel.topAnchor.constraint(equalTo: leftLabel.topAnchor),
            rightLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            rightLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ]
        
        landscapeConstraints.append(contentsOf: constraints)
    }
}



