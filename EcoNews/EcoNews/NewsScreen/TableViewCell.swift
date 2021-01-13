//
//  TableViewCell.swift
//  EcoNews
//
//  Created by Никита Ткаченко on 10.01.2021.
//

import UIKit
import SafariServices
class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelText: UILabel!

//        let svc = SFSafariViewController(url: URL(string: "https://nia.eco/2020/12/24/10468/")!)
//
//        present(svc, animated: true, completion: nil)
//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
