//
//  GameViewController.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import UIKit
import Foundation
import AVKit

class GameViewController: UIViewController {

    var gameBrain = Game()
    
    var questionNumber = 0
    var count = 0
    var totalScore = 0
    var timer1 = Timer()
    var timer2 = Timer()
    var Time = 6
    var seconds = 0
    
    
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var questionLabel1: UILabel!
    @IBOutlet weak var playButton1: UIButton!
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var playAgain1: UIButton!
    @IBOutlet weak var timerLabel1: UILabel!
    @IBOutlet weak var bar1: UIProgressView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        questionLabel1.text = "                                 Rules \n1. If answer is correct, score will be increased by $100\n2. If wrong will be decreased by $50\n3. 5 seconds to answer each question \n4. If answer is delayed the answer will be treated as wrong\n"
        Answer1.isEnabled = false
        Answer2.isEnabled = false
        playAgain1.isHidden = true
        timerLabel1.isHidden = true
        
    }
    
    var audio:AVPlayer!
    
    func playSound() {
        // need to declare local path as url
        let url = Bundle.main.url(forResource: "Jeopardy-theme-song", withExtension: "mp3")
        // now use declared path 'url' to initialize the player
        audio = AVPlayer.init(url: url!)
        // after initialization play audio its just like click on play button
        audio.play()
    }
    
    func stopSound() {
        audio.pause()
    }
    
    func Start()
    {
        playSound()
        playButton1.isHidden = true
        Answer1.isEnabled = true
        Answer2.isEnabled = true
        playAgain1.isHidden = true
        timerLabel1.isHidden = false
        
        timer1.invalidate()
        timer2.invalidate()
        seconds = 0
        questionNumber = 0
        totalScore = 0
        count = 0
        bar1.progress = 0
        scoreLabel1.text = "$0"
        questionLabel1.text = gameBrain.getQuestionText()
        timer1 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer2), userInfo: nil, repeats: true)
    }
    
    func finish()
    {
        switch count{
        case 5:
            questionLabel1.text = "Congratulations! You got a perfect Score!\n Score: \(totalScore)"
        case 4:
            questionLabel1.text = "Well done! You got 4 out of 5 questions correctly\n Score: \(totalScore)"
        case 3:
            questionLabel1.text = "3 out of 5 Good Job\n Score: \(totalScore)"
        case 2:
            questionLabel1.text = "2 out of 5 Good Luck next time\n Score: \(totalScore)"
        case 1:
            questionLabel1.text = "1 out of 5 Study More\n Score: \(totalScore)"
        case 0:
            questionLabel1.text = "0 out 5 (STUDY STUDY STUDY)\n Score: \(totalScore)"
        default:
            print("Error")
        }
        playAgain1.isHidden = false
        Answer1.isEnabled = false
        Answer2.isEnabled = false
        timerLabel1.isHidden = true
    }
    
    @IBAction func platPressed1(_ sender: UIButton) {
        Start()
    }
    
    @IBAction func playAgainPressed1(_ sender: UIButton) {
        Start()
    }
    
    @IBAction func answer1Or2(_ sender: UIButton) {
        timer1.invalidate()
        timer2.invalidate()
        seconds = 0
        
        let userAnswer = sender.currentTitle!
        
        let userRight = gameBrain.checkAnswer(userAnswer: userAnswer)
        
        if userRight {
            sender.backgroundColor = UIColor.green
            totalScore += 100
            count += 1
            bar1.progress = Float(count) / Float(5)
        } else {
//            print(sender.currentTitle)
            // set button to default
            sender.backgroundColor = UIColor.red
            totalScore -= 50
        }
        
        gameBrain.nextQuestion()
        
        timer1 = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer2), userInfo: nil, repeats: true)
        
        questionNumber = (questionNumber + 1) % 5
        questionLabel1.text = gameBrain.getQuestionText()
        
        
        if (questionNumber == 0) {
            finish()
            timer2.invalidate()
            timerLabel1.text = "0"
        }
    }
    
    @objc func updateTimer()
    {
        let answerChoices = gameBrain.getAnswers()
        Answer1.setTitle(answerChoices[0], for: .normal)
        Answer2.setTitle(answerChoices[1], for: .normal)
        
        scoreLabel1.text = "Score: $\(totalScore)"
        Answer1.backgroundColor = UIColor.clear
        Answer2.backgroundColor = UIColor.clear
    }

    @objc func updateTimer2(){
        if seconds < Time {
            timerLabel1.text = "\(seconds)"
            seconds += 1
        } else if seconds == 6 {
            if (questionNumber == 4) {
                totalScore -= 50
                finish()
                timer2.invalidate()
                timerLabel1.text = "0"
            } else {
                totalScore -= 50
                questionNumber = (questionNumber + 1) % 5
                questionLabel1.text = gameBrain.getQuestionText()
                seconds = 0
            }
        } else {
            totalScore -= 50
            questionNumber = (questionNumber + 1) % 5
            questionLabel1.text = gameBrain.getQuestionText()
            seconds = 0
        }
    }
    
    
    @IBAction func homr3(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gameToHome", sender: self)
        playSound()
        stopSound()
    }
    
    @IBAction func currency3(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gameToCurrency", sender: self)
        playSound()
        stopSound()
    }
    
    @IBAction func game3(_ sender: UIButton) {
        playSound()
        stopSound()
    }
    
    @IBAction func crypto3(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gameToCrypto", sender: self)
        playSound()
        stopSound()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
