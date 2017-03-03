//
//  CloseUpViewController.swift
//  SlideshowApp
//
//  Created by 佐々木 友也 on 2017/02/28.
//  Copyright © 2017年 tomoya.sasaki. All rights reserved.
//

import UIKit

class CloseUpViewController: UIViewController {
   
    @IBOutlet weak var imageView: UIImageView!
    
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    imageView.image = image
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
