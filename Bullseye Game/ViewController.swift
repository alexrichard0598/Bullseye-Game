//
//  ViewController.swift
//  Bullseye Game
//
//  Created by user183240 on 1/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectedVal = Int(targetSlider.value)
        bullseyeImage.alpha = 0
    }
    
    @IBOutlet weak var targetSlider: UISlider!
    var selectedVal: Int = 0
    var numPoints: Int = 0
    @IBOutlet weak var pointsLable: UILabel!
    @IBOutlet weak var bullseyeImage: UIImageView!
    @IBOutlet weak var displayMsg: UILabel!
    
    @IBAction func ChangedTarget(_ sender: UISlider) {
        selectedVal = Int(sender.value)
        displayMsg.text = String(selectedVal)
    }
   
    @IBAction func Hit(_ sender: Any) {
        bullseyeImage.alpha = 0
        
        let num = Int.random(in: 1..<11)
        if(num == selectedVal) {
            bullseyeImage.alpha = 1
            displayMsg.text = "BULLSEYE!!!"
            numPoints += 2
            if(numPoints == 10) {
                numPoints = 0
            }
            pointsLable.text = String(numPoints)
        } else {
            displayMsg.text = "SORRY! Better Luck Next Time"
        }
    }
    
    @IBAction func Reset(_ sender: Any) {
        numPoints = 0
        pointsLable.text = String(numPoints)
        bullseyeImage.alpha = 0
        targetSlider.value = 5
        selectedVal = Int(targetSlider.value)
        displayMsg.text = "Press 'hit It' to Play"
    }
}

