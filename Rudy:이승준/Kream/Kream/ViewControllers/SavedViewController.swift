//
//  SavedViewController.swift
//  Kream
//
//  Created by 이승준 on 9/29/24.
//

import UIKit
import SnapKit

class SavedViewController: UIViewController {
    
    let data = SavedProducts.data
    
    private lazy var savedTableView :SavedTableView = {
        let view = SavedTableView(frame: .zero, total: data.count)
        view.savedTableView.dataSource = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedTableView
    }
    
}

extension SavedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedTableViewCell.identifier, for: indexPath) as? SavedTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(product: data[indexPath.row])
        
        return cell
    }
}

import SwiftUI
#Preview {
    SavedViewController()
}
