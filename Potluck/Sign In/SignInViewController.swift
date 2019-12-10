//
//  SignInViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 11/6/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import GoogleSignIn
import AVFoundation
import AVKit

class SignInViewController: UIViewController{
    
    @IBOutlet weak var videoView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background video
        setupView()
        
        // Google Sign In stuff
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    @IBAction func testButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    @IBAction func googleSignButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toMenu", sender: self)
    }
    
    
    private func setupView(){
        
        guard let path = Bundle.main.path(forResource: "Sign in Video", ofType:"mov")
        else{
            return
        }
       
        let player = AVPlayer(url: NSURL(fileURLWithPath: path) as URL)
        
        let newLayer = AVPlayerLayer(player: player)
        newLayer.frame = self.videoView.frame
        self.videoView.layer.addSublayer(newLayer)
        newLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(SignInViewController.videoDidPlayToEnd(_:)),name: NSNotification.Name(rawValue: "AVPlayerItemDidPlayToEndTimeNotification"), object: player.currentItem)
    }
    
    @objc func videoDidPlayToEnd(_ notification: Notification){
        let player: AVPlayerItem = notification.object as! AVPlayerItem
        //player.seek(to: KCMTimeZero)
        player.seek(to: CMTime.zero)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
