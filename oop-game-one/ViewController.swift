//
//  ViewController.swift
//  oop-game-one
//
//  Created by Thomas on 11/3/15.
//  Copyright © 2015 Thomas Harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var msgLbl: UILabel!
    
    @IBOutlet weak var loot: UIButton!
    
    @IBOutlet weak var attackBtn: UIButton!
    
    @IBOutlet weak var playerHp: UILabel!
    
    @IBOutlet weak var enemyHp: UILabel!
    
    @IBOutlet weak var enemImg: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(name: "Dirty Laundry 21", hp: 110, attackPwr: 20)
        playerHp.text = "\(player.hp) HP"
        enemy = Enemy(startingHp: 102, attackPwr: 10)
        enemyHp.text = "\(enemy.hp) HP"
    }
    
    func generateRandomEnemy() {
        
        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
        }else {
            enemy = DevilWizard(startingHp: 65, attackPwr: 19)
        }
        enemImg.hidden = false
    }

    @IBAction func attackBtnPressed(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            msgLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHp.text = "\(enemy.hp) HP"
        }else {
            msgLbl.text = "Attack was unsuccessful!"
        }
        
        if let aloot = enemy.dropLoot(){
            player.addItemToInventory(aloot)
            chestMessage = "\(player.name) found \(aloot)"
            loot.hidden = false
            
            
        }
        if !enemy.isAlive {
            
            enemyHp.text = ""
            msgLbl.text = "Killed \(enemy.type)"
            enemImg.hidden = true
        }
        
    }

    @IBAction func lootChestPressed(sender: AnyObject) {
        loot.hidden = true
        msgLbl.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
        
    }

}

