//
//  ViewController.swift
//  LemonadeStand
//
//  Created by David Stanton on 2/16/15.
//  Copyright (c) 2015 David Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneySupplyCount: UILabel!
    @IBOutlet weak var lemonSupplycount: UILabel!
    @IBOutlet weak var iceCubeSupplyCount: UILabel!
    @IBOutlet weak var lemonPurchaseCount: UILabel!
    @IBOutlet weak var iceCubePurchaseCount: UILabel!
    @IBOutlet weak var lemonMixCount: UILabel!
    @IBOutlet weak var iceCubeMixCount: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: UIButton) {
    }
    
    @IBAction func unpurchaseIceCubeButtonPressed(sender: UIButton) {
    }
    
    

    
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
    }
    
    @IBAction func mixIceCubeButtonPressed(sender: UIButton) {
    }
    
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
    }
    
    @IBAction func unmixIceCubeButtonPressed(sender: UIButton) {
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
    }

}

