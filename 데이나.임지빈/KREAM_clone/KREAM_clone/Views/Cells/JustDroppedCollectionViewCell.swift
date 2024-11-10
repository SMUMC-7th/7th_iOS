import UIKit

class JustDroppedCollectionViewCell : UICollectionViewCell {
    
    static let identifier = "JustDroppedCollectionViewCell"
    
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
        imageview.clipsToBounds = true
        return imageview
    }()
    
    let brandLabel : UILabel = {
        let brand = UILabel()
        brand.font = .systemFont(ofSize: 12, weight: .bold)
        brand.textColor = .black
        return brand
    }()
    
    let nameLabel : UILabel = {
        let name = UILabel()
        name.font = .systemFont(ofSize: 12, weight: .light)
        name.textColor = .black
        name.lineBreakMode = .byWordWrapping //단어 단위로 줄 바꿔주는거
        name.numberOfLines = 2 //2줄
        return name
    }()
    
    let priceLabel : UILabel = {
        let price = UILabel()
        price.font = .systemFont(ofSize: 13, weight: .bold)
        price.textColor = .black
        return price
    }()
    
    let pricedescriptionLabel : UILabel = {
        let description = UILabel()
        description.font = .systemFont(ofSize: 10, weight: .light)
        description.textColor = UIColor(hex: "#A2A2A2")
        return description
    }()
    
    private func setUpView() {
        addSubview(imageView)
        addSubview(brandLabel)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(pricedescriptionLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.width.height.equalTo(142)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.height.equalTo(14)
            make.leading.equalToSuperview().offset(4)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(brandLabel.snp.bottom).offset(3)
            make.width.equalTo(imageView.snp.width)
            make.leading.equalToSuperview().offset(4)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(65)
            make.leading.equalToSuperview().offset(4)
            make.height.equalTo(16)
        }
        
        pricedescriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.top.equalTo(priceLabel.snp.bottom).offset(2)
            make.height.equalTo(12)
        }
    }
}

