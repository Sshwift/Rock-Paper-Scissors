import Foundation

enum Sign {
    case papper, scissors, rock
    var emoji: String {
        switch self {
        case .papper:
            return "✋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        }
    }
    func beat(sign: Sign) -> GameState {
            switch self {
            case .papper:
                switch sign {
                case .rock:
                    return .win
                case .scissors:
                    return .lose
                case .papper:
                    return .draw
                }
            case .scissors:
                switch sign {
                case .rock:
                    return .lose
                case .scissors:
                    return .draw
                case .papper:
                    return .win
                }
            case .rock:
                switch sign {
                case .rock:
                    return .draw
                case .scissors:
                    return .win
                case .papper:
                    return .lose
                }
            }
    }
}

enum GameState {
    case start, lose, win, draw
    var stateText: String {
        switch self {
        case .start:
            return "Rock, papper, scissors?"
        case .lose:
            return "You lose!"
        case .win:
            return "You win!"
        case .draw:
            return "Draw!"
        }
    }
}
