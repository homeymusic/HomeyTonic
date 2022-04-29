
import Foundation

/// Chord addresses all possible combinations of simultaneous MIDI notes.
struct Chord {

    // Since we don't have a UInt128, we use two UInt64s.
    var highNotes: UInt64 = 0
    var lowNotes: UInt64 = 0

    var noteCount: Int {
        lowNotes.nonzeroBitCount + highNotes.nonzeroBitCount
    }

    var isDyad: Bool {
        noteCount == 2
    }

    var isTriad: Bool {
        noteCount == 3
    }

    var notes: [Note] {
        var r: [Note] = []
        for root in 0..<128 {
            let n = Note(noteNumber: Int8(root))
            if contains(note: n) {
                r.append(n)
            }
        }
        return r
    }

    /// Add a note to a chord.
    mutating func add(note: Note) {
        if note.noteNumber < 64 {
            lowNotes |= 1 << note.noteNumber
        } else {
            highNotes |= 1 << (note.noteNumber - 64)
        }
    }

    /// Is a note in a chord?
    func contains(note: Note) -> Bool {
        if note.noteNumber < 64 {
            return (lowNotes & (1 << note.noteNumber)) != 0
        } else {
            return (highNotes & (1 << (note.noteNumber - 64))) != 0
        }
    }

    mutating func shift(semitones: Int) {
        if semitones > 0 {
            highNotes <<= semitones
            // How many do we have to copy from low to high?
            let lowToHigh = (lowNotes << (64 - semitones)) & ((1 << semitones) - 1)
            highNotes |= lowToHigh
            lowNotes <<= semitones
        }
    }
}

func generateTriads() -> [Chord] {

    var chords: [Chord] = []
    for root in 0..<127 {
        if root + 7 >= 127 {
            continue
        }
        for third in [3, 4] {
            var chord = Chord()
            chord.add(note: Note(noteNumber: Int8(root)))
            chord.add(note: Note(noteNumber: Int8(root + third)))
            chord.add(note: Note(noteNumber: Int8(root + 7)))
            chords.append(chord)
        }
    }
    return chords
}
