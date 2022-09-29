//
//  TableCellDataModel.swift
//  SignUpUsingTableView
//
//  Created by BS1010 on 29/9/22.
//

import Foundation

enum CellType {
    case DropDown
    case TextField
}

class TableCellDataModel{
    
    var label: String
    var type: CellType
    var dropDownValues: [String]?
    var value: String = ""
    
    init(label: String, type: CellType, dropDownValues: [String]?) {
        self.label = label
        self.type = type
        self.dropDownValues = dropDownValues
    }
}
