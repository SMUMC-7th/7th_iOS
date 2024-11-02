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
    
    //스크롤뷰 생성
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsVerticalScrollIndicator = true
        scrollview.showsHorizontalScrollIndicator = false
        //scrollview.contentSize = contentView.frame.size //이거 안해주면 scroll 안됨
        return scrollview
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "브랜드, 상품, 프로필, 태그 등"
        textField.layer.cornerRadius = 12
        textField.layer.backgroundColor = UIColor(hex: "#F5F5F5")?.cgColor
        textField.textColor = UIColor(hex: "#B6B6B6")
        textField.font = UIFont.systemFont(ofSize: 13.5)
        //placeholder padding 넣는법
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: textField.frame.height))
            textField.leftView = paddingView
            textField.leftViewMode = .always
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
        segmentedcontrol.apportionsSegmentWidthsByContent = true //글자 너비 맞춰주기
        
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
    
    private lazy var JustDroppedLabel : UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var JustDroppedDescriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "발매 상품"
        label.textColor = UIColor(hex: "#878787")
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    let justDroppedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 142, height: 237)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .clear
        collectionview.isScrollEnabled = true
        collectionview.register(JustDroppedCollectionViewCell.self, forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier)
        return collectionview
    }()
    
    private lazy var ChallengeLabel : UILabel = {
        let label = UILabel()
        label.text = "본격 한파대비! 연말 필수템 모음"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var ChallengeDescriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "#해피홀리룩챌린지"
        label.textColor = UIColor(hex: "#878787")
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    let challengeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 124, height: 165)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.backgroundColor = .clear
        collectionview.isScrollEnabled = true
        collectionview.register(ChallengeCollectionViewCell.self, forCellWithReuseIdentifier: ChallengeCollectionViewCell.identifier)
        return collectionview
    }()
    
    private lazy var divideLine : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        return view
    }()
    
    private lazy var divideLine2 : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F2F2F2")
        return view
    }()
    
    private func setConstraints() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(searchTextField)
        contentView.addSubview(alertButton)
        contentView.addSubview(segmentedControl)
        contentView.addSubview(adImage)
        contentView.addSubview(homeCollectionView)
        contentView.addSubview(divideLine)
        contentView.addSubview(JustDroppedLabel)
        contentView.addSubview(JustDroppedDescriptionLabel)
        contentView.addSubview(justDroppedCollectionView)
        contentView.addSubview(divideLine2)
        contentView.addSubview(ChallengeLabel)
        contentView.addSubview(ChallengeDescriptionLabel)
        contentView.addSubview(challengeCollectionView)
        
        
        scrollView.snp.makeConstraints {make in
            make.edges.equalTo(self.safeAreaLayoutGuide) // 스크롤 뷰 안전영역 지키기
        }
        
        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(challengeCollectionView.snp.bottom).offset(20) // 마지막 요소에 맞추어 설정
            make.width.equalTo(self.snp.width)
        }
        
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
        
        JustDroppedLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(19)
        }
        
        JustDroppedDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(JustDroppedLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(16)
        }
        
        justDroppedCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(JustDroppedDescriptionLabel.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview()
            make.width.equalTo(442)
            make.height.equalTo(237)
        }
        
        divideLine2.snp.makeConstraints{ make in
            make.top.equalTo(justDroppedCollectionView.snp.bottom).offset(30)
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        ChallengeLabel.snp.makeConstraints { make in
            make.top.equalTo(divideLine2.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(19)
        }
        
        ChallengeDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(ChallengeLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(16)
        }
        
        challengeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(ChallengeDescriptionLabel.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview()
            make.width.equalTo(388)
            make.height.equalTo(165)
            make.bottom.equalToSuperview().offset(-20)
        }
        
    }
}
