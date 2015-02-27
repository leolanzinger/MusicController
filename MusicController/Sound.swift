//
//  Sound.swift
//  MusicController
//
//  Created by Leonardo Lanzinger on 28/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

import UIKit
import AVFoundation

class Sound : NSObject {
    
    var avPlayer:AVAudioPlayer!
    var indexPlayer:Int = 0
    var soundsArray = [NSURL]()
    
    /**
    Uses AvAudioPlayer to play a sound file.
    The player instance needs to be an instance variable. Otherwise it will disappear before playing.
    */
    func readFileIntoAVPlayer() {
        
        var error: NSError?
        
        // Get the URL of each mp3 sound file
        let fileURL_1 = NSBundle.mainBundle().URLForResource("01-eclipse", withExtension: "mp3")!
        let fileURL_2 = NSBundle.mainBundle().URLForResource("02-braindamage", withExtension: "mp3")!
        let fileURL_3 = NSBundle.mainBundle().URLForResource("03-morning", withExtension: "mp3")!
        
        // put them into the array
        soundsArray += [fileURL_1, fileURL_2, fileURL_3]
        
        // the player must be a field. Otherwise it will be released before playing starts.
        self.avPlayer = AVAudioPlayer(contentsOfURL: soundsArray[indexPlayer], error: &error)
        if avPlayer == nil {
            if let e = error {
                println(e.localizedDescription)
            }
        }
        
        // add delegate and set volume to 1.0
        avPlayer.delegate = self
        avPlayer.prepareToPlay()
        avPlayer.volume = 0.5
    }
    
    func getVolume() -> Float {
        return avPlayer.volume
    }
    
    func stopAVPLayer() {
        if avPlayer.playing {
            avPlayer.stop()
        }
    }
    
    /**
    Play or pause sound depending on playback
    */
    func toggleAVPlayer() {
        if avPlayer.playing {
            avPlayer.pause()
        } else {
            avPlayer.play()
        }
    }
    
    /**
    Move to next track in array
    */
    func nextSong() {
        
        //little tweak to continue playing
        var playing:Bool = false
        if avPlayer.playing {
            playing = true
        }
        avPlayer.pause()
        
        var error: NSError?
        
        // increase counter and recount index
        indexPlayer = (indexPlayer + 1) % soundsArray.count
        avPlayer = AVAudioPlayer(contentsOfURL: soundsArray[indexPlayer], error: &error)
        avPlayer.delegate = self
        
        // continue playing if sound is playing
        if playing {
            avPlayer.play()
        }
    }
    
    /**
    Move back to previous track in array
    */
    func previousSong() {
        
        //little tweak to continue playing
        var playing:Bool = false
        if avPlayer.playing {
            playing = true
        }
        avPlayer.pause()
        
        var error: NSError?
        
        // decrease counter and recount index
        indexPlayer = ((indexPlayer + soundsArray.count) - 1) % soundsArray.count
        avPlayer = AVAudioPlayer(contentsOfURL: soundsArray[indexPlayer], error: &error)
        avPlayer.delegate = self
        
        // continue playing if sound is playing
        if playing {
            avPlayer.play()
        }
    }
    
    /**
    Increase volume
    */
    func volumeUp() {
        if (getVolume() < 1) {
            avPlayer.volume += 0.1
        }
    }
    
    /**
    Decrease volume
    */
    func volumeDown() {
        if (getVolume() > 0) {
            // little tweak to avoid getting a 0.0001 volume level
            if (getVolume() < 0.2) {
                avPlayer.volume = 0
            }
            // normal behavior
            else {
                avPlayer.volume -= 0.1
            }
        }
    }
}

/**
AVAudioPlayerDelegate
*/
extension Sound : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        println("finished playing \(flag)")
    }
    
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!, error: NSError!) {
        println("\(error.localizedDescription)")
    }
    
}