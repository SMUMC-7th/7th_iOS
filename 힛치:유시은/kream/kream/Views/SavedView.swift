//
//  SavedView.swift
//  kream
//
//  Created by 유시은 on 10/6/24.
//

import UIKit

class SavedView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var savedTitle: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    private lazy var savedListNumber: UILabel = {
        let label = UILabel()
        // SavedModel개수 받아오도록 바꾸기
        let numberOfItems = dummySavedModel.savedDatas.count
        label.text = "전체 \(numberOfItems)개"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // MainSavedViewController에서 접근 가능하도록 public
    public lazy var savedTableView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        return table
    }()
    
    // addComponents가 아닌 setViews와 setConstraints로 나누는 이유가 있는지?
    private func setViews() {
        self.addSubview(savedTitle)
        self.addSubview(savedListNumber)
        self.addSubview(savedTableView)
    }
    
    private func setConstraints() {
        savedTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(61)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(302)
        }
        
        savedListNumber.snp.makeConstraints {
            $0.top.equalTo(savedTitle.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(13)
            $0.trailing.equalToSuperview().offset(325)
        }
        
        savedTableView.snp.makeConstraints {
            $0.top.equalTo(savedListNumber.snp.bottom).offset(12)
            $0.left.right.bottom.equalToSuperview()
        }
    }
}

import SwiftUI
#Preview
{
    MainSavedViewController()
}
