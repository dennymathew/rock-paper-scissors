//
//  GemLogic.swift
//  RockPaperScissors
//
//  Created by Denny Mathew on 20/11/20.
//

import Foundation
enum GameChoice: Int, CaseIterable {
    case rock, paper, scissors
    var value: String {
        switch self {
        case .rock:
            return "Rock"
        case .paper:
            return "Paper"
        case .scissors:
            return "Scissors"
        }
    }
    static var random: GameChoice {
        GameChoice.allCases[Int.random(in: 0..<3)]
    }
}
enum GameResult: Int {
    case win, loose, draw
}
class GameLogic {
    static let shared = GameLogic()
    var appChoice: GameChoice = .rock
    var shouldWin: Bool = true
    var appPoints = 0
    var playerPoints = 0
    var turn = 0
    var endGame: Bool {
        return turn >= 10
    }
    private init() {
        restart()
    }
    func restart() {
        appPoints = 0
        playerPoints = 0
        appChoice = GameChoice.random
    }
    func reset() {
        print("App: \(appPoints) | Player: \(playerPoints)")
        turn += 1
        appChoice = GameChoice.random
    }
    @discardableResult func calculate(_ choice: GameChoice) -> GameResult {
        let playerChoice = choice.rawValue
        let appChoice = self.appChoice.rawValue
        defer {
            reset()
        }
        if appChoice == playerChoice {
            print("DRAW. App chose \(self.appChoice.value)")
            return .draw
        }
        if appChoice + 1 == playerChoice || appChoice == playerChoice + 2 {
            appPoints -= 5
            playerPoints += 10
            print("WIN. App chose \(self.appChoice.value)")
            return .win
        }
        print("LOOSE. App chose \(self.appChoice.value)")
        return .loose
    }
}
