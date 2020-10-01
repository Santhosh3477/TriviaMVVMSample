//
//  DetailTableViewCell.swift
//  QuizTask
//
//  Created by Santhosh on 01/10/20.
//  Copyright © 2020 Contus. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    // Label to display game number and date and time of game submission
    @IBOutlet weak var gamedateLabel: UILabel!
    // This outlet displays the username registered
    @IBOutlet weak var usernameLabel: UILabel!
    // These outlets displays the answers
    @IBOutlet weak var ans1Label: UILabel!
    @IBOutlet weak var ans2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
