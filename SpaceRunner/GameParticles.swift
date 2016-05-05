import SpriteKit

/*
La classe (creata dal capitolo 2) mi definisce una istanza SKEmitterNode.
SpriteKit ci permette di creare la stessa cosa con un editor, creando un file sotto iOS -> Resources -> SpriteKit Particle File, ma noi lo facciamo programmaticamente
*/

let GameParticlesSharedInstance = GameParticles()

class GameParticles{
    
    class var sharedInstance: GameParticles{
        return GameParticlesSharedInstance
    }
    
    // MARK - Public class enum
    internal enum Particles: Int{
        case Magic
    }
    
    // MARK: - Private class propertis
    private var magicParticles = SKEmitterNode()
    
    // MARK: Init
    init(){
        self.setupMagicParticles()
    }
    
    // MARK: - Setup
    private func setupMagicParticles(){
        
        // Birthrate and Lifetime
        self.magicParticles.particleBirthRate       = 35.0
        self.magicParticles.particleLifetime        = 5.0
        self.magicParticles.particleLifetimeRange   = 1.25
        
        // Position Range
        self.magicParticles.particlePositionRange = CGVectorMake(kViewSize.width * 2, kViewSize.height * 2)
        
        // Speed
        self.magicParticles.particleSpeed       = -200.0
        self.magicParticles.particleSpeedRange  = self.magicParticles.particleSpeed / 4
        
        // Emission Angle
        self.magicParticles.emissionAngle       = DegreeToRadians(degrees: 90.0)
        self.magicParticles.emissionAngleRange  = DegreeToRadians(degrees: 15)
        
        // Alpha
        self.magicParticles.particleAlpha       = 0.5
        self.magicParticles.particleAlphaRange  = 0.25
        self.magicParticles.particleAlphaSpeed  = -0.125
        
        // Color blending
        self.magicParticles.particleColorBlendFactor        = 0.5
        self.magicParticles.particleColorBlendFactorRange   = 0.25
        
        // Color
        self.magicParticles.particleColor = Colors.colorFromRGB(rgbValue: Colors.Magic)
        
        // Textures
        self.magicParticles.particleTexture = GameTextures.sharedInstance.textureWithName(name: SpriteName.Magic)
    }
    
    // MARK: - Public functions
    func createParticle(particles particles: Particles) -> SKEmitterNode {
        switch particles {
            case Particles.Magic:
                // copy() mi restituisce un tipo AnyObject per cui devo fare il cast as!
                return self.magicParticles.copy() as! SKEmitterNode
        }
    }
}