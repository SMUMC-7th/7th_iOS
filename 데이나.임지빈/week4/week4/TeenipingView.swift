import UIKit
import SnapKit

class TeenipingView: UIView {
    //segmentedControl : 티니핑, not 티니핑을 눌렀을때 화면에 나타나는 컴포넌트 바꿔줌
    let segmentedControl: UISegmentedControl = {
        //아이템으로 티니핑, not 티니핑 가지고있음
        let control = UISegmentedControl(items: ["티니핑", "not 티니핑"])
        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        control.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        control.selectedSegmentIndex = 0 //선택된 세그먼트는 인덱스를 활용해 관리됨
        control.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        control.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
        return control
    }()

    
    //teenipingcollectionview 속성 구현
    let teenipingCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 162, height: 144) // 고정 크기 설정
        layout.minimumInteritemSpacing = 12 // 아이템 간 간격
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) 
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false // 스크롤 불가
        collectionView.register(TeenipingCollectionViewCell.self, forCellWithReuseIdentifier: TeenipingCollectionViewCell.identifier) // 셀 등록
        
        return collectionView
    }()


    //segmented control과 뷰를 구분해줌
    private let divideLine: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        return line
    }()
    
    //not 티니핑을 눌렀을때 나타나는 label
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.textColor = .black
        label.text = "휑~"
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        [
            segmentedControl,
            teenipingCollectionView,
            divideLine,
            emptyLabel
        ].forEach {
            addSubview($0)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview() //길이를 제한하지않도록 설정
            make.height.equalTo(30)
        }
        
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
        }
        
        teenipingCollectionView.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(20)
            make.horizontalEdges.equalToSuperview().inset(19)
            make.bottom.equalToSuperview().inset(74)
        }
        
        emptyLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(301)
            make.centerX.equalToSuperview()
        }
    }
     
}

