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
    let audioPlayer: Sound = Sound()
    var gestureRecognizer: GestureRecognizer = GestureRecognizer()
    
    // images
    let pause_image = UIImage(named: "pause52.png") as UIImage?
    let play_image = UIImage(named: "play128.png") as UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // start audio player
        audioPlayer.readFileIntoAVPlayer()
        
        // get current volume level
        volumeLabel.text = "\(audioPlayer.getVolume())"
        
        // get current track title
        songLabel.text = audioPlayer.getTrack()

        var rdfParser: RdfParser = RdfParser()
        // Do not parse rdf for now
        //rdfParser.parseRDFXML("/Users/Leo/Documents/XCODE/MusicController/MusicController/MusicPlayer.xml")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceive:", name: "ViewControllerNotification", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
    IBActions to control music playback
    */
    // Set "play" or "pause" label depending on the state of the playback
    @IBAction func playStopMusic(sender: AnyObject) {
        togglePlayback()
    }
    
    @IBAction func nextSong(sender: AnyObject) {
        nextSongController()
    }
    
    @IBAction func previousSong(sender: AnyObject) {
        previousSongController()
    }
    
    @IBAction func volumeUp(sender: AnyObject) {
        volumeUpController()
    }

    @IBAction func volumeDown(sender: AnyObject) {
        volumeDownController()
    }
    
    /**
    Functions to control music playback
    */
    func togglePlayback() {
        if (playing) {
            playing = false
            playButton.setImage(play_image, forState: .Normal)
            audioPlayer.toggleAVPlayer()
        }
        else {
            playing = true
            playButton.setImage(pause_image, forState: .Normal)
            audioPlayer.toggleAVPlayer()
        }
    }
    
    func nextSongController() {
        audioPlayer.nextSong()
        // get current track title
        songLabel.text = audioPlayer.getTrack()
    }
    
    func previousSongController() {
        audioPlayer.previousSong()
        // get current track title
        songLabel.text = audioPlayer.getTrack()
    }
    
    func volumeUpController() {
        audioPlayer.volumeUp()
        volumeLabel.text = "\(audioPlayer.getVolume())"
    }
    
    func volumeDownController() {
        audioPlayer.volumeDown()
        volumeLabel.text = "\(audioPlayer.getVolume())"
    }
    
    func didReceive(userData:NSDictionary){
        //        let data = userData["userInfo"]
//        let number = userData["index"]
        println("received from viewController \(number)")
    }
}

