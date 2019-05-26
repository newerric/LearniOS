//
//  ViewController.swift
//  RecordAudio
//
//  Created by mikewang on 2019/5/25.
//  Copyright © 2019 mike. All rights reserved.
//

import UIKit
import AVFoundation

enum AudioSessionMode {
    case record
    case play
}

class ViewController: UIViewController, AVAudioRecorderDelegate {
    
    var recordHelper: RecordHelper?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordHelper = RecordHelper()
    }
    
    // MARK: - IBAction
    @IBAction func recordAudio(_ sender: UIButton) {
        recordHelper?.recordAudio()
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        recordHelper?.stopRecording()
    }
    
    @IBAction func playRecordedSound(_ sender: UIButton) {
        recordHelper?.playRecordedSound()
    }
    
    @IBAction func stopPlaying(_ sender: UIButton) {
        recordHelper?.stopPlaying()
    }
    
    // MARK: - Other method
    
}

