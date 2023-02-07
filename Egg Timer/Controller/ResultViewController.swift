//
//  ResultViewController.swift
//  Egg Timer
//
//  Created by Вова on 07.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var imageName : String?

    @IBOutlet weak var eggImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eggImage.image = UIImage(named: imageName ?? "soft_egg")
    }

    @IBAction func restartButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
