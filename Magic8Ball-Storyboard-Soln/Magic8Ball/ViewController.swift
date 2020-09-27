//
//  ViewController.swift
//  Magic8Ball
//
//  Created by jrasmusson on 2020-09-26.
//

import UIKit

class ViewController: UIViewController {
    
    let answerImages = [
        UIImage(named: "ask-again-later"),
        UIImage(named: "i-have-no-idea"),
        UIImage(named: "no"),
        UIImage(named: "yes"),
        UIImage(named: "the-answer-is-yes"),
    ]
    
    @IBOutlet weak var answerImageView: UIImageView!
    @IBOutlet weak var askButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerImageView.image = UIImage(named: "8ball")
    }

    @IBAction func askButtonTapped(_ sender: Any) {
        let randomInt = Int.random(in: 0..<4)
        
        guard let image = answerImages[randomInt] else {
            print("No image found for random number: \(randomInt)")
            return
        }
        
        answerImageView.image = image
    }
    
}

