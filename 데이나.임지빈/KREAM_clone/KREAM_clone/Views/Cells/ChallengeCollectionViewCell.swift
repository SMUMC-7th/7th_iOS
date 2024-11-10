import UIKit

class ChallengeCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "ChallengeCollectionViewCell"
    
    override init(frame: CGRect){
        super.init(frame:frame)
        setUpView()
    }
    
    //필수로 들어가는 코드
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView : UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 8
        imageview.clipsToBounds = true //이거 추가 안하면 모서리 안잘림
        return imageview
    }()
    
    let idLabel : UILabel = {
        let id = UILabel()
        id.font = .systemFont(ofSize: 12, weight: .bold)
        id.textColor = .white
        
        return id
    }()
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(idLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.equalTo(124)
            make.height.equalTo(165)
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(140)
            make.height.equalTo(14)
            make.leading.equalTo(imageView.snp.leading).inset(10)
        }
    }
}

