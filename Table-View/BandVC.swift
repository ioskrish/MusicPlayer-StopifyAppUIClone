//
//  BandVC.swift
//  Table-View
//
//  Created by TryCatch Classes on 17/09/22.
//

import UIKit

class BandVC: UIViewController {
    
    
    @IBOutlet weak var CustomTable: UITableView!
    
    var music = [ "Heat Waves", "Levitating", "Style", "Adore You", "Peaches", "Butter", "Maniac","I See Love", "STAY", "Jugnu"]
    var details = [ "Glass Animals", "Dua Lipa", "Taylor Swift", "Harry Styles", "Justin Beiber", "BTS","Canon Gray", "Jonas Blue, Joe Jonas", "The Kid LAROI, Justin Beiber", "Badshah Nikita Gandhi" ]
    
    var track = ["song1","song2","song3","song4","song5","song6","song7","song8","song9", "song10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomTable.dataSource = self
        CustomTable.delegate = self
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func go_back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension BandVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return music.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "block", for: indexPath) as! MusicTVC
        cell.cellview.layer.cornerRadius = 7
        cell.imgview.image = UIImage(named: music[indexPath.row])
        cell.HeadL1.text = music[indexPath.row]
        cell.Desc.text = details[indexPath.row]
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        cell.imgv2.image = UIImage(systemName: "list.bullet" ,withConfiguration: config)?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        cell.selectedBackgroundView = view
        //cell.backgroundColor = .green
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let touch = storyboard?.instantiateViewController(withIdentifier: "InVC") as! InVC
        touch.img = UIImage(named: music[indexPath.row])!
        touch.sname = music[indexPath.row]
        touch.s_artist = details[indexPath.row]
        touch.s_track = track[indexPath.row]
        self.navigationController?.present(touch, animated: true)
    }
    
}
