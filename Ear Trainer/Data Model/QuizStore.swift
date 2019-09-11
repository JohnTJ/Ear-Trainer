//
//  QuizStore.swift
//  Ear Trainer
//
//  Created by John Jones on 8/12/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import Foundation

class QuizStore {
    
    var soundStore = SoundStore()
    
    private(set) var chords: Quiz
    private(set) var toneMatch: Quiz
    private(set) var chordProgressions: Quiz
    private(set) var intervals: Quiz
    
    let quizzes: [Quiz]
    
    init() {
        chords = Quiz(title: "Chords", description: "Chords will play a variety of chord types (Major, Minor, Augmented, Diminished) and quiz you on your ability to tell the difference.", media: [soundStore.allChords, soundStore.majors, soundStore.minors, soundStore.augs, soundStore.dims])
        toneMatch = Quiz(title: "Tone Match", description: "Tone Match will play a variety of tones. Test if you have perfect pitch.", media: [soundStore.allKeys])
        chordProgressions = Quiz(title: "Chord Progressions", description: "Chord Progressions will play a series of chords and quiz you on your ability to tell which progression is played", media: [soundStore.allProgressions, soundStore.majorProgressions, soundStore.minorProgressions])
        intervals = Quiz(title: "Intervals", description: "Intervals will play two notes seperated by a number of semitones. Guess the correct interval.", media: [soundStore.allIntervals])
        quizzes = [chords, toneMatch, chordProgressions, intervals]
    }
}
