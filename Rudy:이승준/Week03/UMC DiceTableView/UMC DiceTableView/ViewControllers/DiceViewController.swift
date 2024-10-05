//
//  ViewController.swift
//  UMC DiceTableView
//
//  Created by 이승준 on 10/5/24.
//

import UIKit

class DiceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiceCell.identifier, for: indexPath) as? DiceCell else {
            return UITableViewCell()
        }
        
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    
    let data = dummyDiceModel.diceDatas
    
    private lazy var diceView: DiceView = {
        let view = DiceView()
        view.tableView.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = diceView
    }
    
    
}

