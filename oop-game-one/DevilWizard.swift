//
//  DevilWizard.swift
//  oop-game-one
//
//  Created by Thomas on 11/5/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import Foundation


class DevilWizard: Enemy {
    
    override var loot: [String] {
    
    return ["Magic Wand", "Dark Amulet", "Salted Pork"]
        
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
}