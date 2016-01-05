//
//  ViewController.swift
//  ReactionGame
//
//  Created by HappyJedi on 05.01.16.
//  Copyright © 2016 HappyJedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var timerScore = NSTimer()
    
    var countInt = 0
    var ScoreInt = 0
    
    
    @IBOutlet weak var GetReadyLabel: UILabel!
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var StartButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ScoreInt = 0
        TimerLabel.text = String(ScoreInt)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func StartStop(sender: AnyObject) {
        
        if ScoreInt == 0 {
            
            countInt = 3
            GetReadyLabel.text = String(countInt)
            TimerLabel.text = String(ScoreInt)
            
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateCounter"), userInfo:nil, repeats: true)
            
            sender.setTitle("Start",forState: UIControlState.Normal)
            
        } else {
            
            timerScore.invalidate()
            
        }
        
        if countInt == 0 {
            
            ScoreInt = 0
            
            sender.setTitle("Restart", forState: UIControlState.Normal)
            
        }
        
    }
    
    func updateCounter() {
        
        countInt -= 1
        GetReadyLabel.text = String(countInt)
        
        if countInt == 0 {
            
            timer.invalidate()
            
            ScoreInt = 0
            TimerLabel.text = String(ScoreInt)
            
            timerScore = NSTimer.scheduledTimerWithTimeInterval(0.0001, target: self, selector: Selector("updateScoreTimer"), userInfo:nil, repeats: true)
            StartButton.setTitle("Stop", forState: UIControlState.Normal)
            
        }
        
    }
    
    func updateScoreTimer() {
        
        ScoreInt += 1
        TimerLabel.text = String(ScoreInt)
        
    }
    
}
