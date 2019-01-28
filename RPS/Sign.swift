import UIKit

enum Sign {
    case paper, scissors, rock
    
    var emoji: String {
        switch self {
        case .paper:
            return "✋"
        case .rock:
            return "👊"
        case .scissors:
            return "✌️"
        }
    }
    
    func beat(sign: Sign) -> GameState {
            switch self {
            case .paper:
                switch sign {
                case .rock:
                    return .win
                case .scissors:
                    return .lose
                case .paper:
                    return .draw
                }
            case .scissors:
                switch sign {
                case .rock:
                    return .lose
                case .scissors:
                    return .draw
                case .paper:
                    return .win
                }
            case .rock:
                switch sign {
                case .rock:
                    return .draw
                case .scissors:
                    return .win
                case .paper:
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
            return "Rock, paper, scissors?"
        case .lose:
            return "You lose!"
        case .win:
            return "You win!"
        case .draw:
            return "Draw!"
        }
    }
    
    var color: UIColor {
        switch self {
        case .draw:
            return UIColor.darkGray
        case .lose:
            return UIColor.red
        case .win:
            return UIColor.green
        case .start:
            return UIColor.white
        }
    }
    
}
