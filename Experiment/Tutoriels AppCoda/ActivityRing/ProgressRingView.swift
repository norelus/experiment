//
//  ProgressRingView.swift
//  Experiment
//
//  Created by Aurélien Caille on 03/11/2021.
//  Copyright © 2021 norelus. All rights reserved.
//

import SwiftUI

struct ProgressRingView: View {
    
    var thickness: CGFloat = 30.0
    var width: CGFloat = 250.0
    var gradient = Gradient(colors: [.darkPurple, .lightYellow])
    var startAngle: Double = -90
    @Binding var progress: Double
    
    private var radius: Double {
        Double(width / 2)
    }
    
    private var ringTipShadowOffset: CGPoint {
        let shadowPosition = ringTipPosition(progress: progress + 0.01)
        let circlePosition = ringTipPosition(progress: progress)

        return CGPoint(x: shadowPosition.x - circlePosition.x, y: shadowPosition.y - circlePosition.y)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: thickness)

            RingShape(progress: progress, thickness: thickness)
                .fill(AngularGradient(gradient: gradient,
                                      center: .center,
                                      startAngle: .degrees(startAngle),
                                      endAngle: .degrees(startAngle + 360 * progress)))
            RingTip(progress: progress, startAngle: startAngle, ringRadius: radius)
                .frame(width: thickness, height: thickness)
                .foregroundColor(progress > 0.96 ? gradient.stops[1].color : Color.clear)
                .shadow(color: progress > 0.96 ? Color.black.opacity(0.15) : Color.clear, radius: 2, x: ringTipShadowOffset.x, y: ringTipShadowOffset.y)
         }
        .frame(width: width, height: width, alignment: .center)
        .animation(Animation.linear(duration: 1.0))
    }
    
    private func ringTipPosition(progress: Double) -> CGPoint {
        let angle = 360 * progress + startAngle
        let angleInRadian = angle * .pi / 180

        return CGPoint(x: radius * cos(angleInRadian), y: radius * sin(angleInRadian))
    }
    
}


struct RingShape: Shape {
    
    var progress: Double = 0.0
    var thickness: CGFloat = 30.0
    var startAngle: Angle = .degrees(-90)
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {

        var path = Path()

        path.addArc(center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0),
                    radius: min(rect.width, rect.height) / 2.0,
                    startAngle: startAngle,
                    endAngle: startAngle + .degrees(360 * progress), clockwise: false)

        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
}


struct RingTip: Shape {
    
    var progress: Double = 0.0
    var startAngle: Double = -90.0
    var ringRadius: Double
    
    private var position: CGPoint {
        let angle = 360 * progress + startAngle
        let angleInRadian = angle * .pi / 180

        return CGPoint(x: ringRadius * cos(angleInRadian), y: ringRadius * sin(angleInRadian))
    }

    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        guard progress > 0.0 else {
            return path
        }

        let frame = CGRect(x: position.x, y: position.y, width: rect.size.width, height: rect.size.height)

        path.addRoundedRect(in: frame, cornerSize: frame.size)

        return path
    }

}

struct ProgressRingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProgressRingView(progress: .constant(0.5))
            ProgressRingView(progress: .constant(0.9))
        }
    }
}
