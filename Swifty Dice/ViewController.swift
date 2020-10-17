//
//  ViewController.swift
//  Swifty Dice
//
//  Created by Carson Kelley on 10/13/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView: UIImageView!
    @IBOutlet var criticalLabel: UILabel!
    
    var rollPlayer: AVAudioPlayer = AVAudioPlayer()
    var hitPlayer: AVAudioPlayer = AVAudioPlayer()
    var missPlayer: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let roll = Bundle.main.path(forResource: "diceroll", ofType: "wav")
        let hit = Bundle.main.path(forResource: "criticalhit", ofType: "mp3")
        let miss = Bundle.main.path(forResource: "criticalmiss", ofType: "mp3")
        
        do{
            try rollPlayer = AVAudioPlayer(contentsOf: URL (fileURLWithPath: roll!))
            try hitPlayer = AVAudioPlayer(contentsOf: URL (fileURLWithPath: hit!))
            try missPlayer = AVAudioPlayer(contentsOf: URL (fileURLWithPath: miss!))
        }
        catch{
            print(error)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGotPressed(){
        rollDice()
    }
    
    func rollDice(){
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if(imageName == "d1"){
            criticalLabel.text = "Critical Miss! #Oof"
            missPlayer.play()
        } else if(imageName == "d20"){
            criticalLabel.text = "Critical Hit! It's Your Lucky Day!"
            hitPlayer.play()
        } else{
            criticalLabel.text = ""
            rollPlayer.play()
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }


}

