//
//  DropDownCell.swift
//  SignUpUsingTableView
//
//  Created by BS1010 on 29/9/22.
//

import UIKit
import DropDown


protocol DropDownCellDelegate{
    func sendDropDownCell(cell: DropDownCell)
}

class DropDownCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    var delegate: DropDownCellDelegate?
    
    let menu: DropDown = {
        let menu = DropDown()
        return menu
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.layer.cornerRadius = 10
        
        menu.anchorView = contentView
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTopItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        contentView.addGestureRecognizer(gesture)
        
    }
    
    @objc func didTapTopItem(){
        menu.show()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
//        print("something")
    }
}
