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

    var talker = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapButton(sender: UIButton)
    {
        println("Voice!")
        let utterance = AVSpeechUtterance(string:self.speechText.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
        utterance.rate = speed
        utterance.pitchMultiplier = hight
        
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