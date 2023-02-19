//
//  ViewController.swift
//  hwCounter
//
//  Created by Anthony on 13.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private var counterLabel = UILabel()
    private var counterButton = UIButton()
    private var counterValue = 0
    private var holdTimer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        title = "Counter".localized()
        view.backgroundColor = .systemGray4
        createLabel()
        createButton()
        addResetButton()
    }
    
//MARK: label
    private func createLabel() {
        counterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        counterLabel.center = view.center
        counterLabel.text = "0"
        counterLabel.textAlignment = .center
        counterLabel.font = UIFont.systemFont(ofSize: 16 * 7)
        view.addSubview(counterLabel)
    }
    

//MARK: button
    func createButton() {
        counterButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 16 * 2))
        counterButton.center.x = view.center.x
        counterButton.center.y = view.center.y + 100
        let settitle = "Tap or Hold".localized()
        counterButton.setTitle(settitle, for: .normal)
        counterButton.setTitleColor(.systemBlue, for: .normal)
        counterButton.setTitleColor(.black, for: .highlighted)
        counterButton.addTarget(self, action: #selector(holdButton), for: .touchDown )
        counterButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside )
        view.addSubview(counterButton)
    }
    
//MARK: bitton methods
    @objc func touchButton() {
        counterValue += 1
        counterLabel.text = String(counterValue)
        holdTimer.invalidate()
    }
    
    @objc func holdButton() {
        createTimer()
    }
}

//MARK: bar button - Reset
extension ViewController {
    func addResetButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset".localized(),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(actionReset))
    }

    @objc func actionReset() {
        counterValue = 0
        counterLabel.text = "0"
        holdTimer.invalidate()
    }
}

//MARK: timer
extension ViewController {
    func createTimer() {
        holdTimer = Timer.scheduledTimer(timeInterval: 0.2,
                                         target: self,
                                         selector: #selector(counter),
                                         userInfo: nil,
                                         repeats: true)
    }
    
    @objc func counter() {
        counterValue +=  1
        counterLabel.text = String(counterValue)
    }
}
