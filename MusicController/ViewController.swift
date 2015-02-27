//
//  ViewController.swift
//  MusicController
//
//  Created by Leonardo Lanzinger on 20/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // buttons
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var volumeUpButton: UIButton!
    @IBOutlet weak var volumeDownButton: UIButton!
    
    // labels
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    
    var playing = false
    
    // initialize classes for sound playing and gestures recognition
    var gestureRecognizer: GestureRecognizer = GestureRecognizer()
    let audioPlayer: Sound = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // start audio player
        audioPlayer.readFileIntoAVPlayer()
        
        // get current volume level
        volumeLabel.text = "\(audioPlayer.getVolume())"

        var rdfParser: RdfParser = RdfParser()
        // Do not parse rdf for now
        //rdfParser.parseRDFXML("/Users/Leo/Documents/XCODE/MusicController/MusicController/MusicPlayer.xml")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    IBActions to control music playback
    */
    @IBAction func playStopMusic(sender: AnyObject) {
        if (playing) {
            playing = false
            playButton.setTitle("Play", forState: UIControlState.Normal)
            audioPlayer.toggleAVPlayer()
        }
        else {
            playing = true
            playButton.setTitle("Pause", forState: UIControlState.Normal)
            audioPlayer.toggleAVPlayer()
        }
    }
    
    @IBAction func nextSong(sender: AnyObject) {
        audioPlayer.nextSong()
    }
    
    @IBAction func previousSong(sender: AnyObject) {
        audioPlayer.previousSong()
    }
    
    @IBAction func volumeUp(sender: AnyObject) {
        audioPlayer.volumeUp()
        volumeLabel.text = "\(audioPlayer.getVolume())"
    }
    
    @IBAction func volumeDown(sender: AnyObject) {
        audioPlayer.volumeDown()
        volumeLabel.text = "\(audioPlayer.getVolume())"
    }

}

