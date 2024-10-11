//
//  TeenipingView.swift
//  UMC CollectionView
//
//  Created by 이승준 on 10/11/24.
//

import UIKit

class TeenipingView: UIView {
    
    // Segment에 어떤 요소들이 있는지 설정
    let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
        //$0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    // Thread 1: "UlCollectionView must be initialized with a non-nil layout parameter"
    // 어떤 collectionViewLayout을 설정해주지 않으면 생기는 에러
    
    let teenipingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let divideLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        label.text = "휑~"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setUpView()
    }
    
    private func setUpView() {
        [
            segmentedControl,
            divideLine,
            teenipingCollectionView,
            emptyLabel,
        ].forEach{
            addSubview($0)
        }
        
        // horizontalEdges : 이거 뭐임? => 좌우
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.centerX.equalToSuperview()
        }
        
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        //        teenipingCollectionView.snp.makeConstraints { make in
        //            make.top.equalTo(divideLine.snp.bottom).offset(20)
        //            make.horizontalEdges.equalToSuperview().inset(19)
        //            make.bottom.equalToSuperview().inset(74)
        //        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(301)
            make.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
