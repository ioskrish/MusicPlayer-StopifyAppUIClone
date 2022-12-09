//
//  InVC.swift
//  Table-View
//
//  Created by TryCatch on 20/09/22.
//

import UIKit
import AVFoundation
import AVKit


class InVC: UIViewController {
    
    @IBOutlet weak var inside_view: UIView!
    @IBOutlet weak var Songimg: UIImageView!
    @IBOutlet weak var Songname: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var SongArtist: UILabel!
    @IBOutlet weak var like: UIButton!

    
    var img = UIImage()
    var sname = ""
    var s_artist = ""
    var s_track = " "
    
    var audioPlayer : AVAudioPlayer!
    
    var  mytimer : Timer?
    var  reversing : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Songimg.image = img
        Songname.text = sname
        SongArtist.text = s_artist
        
        reversing = false;
        mytimer =  Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

        
        guard let url = Bundle.main.url(forResource: s_track, withExtension: ".mp3") else {
            print("error to get the mp3 file")
            return
        }
        
        do {
             try audioPlayer =  AVAudioPlayer(contentsOf: url)
        } catch {
            print("audio file error")
        }
        
        audioPlayer?.play()
    }
    
    @IBAction func likebtn(_ sender: UIButton) {
        if like.tag == 0 {
            like.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), for: .normal)
           like.tag = 1
        }
        else
        {
           like.setImage(UIImage(systemName: "heart"), for: .normal)
            like.tag = 0
        }
    }
    

    @IBAction func playpausebutton(_ sender: UIButton) {
        
        if audioPlayer.isPlaying {
            audioPlayer.pause()
                sender.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
                if mytimer != nil {
                mytimer!.invalidate()
                mytimer = nil
          }
            } else {
                audioPlayer.play()
                sender.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
                mytimer =  Timer.scheduledTimer(timeInterval: 0.85, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
}
        
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
            audioPlayer?.pause()
            if mytimer != nil {
            mytimer!.invalidate()
            mytimer = nil
          }
         
    }
    
    @objc func timerAction(){
        let sliderrange =  Slider.maximumValue - Slider.minimumValue;
        let increment = sliderrange/100;
        var newval = Slider.value;

        newval = reversing! ? (Slider!.value - increment) : (Slider!.value + increment);

        if(newval <= 0)
        {
          reversing = false;
        }
         Slider.setValue(newval, animated: true)
    }
  }


