//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Denny Mathew on 13/11/20.
//

import SwiftUI

struct GameView: View {
    @State private var appOption = Int.random(in: 0..<3)
    @State private var shouldWin: Bool = true
    var body: some View {
        VStack {
            Button("Rock") {
                print("Rock")
                GameLogic.shared.calculate(.rock)
            }
            .modifier(GameButton(color: .red))
            Button("Paper") {
                print("Paper")
                GameLogic.shared.calculate(.paper)
            }
            .modifier(GameButton(color: .orange))
            Button("Scissors") {
                print("Scissors")
                GameLogic.shared.calculate(.scissors)
            }
            .modifier(GameButton(color: .green))
        }
    }
}
struct GameButton: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .frame(width: 100, height: 30, alignment: .center)
            .foregroundColor(.white)
            .padding()
            .background(color)
            .clipShape(Capsule())
            .shadow(radius: 12)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
