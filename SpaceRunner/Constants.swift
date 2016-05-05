// Per le costanti utilizzo il k davanti in modo da averne facile accesso con l'intellisense (autocomplete)
import Foundation
import SpriteKit

// MARK: - Ambiente di DEBUG
let kDebug = true

// MARK: - Screen dimension convenience: mi determino dimensioni dello schermo e il suo centro
let kViewSize = UIScreen.mainScreen().bounds.size
let kScreenCenter = CGPoint(x: kViewSize.width / 2, y: kViewSize.height / 2)

// MARK: - Device size convenience: mi serve per sapere se sono su un iPhone o su un iPad
let kDeviceTablet = (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad)

let kTitleFontSize = kViewSize.width * 0.1

// Creo una classe per sfruttare l'autocomplete e quindi di evitare errori di digitazione. In questa classe vado ad inserire i nomi dei miei Sprite. Se questi cambiano, mi basterà modificarli qua.
class SpriteName {
    // Button Sprite Names
    class var ButtonPlay: String {
        return "PlayButton"
    }
    class var ButtonStart: String {
        return "StartButton"
    }
    class var ButtonRestry: String {
        return "RetryButton"
    }
    
    // Interface Title Names
    class var TitleGame: String {
        return "GameTitle"
    }
    class var TitleGameShip: String {
        return "GameTitleShip"
    }
    class var TitleGameOver: String {
        return "GameOverTitle"
    }
    
    // Magic
    class var Magic: String {
        return "Magic"
    }
    
    // Player
    class var Player: String {
        return "Player"
    }
}