//
//  ViewController.swift
//  Egg Timer
//
//  Created by Вова on 28.01.2023.
//

import UIKit
import AVFoundation

class CookViewController: UIViewController {
    
    var eggBrain = EggBrain()
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var timer = Timer()
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        
        
        eggBrain.getTimeAndName(with: sender)
        eggBrain.playSound(eggBrain.soundName)
        eggBrain.changeAlpha(of: sender)
        
        progressBar.progress = 0.0
        
        questionLabel.text = eggBrain.labelText[1]
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:  #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    @objc func updateCounter() {
        
        if progressBar.progress < 1.0 {
            progressBar.progress += (1.0/Float(eggBrain.totalTime))
            
        } else {
            eggBrain.changeLabelWhenDone(with: questionLabel)
            
            timer.invalidate()
            eggBrain.playSound("alarmbell")
            performSegue(withIdentifier: eggBrain.segueIdentifier, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == eggBrain.segueIdentifier {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.imageName = eggBrain.getImageName()
        }
    }
}


