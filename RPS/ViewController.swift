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
        switch sender.titleLabel?.text {
        case "✋":
            play(sign: .papper, button: sender)
        case "👊":
            play(sign: .rock, button: sender)
        case "✌️":
            play(sign: .scissors, button: sender)
        default:
            return
        }
    }
    
    @IBAction func playAgainTapped(_ sender: Any) {
        setGameState(gameState: .start)
    }
    
    private func play(sign: Sign, button: UIButton) {
        let playerChoise = sign
        let enemyChoise = randomSign()
        let gameState = playerChoise.beat(sign: enemyChoise)
        setGameState(gameState: gameState)
        robotLabel.text = enemyChoise.emoji
        for btn in choiseButtons {
            if btn != button {
                btn.isHidden = true
            } else if btn == button {
                btn.isEnabled = false
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                    btn.center = CGPoint(x: self.view.center.x, y: btn.center.y)
                }
            }
        }
    }
    
    private func setGameState(gameState: GameState) {
        robotLabel.text = "🤖"
        mainTextLabel.text = gameState.stateText
        playAgainButton.isHidden = false
        let color: UIColor
        switch gameState {
        case .draw:
            color = UIColor.darkGray
        case .lose:
            color = UIColor.red
        case .win:
            color = UIColor.green
        case .start:
            color = UIColor.white
            playAgainButton.isHidden = true
        }
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = color
        }
        for btn in choiseButtons {
            btn.isEnabled = true
            btn.isHidden = false
        }
    }
    
    private func randomSign() -> Sign {
        let randomInt = Int.random(in: 1...3)
        switch randomInt {
        case 1:
            return Sign.papper
        case 2:
            return Sign.rock
        case 3:
            return Sign.scissors
        default:
            return Sign.papper
        }
    }
}
