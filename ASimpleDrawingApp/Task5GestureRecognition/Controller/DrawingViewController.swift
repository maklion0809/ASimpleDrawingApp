//
//  DrawingViewController.swift
//  Task5GestureRecognition
//
//  Created by Tymofii (Work) on 03.10.2021.
//

import UIKit

final class DrawingViewController: UIViewController {

    // MARK: - Configuration
    
    private enum Configuration {
        static let minimumPressDuration: Double = 1
    }
    
    // MARK: - UI element
    
    private lazy var drawView: DrawView = {
        let view = DrawView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Lifecycle of controller

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubview()
        setupGesture()
    }
    
    // MARK: - Setting up the subview
    
    private func setupSubview() {
        view.addSubview(drawView)
        drawView.frame = view.frame
    }
    
    // MARK: - Setting up the gesture recognizer
    
    private func setupGesture() {
        let long = UILongPressGestureRecognizer(target: self, action: #selector(clearScreenGesture))
        long.minimumPressDuration = Configuration.minimumPressDuration
        view.addGestureRecognizer(long)
    }
    
    // MARK: - Gesture action
    
    @objc private func clearScreenGesture() {
        drawView.clearScreen()
    }
}
