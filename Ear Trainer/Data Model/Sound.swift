//
//  Sound.swift
//  Ear Trainer
//
//  Created by John Jones on 8/12/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import Foundation
import AVFoundation

class Sound {
    
    private var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    private var title = ""
    private var keyName = ""
    
    public init(named name: String) {
        if let soundURL = Bundle.main.path(forResource: name, ofType: "mp3") {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundURL) as URL)
            } catch let error as NSError {
                print(error.debugDescription)
            }
        } else {
            print(name + " does not work")
        }
        
        title = name
    }
    
    public func getTitle() -> String {
        return title
    }
    
    public func getName() -> String {
        return keyName
    }
    
    public func play() {
        audioPlayer.play()
    }
    
    public func stop() {
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0;
    }
}


class Chord: Sound {
    private var chordType = ""
    init(chordType: String, name: String) {
        self.chordType = chordType
        super.init(named: name)
    }
}

class Key: Sound {
    override init(named name: String) {
        super.init(named: name)
    }
}

class ChordProgression: Sound {
    override init(named name: String) {
        super.init(named: name)
    }
}

class Interval: Sound {
    private var intervalType = ""
    init(intervalType: String, name: String) {
        self.intervalType = intervalType
        super.init(named: name)
    }
}
