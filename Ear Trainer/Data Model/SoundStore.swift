//
//  SoundStore.swift
//  Ear Trainer
//
//  Created by John Jones on 8/12/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import Foundation

class SoundStore {
    
    // Chords
    let cMaj = Chord(chordType: "Major", name: "Cmaj")
    let cMajSep = Chord(chordType: "Major", name: "cMajSep")
    let gMaj = Chord(chordType: "Major", name: "Gmaj")
    let gMajSep = Chord(chordType: "Major", name: "gMajSep")
    let eMaj = Chord(chordType: "Major", name: "Emaj")
    let eMajSep = Chord(chordType: "Major", name: "eMajSep")
    let am = Chord(chordType: "Minor", name: "Am")
    let amSep = Chord(chordType: "Minor", name: "AmSep")
    let dm = Chord(chordType: "Minor", name: "Dm")
    let dmSep = Chord(chordType: "Minor", name: "DmSep")
    let fm = Chord(chordType: "Minor", name: "Fm")
    let fmSep = Chord(chordType: "Minor", name: "fmSep")
    let cDim = Chord(chordType: "Diminished", name: "cDim")
    let cDimSep = Chord(chordType: "Diminished", name: "cDimSep")
    let dDim = Chord(chordType: "Diminished", name: "dDim")
    let dDimSep = Chord(chordType: "Diminished", name: "dDimSep")
    let fDim = Chord(chordType: "Diminished", name: "fDim")
    let fDimSep = Chord(chordType: "Diminished", name: "fDimSep")
    let cAug = Chord(chordType: "Augmented", name: "cAug")
    let cAugSep = Chord(chordType: "Augmented", name: "cAugSep")
    let eAug = Chord(chordType: "Augmented", name: "eAug")
    let eAugSep = Chord(chordType: "Augmented", name: "eAugSep")
    let gAug = Chord(chordType: "Augmented", name: "gAug")
    let gAugSep = Chord(chordType: "Augmented", name: "gAugSep")
    
    // Keys
    let cKey = Key(named: "C")
    let dKey = Key(named: "D")
    let bKey = Key(named: "B")
    let fKey = Key(named: "F")
    
    // Major Chord Progressions
    let majIIVIIV = ChordProgression(named: "I-IV-ii-V")
    let majIiiiIVV = ChordProgression(named: "I-iii-IV-V")
    let majIIVIV = ChordProgression(named: "I-IV-I-V")
    let majIviIVV = ChordProgression(named: "I-vi-IV-V")
    // Minor Chord Progressions
    let miivi = ChordProgression(named: "i-iv-i")
    let miivvi = ChordProgression(named: "i-iv-v-i")
    let miivv = ChordProgression(named: "i-iv-v")
    let miivi2 = ChordProgression(named: "ii-v-i")
    
    // Intervals
    let majorThird = Interval(intervalType: "Major 3rd", name: "majorThird")
    let majorSecond = Interval(intervalType: "Major 2nd", name: "majSecond")
    let minorThird = Interval(intervalType: "Minor 3rd", name: "minorThird")
    let perfectFourth = Interval(intervalType: "Perfect 4th", name: "perfectFourth")
    
    
    
    private(set) var majors: [Sound]
    private(set) var minors: [Sound]
    private(set) var dims: [Sound]
    private(set) var augs: [Sound]
    private(set) var allChords: [Sound]
    
    private(set) var allKeys: [Sound]
    
    private(set) var majorProgressions: [Sound]
    private(set) var minorProgressions: [Sound]
    private(set) var allProgressions: [Sound]
    
    private(set) var allIntervals: [Sound]
    
    init() {
        self.majors = [cMaj, gMaj, eMaj]
        self.minors = [am, dm, fm]
        self.dims = [cDim, dDim, fDim]
        self.augs = [cAug, eAug, gAug]
        self.allChords = [cMaj, gMaj, eMaj, am, dm, fm, cDim, dDim, fDim, cAug, eAug, gAug]
        self.allKeys = [cKey, dKey, bKey, fKey]
        self.majorProgressions = [majIIVIIV, majIiiiIVV, majIIVIV, majIviIVV]
        self.minorProgressions = [miivi, miivvi, miivv, miivi2]
        self.allProgressions = [majIIVIIV, majIiiiIVV, majIIVIV, majIviIVV, miivi, miivvi, miivv, miivi2]
        self.allIntervals = [majorThird, majorSecond, minorThird, perfectFourth]
    }
}
