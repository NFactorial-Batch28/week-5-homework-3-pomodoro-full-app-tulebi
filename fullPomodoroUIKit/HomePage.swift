//
//  ViewController.swift
//  fullPomodoroUIKit
//
//  Created by Тулеби Берик on 07.05.2023.
//

import UIKit

class HomeView: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Focus on your task"
        label.textColor = .white
        label.textAlignment = .center
    return label
    }()
    
    private let bgImage: UIImageView = {
        let image = UIImage(named: "work")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    
    var timerText: String = "25:00"
    private var timer: Timer?
    private var remainingTime = 25 * 60 // 25 minutes
    private let circularTimerView = CircularTimerView()
    private let playButton = UIButton()
    private let stopButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [bgImage,label].forEach{self.view.addSubview( $0 )}
        
        bgImage.fillView(self.view)
        label.anchor(top: self.view.topAnchor,left: self.view.leftAnchor,right: self.view.rightAnchor,paddingTop: 410, paddingLeft: 50, paddingRight: 50)
        
        setupCircularTimerView()
        setupButtons()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.circularTimerView.setTimerText(self.timerText)
    }
    
    private func setupCircularTimerView() {
        circularTimerView.frame = CGRect(x: 0, y: 0, width: 0, height: 100)
        circularTimerView.center = view.center
        view.addSubview(circularTimerView)
    }
    
    private func setupButtons() {
        let playButtonImage = UIImage(systemName: "play.fill")
        playButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        playButton.center = CGPoint(x: view.center.x - 80, y: view.center.y + 150)
        playButton.setImage(playButtonImage, for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        view.addSubview(playButton)
        
        let stopButtonImage = UIImage(systemName: "stop.fill")
        stopButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        stopButton.center = CGPoint(x: view.center.x + 80, y: view.center.y + 150)
        stopButton.setImage(stopButtonImage, for: .normal)
        stopButton.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        view.addSubview(stopButton)
    }
    
    @objc private func playButtonTapped() {
        startTimer()
    }
    
    @objc private func stopButtonTapped() {
        stopTimer()
    }
    
    private func startTimer() {
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            if self.remainingTime > 0 {
                self.remainingTime -= 1
                let progress = CGFloat(self.remainingTime) / (25 * 60) // Calculate progress from remaining time
                self.circularTimerView.setProgress(progress)
                let minutes = self.remainingTime / 60
                let seconds = self.remainingTime % 60
                self.timerText = String(format: "%02d:%02d", minutes, seconds)
                self.circularTimerView.setTimerText(self.timerText)
            } else {
                self.stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
