//
//  SoundHelper.swift
//  Xylophone
//
//  Created by mikewang on 2019/5/27.
//  Copyright © 2019 appsgaga. All rights reserved.
//

import Foundation
import AVFoundation

class SoundHelper {
    var audioMatrix:[AVAudioPlayer?] = [AVAudioPlayer?]()
    
    init() {
        for i in 0...7 {
            guard let path = Bundle.main.path(forResource: "\(i+1)", ofType: "mp3") else {
                audioMatrix.append(nil)
                return
            }
            
            let url = URL(fileURLWithPath: path)
            
            do {
                audioMatrix.append(try AVAudioPlayer(contentsOf: url))
            } catch {
                audioMatrix.append(nil)
            }
        }
    }
    
    func playSound(tag: Int) {
        audioMatrix[tag]?.stop()
        audioMatrix[tag]?.currentTime = 0.0
        audioMatrix[tag]?.play()
    }
    
}
