import UIKit

class NewsCell: UITableViewCell {

    static let reuseId = "NewsCell"
    
    lazy var backView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 30
//      $0.heightAnchor.constraint(equalToConstant: 200).isActive = true
        $0.backgroundColor = .systemGray6
        return $0
    }(UIView())
    
    lazy var backImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 163).isActive = true
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.contentMode = .scaleToFill
        return $0
    }(UIImageView())
    
//    lazy var nameSurname: UILabel = AppLabel(labelFont: .systemFont(ofSize: 24, weight: .black), labelText: "", labelColor: .white)
    
//    lazy var insideText: UILabel = AppLabel(labelFont: .systemFont(ofSize: 14, weight: .light), labelText: "", labelColor: .white)

    lazy var smallImage1: UIImageView = createImage()
    
    lazy var smallImage2: UIImageView = createImage()
    
    lazy var smallImage3: UIImageView = createImage()
    
    lazy var blackButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 15
        $0.setTitle("Press me", for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return $0
    }(UIButton())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(backView)
        
        backView.addSubview(backImage)
        backView.addSubview(smallImage1)
        backView.addSubview(smallImage2)
        backView.addSubview(smallImage3)
        backView.addSubview(blackButton)
    }
    
    func setupView(item: NewsEntity){
        backImage.image = UIImage(named: item.thumbnail)
        smallImage1.image = UIImage(named: item.thumbnail)
        smallImage2.image = UIImage(named: item.thumbnail)
        smallImage3.image = UIImage(named: item.thumbnail)
        
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
           
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            backImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            backImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            backImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            
            smallImage1.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            smallImage1.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 16),
            smallImage1.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 0.3, constant: -8),

            smallImage2.centerXAnchor.constraint(equalTo: backView.centerXAnchor, constant: 0),
            smallImage2.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 16),
            smallImage2.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 0.3, constant: -8),
        
            smallImage3.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            smallImage3.topAnchor.constraint(equalTo: backImage.bottomAnchor, constant: 16),
            smallImage3.widthAnchor.constraint(equalTo: backView.widthAnchor, multiplier: 0.3, constant: -8),
            
            blackButton.topAnchor.constraint(equalTo: smallImage1.bottomAnchor, constant: 16),
            blackButton.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            blackButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            
            backView.bottomAnchor.constraint(equalTo: blackButton.bottomAnchor, constant: 15)

        ])
    }
    


    private func createImage() -> UIImageView {
        {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.contentMode = .scaleToFill
            return $0
        }(UIImageView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
