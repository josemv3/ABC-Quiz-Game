//
//  ViewController.swift
//  MiaQuizABC V4 Images
//
//  Created by Joey Rubin on 6/8/21.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainImageButton: UIButton!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var topButtonIV: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var abcQuizBrain = ABCQuizBrain()
    var audioPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topButton.layer.cornerRadius = 50
        topButton.layer.borderWidth = 6
        topButton.layer.borderColor = UIColor(red: 0.631, green: 0.792, blue: 0.886, alpha: 1.0).cgColor
        
        
        bottomButton.layer.cornerRadius = 50
        bottomButton.layer.borderWidth = 6
        bottomButton.layer.borderColor = UIColor(red: 0.631, green: 0.792, blue: 0.886, alpha: 1).cgColor
        
//        mainImage.layer.cornerRadius = 85
//        mainImage.layer.borderWidth = 3
//        mainImage.layer.borderColor = UIColor(red: 0.761, green: 0.690, blue: 0.573, alpha: 1.0).cgColor

        mainImageButton.layer.cornerRadius = 85
        updateUI()
    }
    
    @IBAction func mainImageButtonPressed(_ sender: UIButton) {
        //let currentImage = abcQuizBrain.getMainImage1()
        
        let image = 1
        
        if abcQuizBrain.currentImage == image - 1{
            mainImageButton.setImage(UIImage(named: abcQuizBrain.getMainImage2() + ".png" )?.withRenderingMode(.alwaysOriginal), for: .normal)
            playSound(soundName: abcQuizBrain.getMainAudio2())
            abcQuizBrain.currentImage += 1
            
        }
        else if abcQuizBrain.currentImage == image  {
            mainImageButton.setImage(UIImage(named: abcQuizBrain.getMainImage3() + ".png" )?.withRenderingMode(.alwaysOriginal), for: .normal)
            playSound(soundName: abcQuizBrain.getMainAudio3())
            abcQuizBrain.currentImage += 1
            
        }
        else {
            mainImageButton.setImage(UIImage(named: abcQuizBrain.getMainImage1() + ".png" )?.withRenderingMode(.alwaysOriginal), for: .normal)
            playSound(soundName: abcQuizBrain.getMainAudio1())
            abcQuizBrain.currentImage = 0
            
        }
        print(abcQuizBrain.currentImage)
        print(image)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight  = abcQuizBrain.checkAnswer(userAnswer)
            
        audioPlayer?.stop()
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            let systemSoundID: SystemSoundID = 1002
            AudioServicesPlaySystemSound (systemSoundID)
            abcQuizBrain.nextQuestion()
        } else {
            sender.backgroundColor = UIColor.red
            let systemSoundID: SystemSoundID = 1006
            AudioServicesPlaySystemSound (systemSoundID)
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI () {
        topButton.backgroundColor = UIColor.clear
        topButton.setImage(UIImage(named: abcQuizBrain.getTopButtonImage())?.withRenderingMode(.alwaysOriginal), for: .normal)
        topButton.setTitle(abcQuizBrain.getTopButtonImage(), for: .normal)
        bottomButton.backgroundColor = UIColor.clear
        bottomButton.setImage(UIImage(named: abcQuizBrain.getBottomButtonImage())?.withRenderingMode(.alwaysOriginal), for: .normal)
        bottomButton.setTitle(abcQuizBrain.getBottomButtonImage(), for: .normal)
        mainImageButton.setImage(UIImage(named: abcQuizBrain.getMainImage1() + ".png" )?.withRenderingMode(.alwaysOriginal), for: .normal)
        playSound(soundName: abcQuizBrain.getMainAudio1())
        progressBar.progress = abcQuizBrain.getProgress()
    }

    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer!.play()
        
    }
}


