import SpriteKit

// Nuovo modo per fare la singleton
class GameTextures{
    static let sharedInstance = GameTextures()
    // MARK: - Private class variables - Definisco 2 Texture Atlas
    private var interfaceSpriteAtlas    = SKTextureAtlas()
    private var gameSpriteAtlas         = SKTextureAtlas()
    
    // MARK: - Init - Siccome non eredito da nulla ho un costruttore semplice
    private init(){
        // Carico gli Atlas dell'interfaccia e del gioco
        self.interfaceSpriteAtlas   = SKTextureAtlas(named: "InterfaceSprites")
        self.gameSpriteAtlas        = SKTextureAtlas(named: "GameSprites")
    }
    
    // MARK: - Public convenience functions - Una ritorna una SKTexture e l'altra un SKSpriteNode
    func textureWithName(name name: String) -> SKTexture{
        return SKTexture(imageNamed: name)
    }
    
    func spriteWithName(name name: String) -> SKSpriteNode{
        return SKSpriteNode(imageNamed: name)
    }

}

/*
La classe (creata dal capitolo 2) carica in memoria gli Sprite Atlas
*/

let GameTexturesSharedInstance = GameTextures_book()

class GameTextures_book{
    
    // Da controllare: rispetto ad una static var, la class var viene ereditata dalle subclass
    // una static var/method NON può essere sovrascritta con l'override
    class var sharedInstance: GameTextures_book{
        return GameTexturesSharedInstance
    }
    
    // MARK: - Private class variables - Definisco 2 Texture Atlas
    private var interfaceSpriteAtlas    = SKTextureAtlas()
    private var gameSpriteAtlas         = SKTextureAtlas()
    
    // MARK: - Init - Siccome non eredito da nulla ho un costruttore semplice
    init(){
        // Carico gli Atlas dell'interfaccia e del gioco
        self.interfaceSpriteAtlas   = SKTextureAtlas(named: "InterfaceSprites")
        self.gameSpriteAtlas        = SKTextureAtlas(named: "GameSprites")
    }
    
    // MARK: - Public convenience functions - Una ritorna una SKTexture e l'altra un SKSpriteNode
    func textureWithName(name name: String) -> SKTexture{
        return SKTexture(imageNamed: name)
    }
    
    func spriteWithName(name name: String) -> SKSpriteNode{
        return SKSpriteNode(imageNamed: name)
    }
}