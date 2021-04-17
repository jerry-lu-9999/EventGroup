//
//  detailVC.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/9/21.
//

import UIKit

class detailVC: UIViewController {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var likeButton: UIBarButtonItem!
    
    var details : Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .black
        label.text = details.title
        self.navigationItem.titleView = label
        
        view.backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1)
        
    }
    
    @IBAction func onTapLike(_ sender: Any) {
        
    }
    
}
