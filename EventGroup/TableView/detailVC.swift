//
//  detailVC.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/9/21.
//

import UIKit
import RealmSwift

class detailVC: UIViewController {
    
    var details : Event!
    
    weak var delegate : TVC!
    
    let realm = try! Realm()
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1)
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .black
        label.text = details.title
        self.navigationItem.titleView = label
        
        if let url = URL(string: details.imageURL!) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async { /// execute on main thread
                    self.eventImage.contentMode = UIView.ContentMode.scaleAspectFit
                    self.eventImage.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        
        let time = details.datetime_local!.split(separator: "T")
        timeStamp.text = time[0] + " " + time[1]
        
        location.text = details.extended_address

        if details.liked {
            likeButton.setImage(UIImage(named: "heart.fill"), for: .normal)
        } else{
            likeButton.setImage(UIImage(named: "heart.void"), for: .normal)
        }

        
    }
    
    @IBAction func onTap(_ sender: Any) {
        if !details.liked {
            likeButton.setImage(UIImage(named: "heart.fill"), for: .normal)
            
            try! realm.write{
                details!.liked = true
            }
        } else{
            likeButton.setImage(UIImage(named: "heart.void"), for: .normal)

            try! realm.write{
                details!.liked = false
            }
        }
    }
    
}
