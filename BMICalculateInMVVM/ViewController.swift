//
//  ViewController.swift
//  BMICalculateInMVVM
//
//  Created by Jhen Mu on 2022/4/20.
//

import UIKit

class ViewController: UIViewController {
    
    private let table = View()
    
    let viewModel = ViewModel()
    
    override func loadView() {
        super.loadView()
        view = table
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        viewModel.valueChanged = {
            DispatchQueue.main.async {
                self.table.tableView.reloadData()
            }
        }
    }
    
    private func setTableView(){
        table.tableView.delegate = self
        table.tableView.dataSource = self
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        cell.configuration(viewModel.getCellViewModel(indexPath))
        return cell
    }
}

