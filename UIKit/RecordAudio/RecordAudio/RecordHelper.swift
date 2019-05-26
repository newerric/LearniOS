//
//  RecordHelper.swift
//  RecordAudio
//
//  Created by mikewang on 2019/5/26.
//  Copyright © 2019 mike. All rights reserved.
//

import Foundation
import AVFoundation

class RecordHelper: NSObject, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder?
    var audioPlayer: AVAudioPlayer?
    var isRecording = false
        
    override init() {
        super.init()
        
        // init an audio recorder
        let fileName = "User.wav"
        let path = NSHomeDirectory() + "/Documents/" + fileName
        let url = URL(fileURLWithPath: path)
        
        let recordSettings:[String:Any] = [
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
            AVEncoderBitRateKey: 16,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: url, settings: recordSettings)
            audioRecorder?.delegate = self
        } catch {
            print(error)
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag == true {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: recorder.url)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func settingAudioSession(thMode mode:AudioSessionMode) {
        
        audioPlayer?.stop()
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            switch mode {
            case .record:
                try session.setCategory(AVAudioSession.Category.playAndRecord)
            case .play:
                try session.setCategory(AVAudioSession.Category.playback)
            }
            
            try session.setActive(false)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recordAudio() {
        settingAudioSession(thMode: .record)
        audioRecorder?.prepareToRecord()
        audioRecorder?.record()
        isRecording = true
    }
    
    func stopRecording() {
        if audioRecorder != nil {
            audioRecorder?.stop()
            isRecording = false
            settingAudioSession(thMode: .play)
        }
    }
    
    func playRecordedSound() {
        if isRecording == false {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
            audioPlayer?.play()
        }
    }
    
    func stopPlaying() {
        if isRecording == false {
            audioPlayer?.stop()
            audioPlayer?.currentTime = 0.0
        }
    }
    
}
