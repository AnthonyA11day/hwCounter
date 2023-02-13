//
//  ViewController.swift
//  hwCounter
//
//  Created by Anthony on 13.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    var counterLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.backgroundColor = .systemGray4
        title = "Counter"
        
        createLabel()
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
    
    
    
    
    
}

