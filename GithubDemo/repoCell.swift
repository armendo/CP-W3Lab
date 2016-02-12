//
//  repoCell.swift
//  GithubDemo
//
//  Created by Fer on 2/11/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class repoCell: UITableViewCell {

  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var labelOwner: UILabel!
  @IBOutlet weak var labelStars: UILabel!
  @IBOutlet weak var labelForks: UILabel!
  @IBOutlet weak var labelDescription: UILabel!
  @IBOutlet weak var imageViewPhoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
