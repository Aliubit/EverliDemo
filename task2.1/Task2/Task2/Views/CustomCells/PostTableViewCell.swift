//
//  PostTableViewCell.swift
//  Task2
//
//  Created by Apple on 11/02/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var displayImageView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descLabel : UILabel!
    @IBOutlet weak var dateLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // This function is responsible for populating data in cell
    func updateCell(model : Post) {
        if let imageUrl = model.image {
            // by default setting the placeholder image, incase service response time is huge
            self.displayImageView.image = UIImage(named: "placeholder_post")
            AFManager.getImageFromUrl(urlString: imageUrl, completion: {
                image in
                if let image = image {
                    self.displayImageView?.image = image
                }
                else {
                    self.displayImageView?.image = nil
                }
            })
        }
        else {
            self.displayImageView?.image = nil
        }
        self.titleLabel.text = model.title
        self.descLabel.text = model.description
        // converting swift date to string to show in label
        if let date = model.publishedTime {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = Constants.dateFormat
            self.dateLabel.text = dateFormatter.string(from: date)
        }
    }

}
