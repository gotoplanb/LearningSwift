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
    
    var supplies = Supplies(aMoney: 10, aLemons: 1, aIceCubes: 1)
    let price = Price()
    var lemonsToPurchase = 0
    var iceCubesToPurchase = 0
    var lemonsToMix = 0
    var iceCubesToMix = 0
    var weatherArray:[[Int]] = [[-10, -9, -5, -7], [5, 8, 10, 9], [22, 25, 27, 23]]
    var weatherToday:[Int] = [0, 0, 0, 0]
    var weatherImageView:UIImageView = UIImageView(frame: CGRect(x: 20, y: 50, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(weatherImageView)
        simulateWeatherToday()
        updateMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        
        if supplies.money >= price.lemon {
            lemonsToPurchase += 1
            supplies.money -= price.lemon
            supplies.lemons += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough money")
        }
        
    }
    
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
        
        if lemonsToPurchase > 0 {
            lemonsToPurchase -= 1
            supplies.money += price.lemon
            supplies.lemons -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You have anything to return.")
        }
        
    }
    
    @IBAction func purchaseIceCubeButtonPressed(sender: UIButton) {
        
        if supplies.money >= price.iceCube {
            iceCubesToPurchase += 1
            supplies.money -= price.iceCube
            supplies.iceCubes += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough money.")
        }
        
    }
    
    @IBAction func unpurchaseIceCubeButtonPressed(sender: UIButton) {
        
        if iceCubesToPurchase > 0 {
            iceCubesToPurchase -= 1
            supplies.money += price.iceCube
            supplies.iceCubes -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have anything to return.")
        }
        
    }

    @IBAction func mixLemonButtonPressed(sender: UIButton) {
        
        if supplies.lemons > 0 {
            lemonsToPurchase = 0
            supplies.lemons -= 1
            lemonsToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough inventory.")
        }
        
    }
    
    @IBAction func mixIceCubeButtonPressed(sender: UIButton) {
        
        if supplies.iceCubes > 0 {
            iceCubesToPurchase = 0
            supplies.iceCubes -= 1
            iceCubesToMix += 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You don't have enough inventory.")
        }
        
    }
    
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
        
        if lemonsToMix > 0 {
            lemonsToPurchase = 0
            supplies.lemons += 1
            lemonsToMix -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You have nothing to un-mix.")
        }
        
    }
    
    @IBAction func unmixIceCubeButtonPressed(sender: UIButton) {
        
        if iceCubesToMix > 0 {
            iceCubesToPurchase = 0
            supplies.iceCubes += 1
            iceCubesToMix -= 1
            updateMainView()
        }
        else {
            showAlertWithText(message: "You have nothing to un-mix.")
        }
    }
    
    @IBAction func startDayButtonPressed(sender: UIButton) {
        
        let average = findAverage(weatherToday)
        let customers = Int(arc4random_uniform(UInt32(abs(average))))
        println("customers: \(customers)")
        
        if lemonsToMix == 0 || iceCubesToMix == 0 {
            showAlertWithText(message: "You needs to add at least 1 lemon and 1 ice cube")
        }
        else {
            let lemonadeRatio = Double(lemonsToMix) / Double(iceCubesToMix)
            for customer in 0...customers {
                let preference = Double(arc4random_uniform(UInt32(101))) / 100
                if preference < 0.4 && lemonadeRatio > 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference > 0.6 && lemonadeRatio < 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else if preference <= 0.6 && preference >= 0.4 && lemonadeRatio == 1 {
                    supplies.money += 1
                    println("Paid")
                }
                else  {
                    println("else statement evaluating")
                }
            }
            lemonsToPurchase = 0
            iceCubesToPurchase  = 0
            lemonsToMix = 0
            iceCubesToMix = 0
            simulateWeatherToday()
            updateMainView()
        }
    }

    func updateMainView() {
        moneySupplyCount.text = "$\(supplies.money)"
        lemonSupplycount.text = "\(supplies.lemons) lemons"
        iceCubeSupplyCount.text = "\(supplies.iceCubes) ice cubes"
        lemonPurchaseCount.text = "\(lemonsToPurchase)"
        iceCubePurchaseCount.text = "\(iceCubesToPurchase)"
        lemonMixCount.text = "\(lemonsToMix)"
        iceCubeMixCount.text = "\(iceCubesToMix)"
    }
    
    func showAlertWithText(header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func simulateWeatherToday() {
        let index = Int(arc4random_uniform(UInt32(weatherArray.count)))
        weatherToday = weatherArray[index]
        switch index {
        case 0:
            weatherImageView.image = UIImage(named: "cold")
        case 1:
            weatherImageView.image = UIImage(named: "mild")
        case 2:
            weatherImageView.image = UIImage(named: "warm")
        default:
            weatherImageView.image = UIImage(named: "warm")
        }
    }
    
    func findAverage(data:[Int]) -> Int {
        var sum = 0
        for datum in data {
            sum += datum
        }
        var average = Double(sum) / Double (data.count)
        var rounded:Int = Int(ceil(average))
        return rounded
    }
    
}

