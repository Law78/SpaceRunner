import SpriteKit

class GameScene: SKScene {
    
    // MARK: - Private class constants
    private let background = Background()
    
    // MARK: - Private class variables
    private var sceneLabel = SKLabelNode()
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize){
        super.init(size: size)
    }
    
    override func didMoveToView(view: SKView) {
        self.setupGameScene()
    }
    
    // MARK: - Setup Game Scene
    private func setupGameScene(){
        
        // Set the background color to Black
        self.backgroundColor = Colors.colorFromRGB(rgbValue: Colors.Background)
        self.addChild(self.background)
        
        // Initialize the temporary label and add it to the scene
        self.sceneLabel.fontName = "Chalkduster"
        self.sceneLabel.fontColor = SKColor.whiteColor()
        self.sceneLabel.fontSize = kTitleFontSize
        self.sceneLabel.text = "Game Scene"
        self.sceneLabel.position = kScreenCenter
        
        self.addChild(self.sceneLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch: UITouch = touches.first! as UITouch
        let touchLocation = touch.locationInNode(self)
        
        if self.sceneLabel.containsPoint(touchLocation){
            if kDebug{
                print("Game Scene: Loading Game Over. Tocco:\(touchLocation)")
            }
            self.loadGameOverScene()
        }
    }
    
    // MARK: - Load Scene
    private func loadGameOverScene(){
        let gameOverScene = GameOverScene(size: kViewSize)
        let transition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
        
        self.view?.presentScene(gameOverScene, transition: transition)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
