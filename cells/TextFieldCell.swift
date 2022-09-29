//
//  TextFieldCell.swift
//  SignUpUsingTableView
//
//  Created by BS1010 on 29/9/22.
//

import UIKit

class TextFieldCell: UITableViewCell {
    
    var placeHolderText: String = ""
    
    @IBOutlet weak var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)
//        print("hello")
        // Configure the view for the selected state
    }
    
}
