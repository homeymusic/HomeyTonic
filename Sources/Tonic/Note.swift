import Foundation

struct Note {

    /// MIDI Note 0-127 starting at C
    var noteNumber: Int8

    /// Semitone shift for accidental to distinguish defferent spelling of the note.
    var accidental: Accidental = .natural

    /// The way the note is described in a musical context (usually a key or scale)
    var spelling: String {
        let whiteKeyNoteNumber = noteNumber - accidental.rawValue

        let letters: [Letter?] = [.C, nil, .D, nil, .E, .F, nil, .G, nil, .A, nil, .B]
        let letter = letters[Int(whiteKeyNoteNumber % 12)]
        if accidental == .natural && letter == nil {
            let newLetter = letters[Int(whiteKeyNoteNumber % 12) - 1]
            return "\(newLetter!)\(Accidental.sharp)"
        }
        guard let letter = letter else { fatalError() }

        return "\(letter)\(accidental)"
    }
}
