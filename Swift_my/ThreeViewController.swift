//
//  ThreeViewController.swift
//  Swift_my
//
//  Created by zzh_iPhone on 16/4/15.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ThreeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    //collectionView
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var collection: UICollectionView!
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 120
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("reuseCell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.yellowColor()
        return cell
    }
    
    //播放本地音乐
    
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var dateAndTime: UILabel!
    var playVC = AVPlayerViewController()
    var playView = AVPlayer()
    
    @IBAction func playBtn(sender: UIButton) {
        let  pathVD = NSBundle.mainBundle().pathForResource("sampleVideo2", ofType: "mp4")
        let  fileURL = NSURL(fileURLWithPath: pathVD!)
        playView = AVPlayer(URL: fileURL)
        playVC.player = playView
        self.presentViewController(playVC, animated: true) { 
            self.playVC.player?.play()
        }
    }
    //当前时间
    @IBOutlet weak var time: UIButton!
    @IBOutlet weak var date: UILabel!
    
    @IBAction func timeBtn(sender: UIButton) {
        updateTime()
    }
    
    func updateTime() {
        let timestamp = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .MediumStyle)
        dateAndTime.text=timestamp
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        
        updateTime()
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
