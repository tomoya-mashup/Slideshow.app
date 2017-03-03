//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐々木 友也 on 2017/02/27.
//  Copyright © 2017年 tomoya.sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let image = ["amagasaka.jpg","koboya.jpg","sabu-hiro.jpg","aioi.jpg","shibafuku.jpg","choeido.JPG","himari.jpeg","tsubo.JPG"]
    
    var timer:Timer?
    
    var counter:Int = 0
    
   
    @IBOutlet weak var buttonPlayPause: UIButton!
    
    @IBOutlet weak var buttonBack: UIButton!
    
    @IBOutlet weak var buttonNext: UIButton!
    
    //再生ボタンを押した時のメソッド
    @IBAction func buttonPlayPause(_ sender: Any) {
        if self.timer != nil {
            
            buttonBack.isEnabled = true    //戻るボタンタップ可能
            buttonBack.setTitleColor(UIColor.darkGray, for: .normal)
            buttonNext.isEnabled = true    //次へボタンタップ可能
            buttonNext.setTitleColor(UIColor.darkGray, for: .normal)
            
            buttonPlayPause.setTitle("Play", for: UIControlState.normal)
            timer?.invalidate()
            timer = nil
            
        } else {
            buttonPlayPause.setTitle("Pause", for: UIControlState.normal)
            
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: (#selector(play)), userInfo: nil, repeats: true)
            buttonBack.isEnabled = false    //戻るボタンタップ不可
            buttonBack.setTitleColor(UIColor.lightGray, for: .normal)
            buttonNext.isEnabled = false    //次へボタンタップ不可
            buttonNext.setTitleColor(UIColor.lightGray, for: .normal)

        }
    }
  
    
    
    //戻るボタンを押した時のメソッド
    @IBAction func buttonBack(_ sender: Any) {
        counter = counter - 1
        
    //現在用意している画像が8枚なので、カウンターが-8より小さくなったら0になる
        if (counter < 0) {
            counter = 7
        }
        imageView.image = UIImage(named:image[counter])
    }
    
    //進むボタンを押した時のメソッド
    @IBAction func buttonNext(_ sender: Any) {
    //カウンターに1足して次の画像を表示させる
        counter = counter + 1
        
    //現在用意している画像は8枚なので、カウンターが8より大きくなったら0になる
        if ( counter > 7 ) {
            counter = 0
        }
        imageView.image = UIImage(named:image[counter])
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let closeUpViewController:CloseUpViewController = segue.destination as! CloseUpViewController
        closeUpViewController.image = imageView.image!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    func play () {
        counter = counter + 1
        
        if ( counter > 7 ){
            counter = 0
        }
        imageView.image = UIImage(named:image[counter])
    }


}

