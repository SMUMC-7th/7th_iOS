
import UIKit
import SnapKit

class ScrollView: UIView {

    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        
        scroll.backgroundColor = .gray
        
        // contentSize를 반드시 지정해주어야 한다. (없으면 스크롤이 안됨)
        // 스크롤할 수 있는 법위를 정의
            // 1. CGSize(width:height:) 를 이용하여 정의
            // 2.
        return scroll
    }()
    
    let imageView = UIImageView(image: UIImage(named: "largeImage"))

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
        scrollView.contentSize = imageView.bounds.size
    }

    private func addComponents() {
        self.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        scrollView.snp.makeConstraints { make in
            make.bottom.top.leading.trailing.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
