//
//  ViewController.swift
//  BlinkingLabel
//
//  Created by frevega on 08/27/2020.
//  Copyright (c) 2020 frevega. All rights reserved.
//

import UIKit
import BlinkingLabel

class ViewController: UIViewController {
    var isBlinking = false
    
    private let blinkingLabel = BlinkingLabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLabel()
        prepareButton()
        blinkingLabel.startBlinking()
        isBlinking = true
    }
    
    private func prepareLabel() {
        guard blinkingLabel.superview == nil else { return }
        
        blinkingLabel.text = "I blink!"
        blinkingLabel.textAlignment = .center
        blinkingLabel.font = UIFont.systemFont(ofSize: 20)
        blinkingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blinkingLabel)
        NSLayoutConstraint.activate([
            blinkingLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 30),
            blinkingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            blinkingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    private func prepareButton() {
        guard button.superview == nil else { return }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Toggle Blinking", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(toggleBlinking), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: blinkingLabel.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc
    func toggleBlinking() {
        if (isBlinking) {
            blinkingLabel.stopBlinking()
        } else {
            blinkingLabel.startBlinking()
        }
        isBlinking = !isBlinking
    }
}

