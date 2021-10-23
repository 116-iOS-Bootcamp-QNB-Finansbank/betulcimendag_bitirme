//
//  TableListViewController.swift
//  todo-app
//
//  Created by Betül Çimendağ on 23.10.2021.
//

import UIKit

let myNotificationKey = "TableListChanged"

class TableListViewController: UIViewController, TableListViewProtocol{
        
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addTableNameButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                    
        presenter.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                                    selector: #selector(doAfterNotified),
                                                    name: NSNotification.Name(rawValue: myNotificationKey),
                                                    object: nil)
    }

    @objc func doAfterNotified() {
        self.presenter.viewDidLoad()
   }
        
    var presenter: TableListPresenterProtocol!
    var tableLists: [TableListPresentation] = []
    var filteredTableLists: [TableListPresentation] = []

    func handleOutput(_ output: TableListPresenterOutput) {
        switch output {
        case .showTableList(let tableLists):
            self.tableLists = tableLists
            filteredTableLists = tableLists
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func updateTableList() {
        self.presenter.viewDidLoad()
    }
    
    @IBAction func addTodoButtonTapped(_ sender: Any) {
        presenter.addRow()
        presenter.viewDidLoad()
    }
    
    
}

    extension TableListViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let indexPath2 : IndexPath = IndexPath(row: filteredTableLists[indexPath.row].index, section: 0)
            presenter.didSelectRow(at: indexPath2)
            
        }
        
    }

    extension TableListViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredTableLists.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableListTableViewCell", for: indexPath)
            cell.textLabel?.text = filteredTableLists[indexPath.row].title
            return cell
        }
        
    }

