//
//  FourViewController.swift
//  Swift_my
//
//  Created by zzh_iPhone on 16/4/15.
//  Copyright © 2016年 zzh_iPhone. All rights reserved.
//

import UIKit

class FourViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
   
    //正向传值
    @IBOutlet weak var textField: UITextField!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       let sendVC = segue.destinationViewController as! sendViewController
      sendVC.gettext = textField.text!
    }

    //选择照片
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var chose: UIButton!
    
    
    @IBAction func choseBtn(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum)
        {
            imgPicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            imgPicker.allowsEditing = false
            
            self.presentViewController(imgPicker, animated: true, completion: { 
                
            })
        
        
        }
    }
    var imgPicker = UIImagePickerController()

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismissViewControllerAnimated(true) { 
            
        }
        img.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPicker.delegate = self
        img.backgroundColor = UIColor.yellowColor()
        // Do any additional setup after loading the view.
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
