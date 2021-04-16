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
    @IBOutlet weak var likeButton: UIButton!
    
    var liked = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onTapLike(_ sender: Any) {
        if liked {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            
        } else{
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        liked = !liked
    }
    
}
