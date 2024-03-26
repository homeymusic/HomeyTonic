/// Intervals represented as symbols

import SwiftUI

let goldenRatio: CGFloat = (1.0 + sqrt(5)) / 2

public struct IntervalSymbol {
    
    /// Brian McAuliff Mulloy 2023, International Conference on Music Perception and Cognition (ICMPC)
    public static var homey: [any Shape] {
        [NitterHouse(), Circle(), Circle(), NitterDiamond(), NitterDiamond(), NitterTent(), Circle(), NitterTent(), NitterDiamond(), NitterDiamond(), Circle(), Circle()]
    }
    
}

public struct IntervalSymbolSize {
    public static var homey: [CGFloat] {
        let home = -1.9
        let tent = -2.1
        let diamond = -2.3
        let circle = -2.5
        
        return [pow(goldenRatio, home), pow(goldenRatio, circle), pow(goldenRatio, circle), pow(goldenRatio, diamond), pow(goldenRatio, diamond), pow(goldenRatio, tent), pow(goldenRatio, circle), pow(goldenRatio, tent), pow(goldenRatio, diamond), pow(goldenRatio, diamond), pow(goldenRatio, circle), pow(goldenRatio, circle)]
    }
}

struct NitterHouse: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: 0.4*rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: 0.4*rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct NitterTent: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY)) // the tent peak
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

struct NitterDiamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}
