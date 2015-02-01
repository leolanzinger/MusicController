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
    
    let audioPlayer: Sound = Sound()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer.readFileIntoAVPlayer()
        audioPlayer.stopAVPLayer()

        var rdfParser: RdfParser = RdfParser()
        // Do not parse rdf for now
        //rdfParser.parseRDFXML("/Users/Leo/Documents/XCODE/MusicController/MusicController/MusicPlayer.xml")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playStopMusic(sender: AnyObject) {
        var playing:Bool = audioPlayer.toggleAVPlayer()
        if (playing) {
            playButton.setTitle("Pause", forState: UIControlState.Normal)
        }
        else {
            playButton.setTitle("Play", forState: UIControlState.Normal)
        }
    }

}

