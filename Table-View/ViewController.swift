//
//  ViewController.swift
//  Table-View
//
//  Created by TryCatch Classes on 17/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var ArtistL: UIButton!
    
    @IBOutlet weak var MusicL: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Action1(_ sender: Any) {
        let tap = storyboard?.instantiateViewController(withIdentifier: "ArtistVC") as! ArtistVC
        self.navigationController?.present(tap, animated: true)
    }
    
    @IBAction func Action2(_ sender: Any) {
        let tap = storyboard?.instantiateViewController(withIdentifier: "BandVC") as! BandVC
        self.navigationController?.pushViewController(tap, animated: true)
    }
}

