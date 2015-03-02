//
//  ViewController.swift
//  MusicController
//
//  Created by Leonardo Lanzinger on 20/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

import UIKit
import AVFoundation

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
    
    // images
    let pause_image = UIImage(named: "pause.png") as UIImage?
    let play_image = UIImage(named: "play126.png") as UIImage?
    
    // switches
    @IBOutlet weak var speechSwitch: UISwitch!
    @IBOutlet weak var accelerometerSwitch: UISwitch!
    @IBOutlet weak var touchSwitch: UISwitch!
    
    // helper variables
    var playing = false
    var speech = false
    var accelerometer = false
    var touch = false
    var buttonsArray = [UIButton]()
    
    // speech feedback
    let synth = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance(string: "")
    
    // initialize classes for sound playing and gestures recognition
    let audioPlayer: Sound = Sound()
    var gestureRecognizer: GestureRecognizer = GestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gestureRecognizer.addViewController(self);
        
        // initialize switches to off status
        speechSwitch.setOn(false, animated: true)
        accelerometerSwitch.setOn(false, animated: true)
        touchSwitch.setOn(false, animated: true)
        
        // start audio player
        audioPlayer.readFileIntoAVPlayer()
        
        // get current volume level
        volumeLabel.text = "\(audioPlayer.getVolume())"
        
        // get current track title
        songLabel.text = audioPlayer.getTrack()
        
        // initialize notification center to get acccelerometer feedback
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceive:", name: "ViewControllerNotification", object: nil)
        
        // put buttons in an array
        buttonsArray += [playButton, nextButton, previousButton, volumeUpButton, volumeDownButton]
        
    // disable touch interaction
        disableTouch()
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
    
    @IBAction func toggleSpeech(sender: AnyObject) {
        toggleSpeechController()
    }
    
    @IBAction func toggleAccelerometer(sender: AnyObject) {
        toggleAccelerometerController()
    }
    
    @IBAction func toggleTouch(sender: AnyObject) {
        toggleTouchController()
    }
    
    /**
    Functions to control music playback
    */
    func togglePlayback() {
        if (playing) {
            playing = false
            playButton.setImage(play_image, forState: .Normal)
            audioPlayer.toggleAVPlayer()
            speak("Pause music")
        }
        else {
            playing = true
            playButton.setImage(pause_image, forState: .Normal)
            audioPlayer.toggleAVPlayer()
            speak("Play music")
        }
    }
    
    func nextSongController() {
        audioPlayer.nextSong()
        // get current track title
        songLabel.text = audioPlayer.getTrack()
        speak("Next song")
    }
    
    func previousSongController() {
        audioPlayer.previousSong()
        // get current track title
        songLabel.text = audioPlayer.getTrack()
        speak("Previous song")
    }
    
    func volumeUpController() {
        if (audioPlayer.getVolume() <= 0.9) {
            speak("Increased volume")
        }
        else {
            speak("Maximum volume level")
        }
        audioPlayer.volumeUp()
        volumeLabel.text = "\(audioPlayer.getVolume())"
    }
    
    func volumeDownController() {
        if (audioPlayer.getVolume() >= 0.1) {
            speak("Decreased volume")
        }
        else {
            speak("Minimum volume level")
        }
        audioPlayer.volumeDown()
        volumeLabel.text = "\(audioPlayer.getVolume())"
    }
    
    func toggleSpeechController() {
        if (speech) {
            speak("Speech feedback disabled")
            speech = false
        }
        else {
            speech = true
            speak("Speech feedback enabled")
        }
    }
    
    func toggleAccelerometerController() {
        if (accelerometer) {
            accelerometer = false
            speak("Accelerometer gestures disabled")
        }
        else {
            accelerometer = true
            speak("Accelerometer gestures enabled")
        }
    }
    
    func toggleTouchController() {
        if (touch) {
            touch = false
            disableTouch()
            speak("Touch gestures disabled")
        }
        else {
            touch = true
            enableTouch()
            speak("Touch gestures enabled")
        }
    }
    
    func disableTouch() {
        for button in buttonsArray {
            button.userInteractionEnabled = false
        }
    }
    
    func enableTouch() {
        for button in buttonsArray {
            button.userInteractionEnabled = true
        }
    }
    
    func speak(message: String) {
        if (speech) {
            utterance = AVSpeechUtterance(string: message)
            utterance.rate = 0.1
            synth.speakUtterance(utterance)
        }
    }
}

