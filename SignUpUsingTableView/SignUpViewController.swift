//
//  ViewController.swift
//  SignUpUsingTableView
//
//  Created by BS1010 on 29/9/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let cellSpacingHeight: CGFloat = 5
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        for i in tableCells{
            print(i.value)
        }
    }
    
    var tableCells = [TableCellDataModel]()
    
    let dropDownCellId = "DropDownCell"
    
    let textFieldCellId = "TextFieldCell"

    override func viewDidLoad() {
        super.viewDidLoad()
         
        tableView.register(UINib.init(nibName: dropDownCellId, bundle: nil), forCellReuseIdentifier: dropDownCellId)
        
        tableView.register(UINib.init(nibName: textFieldCellId, bundle: nil), forCellReuseIdentifier: textFieldCellId)
        
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = UITableView.automaticDimension
//        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let nationalityDropDownValues: [String] = [
            "Bangladeshi",
            "Indian",
            "Pakistani"
        ]
        
        let idDropDownValues: [String] = [
            "IC",
            "National ID"
        ]
        
        tableCells.append(TableCellDataModel(label: "Select Nationality*", type: CellType.DropDown, dropDownValues: nationalityDropDownValues))
        
        tableCells.append(TableCellDataModel(label: "Mobile Number", type: CellType.TextField, dropDownValues: nil))
        
        tableCells.append(TableCellDataModel(label: "ID Type*", type: CellType.DropDown, dropDownValues: idDropDownValues))
        
        tableCells.append(TableCellDataModel(label: "Email", type: CellType.TextField, dropDownValues: nil))
        
        tableCells.append(TableCellDataModel(label: "Referral Code", type: CellType.TextField, dropDownValues: nil))
        
    }


}

extension SignUpViewController: UITableViewDataSource, UITextFieldDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableCells.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tableCell = tableCells[indexPath.section]
        
        if tableCell.type == CellType.DropDown {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: dropDownCellId, for: indexPath) as! DropDownCell
            
            cell.cellLabel.text = tableCell.label
            
            cell.menu.dataSource = tableCell.dropDownValues ?? ["Null"]
            
            cell.menu.selectionAction = { index, title in
                print("Index \(index) and \(title)")
                cell.cellLabel.text = title
                self.tableCells[indexPath.section].value = title
            }
            
            return cell
            
        }
        else{

            let cell = tableView.dequeueReusableCell(withIdentifier: textFieldCellId, for: indexPath) as! TextFieldCell
            
            cell.textField.delegate = self
            
            cell.textField.tag = indexPath.section
            
            cell.textField.placeholder = tableCell.label
            
            return cell
            
        }
        
    }
    
     func textFieldDidChangeSelection(_ textField: UITextField) {
        tableCells[textField.tag].value = textField.text ?? ""
         print(textField.text ?? "")
        }
    
}

extension SignUpViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item at \(indexPath.section)")
    }
    
}

