//
//  OneViewController.swift
//  Swift_my
//
//  Created by zzh_iPhone on 16/4/15.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit
import FlatUIKit
import ChameleonFramework

class OneViewController: UIViewController {

    
    //计数
    @IBOutlet weak var countLabel: UILabel!
    
    var count = 0
    
    @IBAction func startBtn(sender: UIButton) {
        count += 1
        countLabel.text = "\(count)"
    }
    @IBAction func removeBtn(sender: UIButton) {
        count = 0
        countLabel.text = "\(count)"
    }
    
    //展示alart
    
    @IBOutlet weak var alart: UIButton!
    
    @IBAction func alartBtn(sender: UIButton) {
        let alertVC = UIAlertController(title: "I am alertVC",message: "Do you love me?",preferredStyle: UIAlertControllerStyle.Alert)
        alertVC.addAction(UIAlertAction(title: "OKay Cool!",style: UIAlertActionStyle.Default,handler: nil))
    
        self.presentViewController(alertVC, animated: true, completion: nil)
        
    }
    
    //TipCalculator
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipValue: UILabel!
    
    @IBAction func slider(sender: UISlider) {
        let currentValue = Int(sender.value)
        tipLabel.text = "Tip(\(currentValue)%)"
        updateTip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countLabel.text = "\(count)"
        
        alart.layer.cornerRadius=4
        
        textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        setUI()
    }
    
    func setUI() {
        self.view.backgroundColor = UIColor.orangeColor()
        textField.returnKeyType = .Done
        mySlider.configureFlatSliderWithTrackColor(UIColor.silverColor(), progressColor: UIColor.alizarinColor(), thumbColor: UIColor.pomegranateColor())
    }
    
    func textFieldDidChange(textField:UITextField) {
         updateTip()
    }
    
    func updateTip() {
        if self.textField.text != "" && Double(self.textField.text!) > 0 {
            let tipValue = Double(self.textField.text!)!*Double(mySlider.value) / 100.00
            let totalValue = Double(self.textField.text!)! + tipValue
            self.tipValue.text = "$\(String(format: "%.2f", tipValue))"
            self.totalLabel.text = "$\(String(format: "%.2f", totalValue))"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
