//
//  TableViewCell.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/9/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var liked: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.sizeToFit()
        location.sizeToFit()
        timeStamp.sizeToFit()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
