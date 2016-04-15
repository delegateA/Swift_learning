//
//  SixViewController.swift
//  Swift_my
//
//  Created by zzh_iPhone on 16/4/15.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class SixViewController: UIViewController,UIActionSheetDelegate {

    @IBOutlet weak var sheetLabel: UILabel!
    @IBOutlet weak var sheet: UIButton!
    @IBAction func sheetBtn(sender: UIButton) {
        let alertcontroller = UIAlertController(title: nil,message: "choose what you would like to share to.",preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (cancelAction) in }
        alertcontroller.addAction(cancelAction)
        
        let weixin = UIAlertAction(title: "weixin", style: .Default) { (weixin) in
           self.sheetLabel.text = "you chose to share to weixin"
        }
        alertcontroller.addAction(weixin)
        
        let weiboAction = UIAlertAction(title: "weibo", style: .Default) { (weiboAction) in
         self.sheetLabel.text = "you chose to share to weibo"
        }
        alertcontroller.addAction(weiboAction)
        
        let qqAction = UIAlertAction(title: "qq", style: .Default) { (qqAction) in
         self.sheetLabel.text = "you chose to share to qq"
        }
        alertcontroller.addAction(qqAction)
        
        self.presentViewController(alertcontroller, animated: true) { 
            
        }
        
    }
    
    //登录界面
    
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFiledTwo: UITextField!
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var centerUserNameTF: NSLayoutConstraint!
    @IBOutlet weak var centerPasswordTF: NSLayoutConstraint!
    @IBOutlet weak var centerLoginBtn: NSLayoutConstraint!
    
    @IBAction func loginBtn(sender: AnyObject) {
        UIView.animateWithDuration(0.5, delay: 0.00, options: .CurveEaseOut, animations: {
            
            self.centerUserNameTF.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.25, options: .CurveEaseOut, animations: {
            
            self.centerPasswordTF.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.50, options: .CurveEaseOut, animations: {
            
            self.centerLoginBtn.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        
        UIView.animateWithDuration(0.5, delay: 0.00, options: .CurveEaseOut, animations: {
            
            self.welcome.alpha = 0
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        login.layer.cornerRadius = 6
        // Do any additional setup after loading the view.
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        centerPasswordTF.constant -= view.bounds.width
        centerUserNameTF.constant -= view.bounds.width
        centerLoginBtn.constant -= view.bounds.width
    }
   
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, delay: 0.00, options: .CurveEaseOut, animations: {
            
            self.centerUserNameTF.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.25, options: .CurveEaseOut, animations: {
            
            self.centerPasswordTF.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.50, options: .CurveEaseOut, animations: {
            
            self.centerLoginBtn.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
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
