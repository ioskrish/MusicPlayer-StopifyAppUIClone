//
//  MusicTVC.swift
//  Table-View
//
//  Created by TryCatch Classes on 18/09/22.
//

import UIKit

class MusicTVC: UITableViewCell {
    
    
    @IBOutlet weak var cellview: UIView!
    
    
    @IBOutlet weak var imgview: UIImageView!
    
    
    @IBOutlet weak var HeadL1: UILabel!
    
    
    @IBOutlet weak var Desc: UILabel!
    
    
    @IBOutlet weak var imgv2: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
