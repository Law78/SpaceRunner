import SpriteKit

/*
(creata dal capitolo 2) mi fornisce delle funzioni utili
*/

func Smoot(startPoint startPoint: CGFloat, endPoint: CGFloat, filter: CGFloat) -> CGFloat {
    return (startPoint * (1 - filter)) + endPoint * filter
}

func RandomIntegerBetween(min min: Int, max: Int) -> Int {
    return Int(UInt32(min) + arc4random_uniform(UInt32(max - min + 1)))
}

func RandomFloatRange(min min: CGFloat, max: CGFloat) -> CGFloat {
    return CGFloat(Float(arc4random()) / 0xFFFFFF) * (max - min) + min
}

func DegreeToRadians(degrees degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(M_PI) / 180.0
}