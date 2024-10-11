
import UIKit

class TeenipingCollectionViewCell : UICollectionViewCell {
    //식별자로 사용할 identifier 변수 선언
    static let identifier = "TeenipingCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.layer.cornerRadius = 8
        imageview.clipsToBounds = true
        return imageview
    }()
    
    //이름 label
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10,weight: .semibold)
        label.textColor = .black
        label.text = "티니핑"
        return label
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(4)
        }
    }
}
