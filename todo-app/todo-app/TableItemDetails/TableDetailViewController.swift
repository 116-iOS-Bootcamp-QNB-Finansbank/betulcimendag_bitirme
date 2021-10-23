//
//  TableDetailViewController.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import UIKit

class TableDetailViewController: UIViewController  {

    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var itemDetail: UITextField!

    @IBOutlet weak var itemEndTime: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    let myNotificationKey = "table list updated"

    var item : TableListEntity
    
    var viewModel: TableDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                                   selector: #selector(doThisWhenNotify),
                                                   name: NSNotification.Name(rawValue: myNotificationKey),
                                                   object: nil)
    }

    @objc func doThisWhenNotify() {
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        if (!viewModel.isEmpty()){
            viewModel.deleteItem()
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: myNotificationKey), object: self)

            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let itemNameText = itemName.text, !itemNameText.isEmpty else { return }
        guard let itemDetailText = itemDetail.text, !itemDetailText.isEmpty else { return }
        
        let tableDetailPresentation = TableDetailPresentation(name: itemNameText, detail: itemDetailText, finishTime: itemEndTime.date)
        
        viewModel.saveItem(tableDetailPresentation: tableDetailPresentation)
            
        NotificationCenter.default.post(name: Notification.Name(rawValue: myNotificationKey), object: self)
        
        navigationController?.popViewController(animated: true)
    }
}

extension TableDetailViewController: TableDetailViewModelDelegate {
   
    func showTableDetail(_ item: TableDetailPresentation) {
        itemName.text = item.name
        itemDetail.text = item.detail
       
    }
}

