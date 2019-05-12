//
//  ActorTableViewCell.swift
//  cjoTableViewer
//
//  Created by Thomas Morel on 4/28/19.
//  Copyright © 2019 OMJ. All rights reserved.
//

import UIKit

class ActorTableViewCell: UITableViewCell {

    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var urlLink: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
