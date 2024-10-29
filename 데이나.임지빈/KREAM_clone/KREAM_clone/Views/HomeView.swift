import UIKit
import SnapKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.layer.cornerRadius = 12
        textField.layer.backgroundColor = UIColor(hex: "#F5F5F5")?.cgColor
        textField.textColor = UIColor(hex: "#B6B6B6")
        textField.font = UIFont.systemFont(ofSize: 13.5)
        //placeholder padding 넣는법
        return textField
    }()
    
    private lazy var alertButton : UIButton = {
        let button = UIButton()
        button.setImage(.alert, for: .normal)
        return button
    }()
    
    let segmentedControl : UISegmentedControl = {
        let items = ["추천","랭킹","발매정보","럭셔리","남성","여성"]
        let segmentedcontrol = UISegmentedControl(items:items)
        segmentedcontrol.selectedSegmentIndex = 0
        segmentedcontrol.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedcontrol.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentedcontrol.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        segmentedcontrol.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        
        segmentedcontrol.setTitleTextAttributes(
                    [
                        NSAttributedString.Key.foregroundColor: UIColor.black,
                        .font: UIFont.systemFont(ofSize: 16, weight: .light)
                    ],
                    for: .normal
                )
        segmentedcontrol.setTitleTextAttributes(
                      [
                        NSAttributedString.Key.foregroundColor: UIColor.black,
                        .font: UIFont.systemFont(ofSize: 16, weight: .bold)
                      ],
                      for: .selected
                    )
        return segmentedcontrol
    }()
    
    public var adImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ad")
        imageView.contentMode = .scaleAspectFit // 이걸 빼면 여백 안생기는데 가로로 길어짐
        return imageView
    }()
    
    let homeCollectionView: UICollectionView = {
        // layout 따로 빼서 설정
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 61, height: 81)
        layout.minimumInteritemSpacing = 9 //셀 간 간격 조정해주는거 가로
        layout.minimumLineSpacing = 20 //셀 간 간격 조정해주기 세로
        layout.scrollDirection = .horizontal

        // collectionview
        let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        homeCollectionView.backgroundColor = .clear
        homeCollectionView.isScrollEnabled = true
        homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        return homeCollectionView
    }()
    
    private lazy var divideLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        return view
    }()
    
    private func setConstraints() {
        self.addSubview(searchTextField)
        self.addSubview(alertButton)
        self.addSubview(segmentedControl)
        self.addSubview(adImage)
        self.addSubview(homeCollectionView)
        self.addSubview(divideLine)
        
        searchTextField.snp.makeConstraints { make in
            make.width.equalTo(303)
            make.height.equalTo(40)
            //make.top.equalTo(self.safeAreaLayoutGuide).inset(6)//엥 왜 이거 없으니까 제대로 나옴 이거 있었을때 height가 안바꼇음
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(55)
        }
        
        alertButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(8)
            make.bottom.equalTo(searchTextField.snp.bottom).offset(-8)
            make.leading.equalTo(searchTextField.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(27)
            make.width.equalTo(325)
        }
        
        adImage.snp.makeConstraints{ make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(89)
            make.height.equalTo(361)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(0)
            //여기 constraint 다시 잡아야될듯,, 수치 x
        }
        
        homeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(adImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
            make.width.equalTo(341)
            make.height.equalTo(182)
        }
        
        divideLine.snp.makeConstraints { make in
            make.top.equalTo(homeCollectionView.snp.bottom).offset(30)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }
}
