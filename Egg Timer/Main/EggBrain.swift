//
//  EggBrain.swift
//  Egg Timer
//
//  Created by Вова on 07.02.2023.
//

import UIKit
import AVFoundation

struct EggBrain {
    
    var egg : String?
    
    var totalTime = 0.0
    
    mutating func getTimeAndName (with sender: UIButton) {
        totalTime = eggTimes[sender.currentTitle!]!
        egg = sender.currentTitle
    }
    var player : AVAudioPlayer!
    
    let segueIdentifier = "goToResult"
    let labelText = ["How do you like your eggs?", "Cooking...", "Done!"]
    let soundName = "boiling"
    let eggTimes = ["Soft":3.0, "Medium":5.0, "Hard":7.0]
    
    mutating func playSound(_ audioName: String) {
        let url = Bundle.main.url(forResource: audioName, withExtension: "mp3")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func changeLabelWhenDone (with label: UILabel) {
        label.text = labelText[2]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            label.text = labelText[0]
        }
    }
    
    func changeAlpha (of sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
            sender.alpha = 1.0
        }
    }
    
    func getImageName () -> String {
        
        switch egg {
        case "Soft" : return "soft_egg"
        case "Medium" : return "medium_egg"
        default : return "hard_egg"
        }
    }
    
}
