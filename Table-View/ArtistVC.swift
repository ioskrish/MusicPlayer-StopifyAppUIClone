//
//  ArtistVC.swift
//  Table-View
//
//  Created by TryCatch Classes on 17/09/22.
//

import UIKit

class ArtistVC: UIViewController {
    
    
    @IBOutlet weak var NormalTable: UITableView!
    var artist = ["Taylor Swift", "Justin Beiber", "Selena Gomez", "Shawn Mendes", "Beyonce", "Harry Styles", "Zayn Malik", "DJ Khalid", "Ed Sherran", "Ellie Bellish", "Jonas Blue", "Mina Okabe", "Dua Lipa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NormalTable.dataSource = self
        NormalTable.delegate = self
    }
}

extension ArtistVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = UITableViewCell(style: .subtitle, reuseIdentifier: "info")
        info.backgroundColor = .black
        info.textLabel?.textColor = .white
        info.detailTextLabel?.textColor = .white
        info.textLabel?.text = artist[indexPath.row]
        info.detailTextLabel?.text = "\(indexPath.row)"
        info.detailTextLabel?.text = "Top BillBoard Artist"
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        info.selectedBackgroundView = view
        let config = UIImage.SymbolConfiguration(pointSize: 35)
        info.imageView?.image = UIImage(systemName: "music.note",withConfiguration: config)?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        return info
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
