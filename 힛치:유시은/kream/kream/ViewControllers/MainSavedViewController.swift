//
//  MainSavedViewController.swift
//  kream
//
//  Created by 유시은 on 10/1/24.
//

import UIKit

class MainSavedViewController: UIViewController {

    let savedData = dummySavedModel.savedDatas

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
    }

    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.savedTableView.dataSource = self
        view.savedTableView.delegate = self
        return view
    }()
}

extension MainSavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else{
            return UITableViewCell()
        }
        
        cell.configure(model: savedData[indexPath.row])
        
        return cell
    }
}

//import SwiftUI
//#Preview
//{
//    MainSavedViewController()
//}
