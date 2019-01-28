import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var robotLabel: UILabel!
    @IBOutlet private weak var mainTextLabel: UILabel!
    @IBOutlet private var choiseButtons: [UIButton]!
    @IBOutlet private weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGameState(gameState: .start)
    }

    @IBAction func tapChoise(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else { return }
        play(choise: buttonText)
    }
    
    @IBAction func playAgainTapped(_ sender: Any) {
        setGameState(gameState: .start)
        for btn in choiseButtons {
            btn.isEnabled = true
            btn.isHidden = false
        }
    }
    
    private func play(choise: String) {
        let playerChoise = setSign(choise: choise)
        let enemyChoise = randomSign()
        let gameState = playerChoise.beat(sign: enemyChoise)
        setGameState(gameState: gameState, robotChoise: enemyChoise.emoji)
        for btn in choiseButtons {
            let isTappedBtn = btn.titleLabel?.text == choise
            btn.isHidden = !isTappedBtn
            if isTappedBtn {
                btn.isEnabled = false
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    btn.center = CGPoint(x: self.view.center.x, y: btn.center.y)
                }
            }
        }
    }
    
    private func setGameState(gameState: GameState, robotChoise: String = "🤖") {
        robotLabel.text = robotChoise
        mainTextLabel.text = gameState.stateText
        playAgainButton.isHidden = gameState == .start ? true : false
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = gameState.color
        }
    }
    
    private func randomSign() -> Sign {
        let randomInt = Int.random(in: 1...3)
        switch randomInt {
        case 1:
            return Sign.paper
        case 2:
            return Sign.rock
        case 3:
            return Sign.scissors
        default:
            return Sign.paper
        }
    }
    
    private func setSign(choise: String) -> Sign {
        switch choise {
        case "✋":
            return .paper
        case "👊":
            return .rock
        case "✌️":
            return .scissors
        default:
            return .paper
        }
    }
}
