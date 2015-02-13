//
//  Sound.swift
//  MusicController
//
//  Created by Leonardo Lanzinger on 28/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

import UIKit
import AVFoundation

class SoundPlayer : NSObject {
    
    /// The player.
    var avPlayer:AVAudioPlayer!
    
    /**
    Uses AvAudioPlayer to play a sound file.
    The player instance needs to be an instance variable. Otherwise it will disappear before playing.
    */
    func readFileIntoAVPlayer() {
        
        var error: NSError?
        let fileURL:NSURL = NSBundle.mainBundle().URLForResource("time", withExtension: "mp3")!
        
        self.avPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: &error)
        if avPlayer == nil {
            if let e = error {
                println(e.localizedDescription)
            }
        }
        
        println("playing \(fileURL)")
        avPlayer.delegate = self
        avPlayer.prepareToPlay()
        avPlayer.volume = 1.0
        avPlayer.play()
    }
    
    func stopAVPLayer() {
        if avPlayer.playing {
            avPlayer.stop()
        }
    }
    
    func toggleAVPlayer() -> Bool {
        if avPlayer.playing {
            avPlayer.pause()
            return false
        } else {
            avPlayer.play()
            return true
        }
    }
}

// MARK: AVAudioPlayerDelegate
extension SoundPlayer : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        println("finished playing \(flag)")
    }
    
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        println("\(error.localizedDescription)")
    }
    
}