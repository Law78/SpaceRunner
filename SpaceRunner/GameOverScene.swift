import SpriteKit

class GameOverScene: SKScene {
    
    // MARK: - Private class constants
    private let background = Background()

    // MARK: - Private class variables
    private var sceneLabel = SKLabelNode()
    
    // MARK: - Init
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size:size)
    }
    
    override func didMoveToView(view: SKView) {
        self.setupMenuScene()
    }
    
    // MARK: Setup
    private func setupMenuScene() {
        // Set the background color to black
        self.backgroundColor = Colors.colorFromRGB(rgbValue: Colors.Background)
        self.addChild(self.background)
        
        // Initialize the temporary label and add it to the scene
        self.sceneLabel.fontName = "Chalkduster"
        self.sceneLabel.fontColor = SKColor.whiteColor()
        self.sceneLabel.fontSize = kTitleFontSize
        self.sceneLabel.text = "Game Over Scene"
        self.sceneLabel.position = kScreenCenter
        self.addChild(self.sceneLabel)
    }
    
    // MARK: Update
    override func update(currentTime: NSTimeInterval){
        
    }
    
    // MARK: Touch Events
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if self.sceneLabel.containsPoint(touchLocation){
            if kDebug{
                print("Game Over Scene: Loading Game Scene. Tocco:\(touchLocation)")
            }
            self.loadGameScene()
        }
    }
    
    // MARK: - Load Scene
    private func loadGameScene(){
        let menuScene = GameScene(size: kViewSize)
        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
        
        self.view?.presentScene(menuScene, transition: transition)
    }
}