//
//  ViewController.swift
//  PlayAudio
//
//  Created by mikewang on 2019/5/25.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer?

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitAudioPlayer()
    }
    
    // MARK: - IBAction
    
    @IBAction func play(_ sender: UIButton) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = 0.0
        audioPlayer?.play()
    }
    
    // MARK: - Other Method
    private func InitAudioPlayer() {
        // v1.
        // find sound path
        //        if let path = Bundle.main.path(forResource: "Right", ofType: "mp3") {
        //            // path to url
        //            let url = URL(fileURLWithPath: path)
        //            // make an audio player
        //            do {
        //                audioPlayer = try AVAudioPlayer(contentsOf: url)
        //                audioPlayer?.enableRate = true
        //                //audioPlayer?.rate = 0.5
        //                audioPlayer?.numberOfLoops = 3
        //                audioPlayer?.volume = 0.3
        //
        //            } catch {
        //                print(error.localizedDescription)
        //            }
        //
        //        } else {
        //            print("no such file")
        //        }
        
        // v2.
        guard let newPath = Bundle.main.path(forResource: "Right", ofType: "mp3") else {
            print("no such path")
            return
        }
        
        do {
            let url = URL(fileURLWithPath: newPath)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            audioPlayer?.enableRate = true
            //audioPlayer?.rate = 0.5
            audioPlayer?.numberOfLoops = 3
            audioPlayer?.volume = 0.3
        } catch {
            print(error.localizedDescription)
        }
    }


}

