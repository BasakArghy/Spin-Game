//
//  ContentView.swift
//  Spin Game
//
//  Created by Arghy on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var spinResult = 0
    @State private var totalScore = 0
    @State private var isSpinning = false
    @State private var rotationAngle = 0.0

    let possibleValues = [10, 20, 30, 40, 50, 60, 70, 80]
    var body: some View {
        ZStack {
          
            Image("back")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                Text("Spin Game")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.yellow)
                    .cornerRadius(10)
                    

                Text("Spin Result: \(spinResult)")
                    .font(.title2)
                    
                    .foregroundColor(.red)
                    .cornerRadius(10)

                Text("Total Score: \(totalScore)")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.orange)
                    .cornerRadius(10)

                Spacer()

              
                Image("disk2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(rotationAngle))
                    .animation(isSpinning ? Animation.linear(duration: 1.0).repeatCount(1, autoreverses: false) : .default)

                Spacer()

                
                Button(action: spinWheel) {
                    Text("Spin")
                        .font(.title)
                        .padding()
                        .background(isSpinning ? Color.gray : Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isSpinning)
                .padding()

                Spacer()
            }
            .padding()
        }
    }
    
    func spinWheel() {
        isSpinning = true
        rotationAngle += 360
        
        let randomIndex = Int.random(in: 0..<possibleValues.count)
        
        withAnimation(Animation.easeInOut(duration: 1.0)) {
            spinResult = possibleValues[randomIndex]
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            totalScore += spinResult
            isSpinning = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
