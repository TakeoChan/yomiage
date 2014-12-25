//
//  ViewController.swift
//  SpeechEx
//
//  Created by 永山 豪雄 on 2014/12/25.
//  Copyright (c) 2014年 supertakeocreaters. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var speechText: UITextField!
    @IBOutlet weak var speadLabel: UILabel!
    @IBOutlet weak var voiceHeihgt: UISlider!
    @IBOutlet weak var voice: UILabel!
    
    var speed : Float = 0.0
    var hight : Float = 0.0
    


    
    /** SpeechSynthesizerクラス */
    var talker = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    /** ボタンが押された時の処理 */
    @IBAction func didTapButton(sender: UIButton)
    {
        println("Voice!")
        // 話す内容をセット
        let utterance = AVSpeechUtterance(string:self.speechText.text)
        // 言語を日本に設定
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        // 話す速度を設定（0.0〜1.0）
        utterance.rate = speed
        // 声の高さを設定（0.5〜2.0）
        utterance.pitchMultiplier = hight
        
        // 実行
        self.talker.speakUtterance(utterance)
    }
    
    @IBAction func changedSlider(sender : UISlider){
        speed = Float (sender.value)
        speadLabel.text = "\(sender.value)"
    }

    @IBAction func changedSliderVoice(sender : UISlider){
        hight = Float (sender.value)
        voice.text = "\(sender.value)"
    }

}

