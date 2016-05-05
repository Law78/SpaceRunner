//
//  GameViewController.swift
//  SpaceRunner
//
//  Created by Lorenzo on 20/04/16.
//  Copyright (c) 2016 Lorenzo. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    // Sostituisco la viewDidLoad in quanto quest'ultima mi garantisce la corretta dimensione della mia view a differenza della viewDidLoad.
    override func viewWillLayoutSubviews() {
        // Chiamo il costruttore base: è buona prassi!
        super.viewWillLayoutSubviews()
        // Verifico che il game controller abbia un oggetto SKView
        if let skView = self.view as? SKView {
            // Siccome la viewwillLayoutSubviews può essere chiamata più volte, devo fare questo controllo, e cioè che non ho già l'oggetto della scena!!!
            if(skView.scene == nil){
                if kDebug{
                    skView.showsFPS = true
                }
                // Per performance, questa istruzione è buona pratica: ignora l'ordine di come vengono disegnati i nodi sulla scena
                skView.ignoresSiblingOrder = true
                
                let menuScene = MenuScene(size: kViewSize)
                let menuTransition = SKTransition.fadeWithColor(SKColor.blackColor(), duration: 0.25)
                skView.presentScene(menuScene, transition: menuTransition)
            }
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
