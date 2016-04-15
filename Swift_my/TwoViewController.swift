//
//  TwoViewController.swift
//  Swift_my
//
//  Created by zzh_iPhone on 16/4/15.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    //定时器 开始 应该是start 。。。。
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var state: UIButton!
    @IBOutlet weak var stop: UIButton!
    var timer = NSTimer()
    var count  = 0.00
    
    
    @IBAction func removeBtn(sender: UIButton) {
        timer.invalidate()
        count = 0.00
        timesLabel.text = String(format: "%.02f",count)
        state.enabled = true
        stop.enabled = false
    }
    
    @IBAction func stopBtn(sender: AnyObject) {
        timer.invalidate()
        print("Timer Paused")
        
        state.enabled = true
        stop.enabled = false
        
    }
    
    @IBAction func state(sender: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector:#selector(updateCounter), userInfo: nil
            , repeats: true)
        print("timer Started")
        
        state.enabled = false
        stop.enabled = true
    }
    
    func updateCounter() {
       count = count + 0.02
        timesLabel.text=String(format: "%.02f",count)
    
    }
    
    
    //修改label font
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var change: UIButton!
    var fontNumber = 1
    
    @IBAction func changeBtn(sender: UIButton) {
        if (fontNumber == 1) {
            textLabel.text = String("you love me")
            fontNumber = 2
        } else {
            print(fontNumber)
             textLabel.text = String("I love you")
             fontNumber = 1
        }
    }
    
    //tableView展示
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = ["js","java","html","php","css","python"]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    //实现editing
    
    @IBAction func editing(sender: AnyObject) {
        self.tableView.editing = !self.tableView.editing
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let itemToMove = dataSource[sourceIndexPath.row]
        dataSource.removeAtIndex(sourceIndexPath.row)
        dataSource.insert(itemToMove, atIndex: destinationIndexPath.row)
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
        dataSource.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timesLabel.text=String(count)
        
        tableView.delegate = self
        tableView.dataSource = self
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
