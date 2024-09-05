//
//  TTT.swift
//  Persistance
//
//  Created by Luke R. Christopulos on 9/5/24.
//

import SwiftUI
import Foundation

enum Player {
    case none
    case x
    case o
}

enum GameMode {
    case playerVsPlayer
    case playerVsAI
}

class TicTacToeViewModel: ObservableObject {
    @Published var board: [Player] = Array(repeating: .none, count: 9)
    @Published var currentPlayer: Player = .x
    @Published var gameMode: GameMode = .playerVsPlayer
    @Published var gameWon: Bool = false
    @Published var winner: Player? = nil

    private let winningPatterns: [[Int]] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]
    
    func selectCell(index: Int) {
        guard !gameWon && board[index] == .none else { return }
        
        board[index] = currentPlayer
        if checkWin(for: currentPlayer) {
            gameWon = true
            winner = currentPlayer
        } else if !board.contains(.none) {
            // It's a draw
            gameWon = true
            winner = nil
        } else {
            currentPlayer = (currentPlayer == .x) ? .o : .x
            if gameMode == .playerVsAI && currentPlayer == .o {
                makeAIMove()
            }
        }
    }
    
    private func checkWin(for player: Player) -> Bool {
        return winningPatterns.contains { pattern in
            pattern.allSatisfy { board[$0] == player }
        }
    }
    
    private func makeAIMove() {
        // Simple AI: pick the first empty spot
        if let index = board.firstIndex(of: .none) {
            selectCell(index: index)
        }
    }
    
    func resetGame() {
        board = Array(repeating: .none, count: 9)
        currentPlayer = .x
        gameWon = false
        winner = nil
    }
}

struct TicTacToe: View {
    @StateObject private var viewModel = TicTacToeViewModel()
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 60)
                .stroke(Color.cyan, lineWidth: 12)
                .ignoresSafeArea()
                .background(
                    RoundedRectangle(cornerRadius: 60)
                        .fill(Color.clear)
                )
                .shadow(color: Color.blue.opacity(1), radius: 10, x: 0, y: 0)
                .padding(3)
                .ignoresSafeArea()
            
            
            VStack {
                if viewModel.gameWon {
                    Text(viewModel.winner == nil ? "It's a draw!" : "\(viewModel.winner == .x ? "Player X" : "Player O") wins!")
                        .font(.largeTitle)
                        .padding()
                } else {
                    Text("Current Player: \(viewModel.currentPlayer == .x ? "X" : "O")")
                        .font(.title)
                        .padding()
                }
                
                GridView(viewModel: viewModel)
                
                if viewModel.gameWon {
                    Button("Play Again") {
                        viewModel.resetGame()
                    }
                    .padding()
                } else {
                    ModeSelectorView(viewModel: viewModel)
                }
            }
            .padding()
        }
    }
}

struct GridView: View {
    @ObservedObject var viewModel: TicTacToeViewModel
    
    var body: some View {
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        let index = row * 3 + column
                        CellView(player: viewModel.board[index]) {
                            viewModel.selectCell(index: index)
                        }
                    }
                }
            }
        }
    }
}

struct CellView: View {
    var player: Player
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(player == .none ? "" : (player == .x ? "X" : "O"))
                .font(.largeTitle)
                .frame(width: 100, height: 100)
                .background(Color.gray.opacity(0.3))
                .border(Color.black)
        }
        .disabled(player != .none)
    }
}

struct ModeSelectorView: View {
    @ObservedObject var viewModel: TicTacToeViewModel

    var body: some View {
        VStack {
            Button("Play vs Player") {
                viewModel.gameMode = .playerVsPlayer
                viewModel.resetGame()
            }
            .padding()

            Button("Play vs AI") {
                viewModel.gameMode = .playerVsAI
                viewModel.resetGame()
            }
            .padding()
        }
    }
}

#Preview {
    TicTacToe()
}
