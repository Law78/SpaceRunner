import SpriteKit

/*
La classe (creata dal capitolo 2) crea un finto movimento del background utilizznado le particles
create in GameParticles.
Eredito daSKNode. Ho due costanti che controllano la velocità delle particelle. Una quando il background è fermo e una quando il background è in movimento.
Come già visto nel Capitolo 1, quando eredito da un certo tipo di classi di SpriteKit, devo aggiungere il template del costruttore che include NSCoder e fare la chiamata al super.init(). Ciò verrà ripetuto per tutte le volte che eredito da SKNode o SKSpriteNode (che è sottoclasse di SKNode)
*/

class Background: SKNode{
    
    // MARK: - Private class constants
    private let backgroundRunSpeed: CGFloat     = -200.0
    private let backgroundStopSpeed: CGFloat    = -25.0
    
    // MARK: - Private class variables
    private var backgroundParticles = SKEmitterNode()
    
    // MARK: - Init
    // Necessario in quanto eredito da una classe di SpriteKit
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    // Inizializzo le mie particelle utilizzando la copia ottenuta dalla classe GameParticles usando il metodo createParticle
    override init(){
        super.init()
        self.setupBackground()
    }
    
    // MARK: - Setup
    private func setupBackground(){
        self.backgroundParticles = GameParticles.sharedInstance.createParticle(particles: GameParticles.Particles.Magic)
        
        self.addChild(self.backgroundParticles)
        self.stopBackground()
    }
    
    // MARK: - Action
    // Queste due funzioni creano l'illusione di un background in movimento
    func startBackground(){
        self.backgroundParticles.particleSpeed      = self.backgroundRunSpeed
        self.backgroundParticles.particleSpeedRange = self.backgroundRunSpeed / 4
    }
    
    func stopBackground(){
        self.backgroundParticles.particleSpeed      = self.backgroundStopSpeed
        self.backgroundParticles.particleSpeedRange = self.backgroundStopSpeed / 4
    }
}