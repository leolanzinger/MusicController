//
//  ViewController.swift
//  MusicController
//
//  Created by Leonardo Lanzinger on 20/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var songLabel: UILabel!
    
    var mediaPlayer: MPMoviePlayerController = MPMoviePlayerController()
//    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    var playing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var previewUrl = "http://a1397.phobos.apple.com/us/r1000/118/Music/v4/d3/1c/a1/d31ca1b2-ad41-0011-a85e-f7c34b8897be/mzaf_1643522190305126374.aac.m4a"

//        var previewUrl = "http://a1397.phobos.apple.com/us/r1000/118/Music/v4/d3/1c/a1/d31ca1b2-ad41-0011-a85e-f7c34b8897be/mzaf_1643522190305126374.aac.m4a"

//        let soundFilePath:NSString = NSBundle.mainBundle().pathForResource("sound", ofType: "caf")!
//        let soundUrl:NSURL = NSURL
//        NSLog("music path", soundUrl)
        
//        audioPlayer.alloc().initWithContentsOfURL(soundUrl, error: nil)
        
        // music player
//        mediaPlayer.contentURL = NSURL(string: previewUrl)

        var rdfParser: RdfParser = RdfParser()
        // Do not parse rdf for now
        //rdfParser.parseRDFXML("/Users/Leo/Documents/XCODE/MusicController/MusicController/MusicPlayer.xml")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playStopMusic(sender: AnyObject) {
        if (playing) {
            mediaPlayer.pause()
            playing = false
            playButton.setTitle("Play", forState: UIControlState.Normal)
        }
        else {
            mediaPlayer.play()
            playing = true
            playButton.setTitle("Pause", forState: UIControlState.Normal)
        }
    }

}

