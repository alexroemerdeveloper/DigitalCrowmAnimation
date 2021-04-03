//
//  ContentView.swift
//  DigitalCrowmAnimation WatchKit Extension
//
//  Created by Alexander Römer on 03.04.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            ZStack {
                CircleView()
                //SyncProgressView()
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircleView: View {
    
    @State private var scrollAmount = 0.0
    @State private var progress = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 10))
                .opacity(0.2)
                .foregroundColor(.white)
                .frame(width: 120)
            Circle()
                .offset(y: -60)
                .foregroundColor(.white)
                .frame(width: 10)
                .rotationEffect(Angle(degrees: progress))
                .focusable(true)
                .digitalCrownRotation($scrollAmount, from: 0, through: 360, by: 1, sensitivity: .high, isContinuous: false, isHapticFeedbackEnabled: true)
                .onChange(of: scrollAmount) { value in
                    print(value)
                    withAnimation {
                        self.progress = value
                    }
                }
        }
    }
}

struct SyncProgressView: View {
    
    @State private var scrollAmount = 0.0
    @State private var progress = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(style: StrokeStyle(lineWidth: 4, dash: [1,2]))
                    .opacity(0.3)
                    .foregroundColor(.white)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 4, dash: [1,2]))
                    .foregroundColor(.white)
                    .rotationEffect(Angle(degrees: -progress))
                    .rotationEffect(Angle.degrees(270))
                    .focusable(true)
                    .digitalCrownRotation($scrollAmount, from: 0, through: 1, by: 0.1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
                    .onChange(of: scrollAmount) { value in
                        print(value)
                        withAnimation {
                            self.progress = value
                        }
                    }
            }
            Text("Progress: \(progress, specifier: "%.2f")")
                .font(.caption)
                .padding(.top)
        }
    }
}

struct SyncProgressView_Previews: PreviewProvider {
    static var previews: some View {
        SyncProgressView()
    }
}
