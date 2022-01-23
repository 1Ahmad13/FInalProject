//
//  ViewController.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func playLocalVideo() {

            guard let path = Bundle.main.path(forResource: "cryptoVideo", ofType: "mp4") else {
                return
            }
            let videoURL = NSURL(fileURLWithPath: path)

            // Create an AVPlayer, passing it the local video url path
            let player = AVPlayer(url: videoURL as URL)
            let controller = AVPlayerViewController()
            controller.player = player
            present(controller, animated: true) {
                player.play()
            }
        }
    
    @IBAction func video1(_ sender: UIButton) {
        let opa = sender.alpha
        sender.alpha = opa/2
        //Code should execute after 0.2 second delay.
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              //Bring's sender's opacity back up to fully opaque.
              sender.alpha = 1.0
          }
        playLocalVideo()
    }
    
    @IBAction func home1(_ sender: UIButton) {
    }
    
    @IBAction func currency1(_ sender: UIButton) {
        self.performSegue(withIdentifier: "homeToCurrency", sender: self)
    }
    
    @IBAction func game1(_ sender: UIButton) {
        self.performSegue(withIdentifier: "homeToGame", sender: self)
    }
    
    @IBAction func crypto1(_ sender: UIButton) {
        self.performSegue(withIdentifier: "homeToCrypto", sender: self)
    }
    
}

