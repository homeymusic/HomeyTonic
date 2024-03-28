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
        let coefficient = 0.0225
        let home        = coefficient * 14
        let tent        = coefficient * 13
        let diamond     = coefficient * 12
        let circle      = coefficient * 10
        return [home, circle, circle, diamond, diamond, tent, circle, tent, diamond, diamond, circle, circle]
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
