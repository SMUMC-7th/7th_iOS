import UIKit

class HomeCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
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
        //image.clipsToBounds = true
        return imageview
    }()
    
    let titleLabel : UILabel = {
        let title = UILabel()
        title.font = .systemFont(ofSize: 11.5, weight: .light)
        title.textColor = .black
        
        return title
    }()
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.height.equalTo(61)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
