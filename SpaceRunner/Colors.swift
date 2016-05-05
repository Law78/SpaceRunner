import SpriteKit

/*
La classe (creata dal capitolo 2) mi gestisce una palette di colori, anzichè usare solo gli SKColors
In questa classe andiamo a definire i colori tramite il codice esadecimale RGB, creando una funzione
che restituisce la versione RGB in SKColor, adatto all'uso con SpriteKit
*/

class Colors {
    
    // RGB colors: creo delle variabili di classe e assegno i valori RGB esadecimali.
    // Il libro usa Int io ho messo UInt32 che è 32bit anzichè a 64bit (dall'iPhone 5s in su)
    class var Background: UInt32 {
        return 0x000000
    }
    class var Magic: UInt32 {
        return 0x04f2de // corrisponde al valore CSS #04f2de
    }
    class var FontBonus: UInt32 {
        return 0xb3ff01 // corrisponde al valore CSS #b3ff01
    }
    class var FontScore: UInt32 {
        return 0xe6e7e8
    }
    class var Border: UInt32 {
        return 0x49b9ea
    }
    
    // Anche qui uso UInt32 ovviamente anzichè Int
    class func colorFromRGB(rgbValue rgbValue: UInt32) -> SKColor {
        /* 
            Faceno l'AND operator ottengo un BIT MASKING, ovvero, ad es., tra 0xCC6699 e 0xFF0000 prendo la parte del rosso: 0xCC0000.
            Sapendo che ogni coppia in un esadecimale usa 8 bits, uno spostamento verso destra di 16 bit fa si che la prima coppia 0xCC.... venga spostata in 0x....CC il cui valore decimale è 204.
            Faccio la stessa cosa per la componente verde ma con uno spostamento verso destra di 8 bit, mentre per la componente blu lo spostamento non è necessario
            Con >> faccio lo shift dei bit.
            Infine divido il tutto per 255 ma per farlo devo fare un casting in CGFloat di un tipo generico Int
        */
        let red:    CGFloat = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green:  CGFloat = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue:   CGFloat = CGFloat(rgbValue & 0x0000FF) / 255.0
        let alpha:  CGFloat = 1.0

        return SKColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}