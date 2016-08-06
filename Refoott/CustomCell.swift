//
//  CustomCell.swift
//  Refoott
//
//  Created by KAREN on 2016/08/05.
//  Copyright © 2016年 KAREN. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet var field3: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setCell(test :Test){
       self.label1.text = test.label1
       //self.label2.text = test.label2
    }
}
