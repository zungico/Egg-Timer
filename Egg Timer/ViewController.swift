//
//  ViewController.swift
//  Egg Timer
//
//  Created by Вова on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    let eggTimes = ["Soft":3.0, "Medium":5.0, "Hard":7.0]
    
    var timer = Timer()
    
    var totalTime = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        totalTime = eggTimes[sender.currentTitle!]!
        timer.invalidate()
        
        progressBar.progress = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:  #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    @objc func updateCounter() {
        if progressBar.progress < 1.0 {
            progressBar.progress += (1.0/Float(totalTime))
            print("\(progressBar.progress)")
            
        } else {
            questionLabel.text = "Done!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.questionLabel.text = "How do you like your eggs?"
                
            }
            timer.invalidate()
            
        }
        
    }
}


