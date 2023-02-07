//
//  EggBrain.swift
//  Egg Timer
//
//  Created by Вова on 07.02.2023.
//

import UIKit
import AVFoundation

struct EggBrain {
    
    var player : AVAudioPlayer!
    
    mutating func playSound(_ audioName: String) {
        let url = Bundle.main.url(forResource: audioName, withExtension: "mp3")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
