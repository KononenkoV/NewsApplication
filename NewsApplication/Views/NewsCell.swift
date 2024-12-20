import UIKit

class NewsCell: UITableViewCell {

    static let reuseId = "NewsCell"
    lazy var isPressedHeart: Bool = false
    
// Вью подложка
    lazy var backView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.backgroundColor = .appNewsBackgorundGray
        return $0
    }(UIView())
    
// Титульная картинка новостей
    lazy var newsImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true

        return $0
    }(UIImageView())
    
// Звездочка избранного
    lazy var starBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 21).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 21).isActive = true
        $0.setImage(isPressedHeart ? .starFilled : .star,  for: .normal)
        $0.tintColor = .black
        return $0
    }(UIButton(primaryAction: starBtnAction))
    
    
// Экшен звездочки избранного
    lazy var starBtnAction: UIAction = UIAction { [weak self] _ in
        self?.isPressedHeart.toggle()
        self?.starBtn.setImage(self!.isPressedHeart ? .starFilled : .star,  for: .normal)
          }
    
// Надпись источник
    lazy var sourceText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.widthAnchor.constraint(equalToConstant: 210).isActive = true
        $0.numberOfLines = 1
        $0.textColor = .black
        $0.font = .montserrat(.mRegular, 14)
        return $0
    }(UILabel())
    

//    Надпись дата
        lazy var dateText: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 120).isActive = true
            $0.textAlignment = .right
            $0.numberOfLines = 1
            $0.textColor = .appGrayText
            $0.font = .montserrat(.mRegular, 14)
            return $0
        }(UILabel())
    
//    Надпись заголовок
        lazy var titleText: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            $0.textColor = .black
            $0.font = .montserrat(.mBold, 20)
            return $0
        }(UILabel())
    
//    Основной текст статьи
        lazy var newsText: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 6
            $0.textColor = .black
//            $0.font = .systemFont(ofSize: 16, weight: .light)
            $0.font = .montserrat(.mRegular, 16)
            return $0
        }(UILabel())

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(backView)
        backView.addSubview(newsImage)
        backView.addSubview(starBtn)
        backView.addSubview(sourceText)
        backView.addSubview(dateText)
        backView.addSubview(titleText)
        backView.addSubview(newsText)
    }

// Настройка ячейки
    func setupView(item: Article){

//        Загружаю изображение или пустышку
        if let imageUrl = item.urlToImage {
            newsImage.load(url: URL(string: imageUrl)!)
            newsImage.contentMode = .scaleAspectFill
        } else {newsImage.image = UIImage(systemName: "link")
            newsImage.contentMode = .scaleAspectFit
            newsImage.tintColor = .black
        }
        
//      Проверяю ссылку, обзераю домен
        if let url = URL(string: item.url!) {
           let domain = url.host
            sourceText.text = domain?.description ?? "Нет ссылки"
            }
        else {sourceText.text = "Нет ссылки"}
        
//        Конвертирую дату
        if let isoDate = item.publishedAt {
// Создаем ISO8601 DateFormatter для парсинга строки
            let isoDateFormatter = ISO8601DateFormatter()
            isoDateFormatter.formatOptions = [.withInternetDateTime]
            
// Парсим строку в дату
            if let date = isoDateFormatter.date(from: isoDate) {
                // Создаем DateFormatter для преобразования в желаемый формат
                let outputFormatter = DateFormatter()
                outputFormatter.dateFormat = "dd.MM.yyyy"
                
                // Конвертируем дату в строку
                let formattedDate = outputFormatter.string(from: date)
                dateText.text = formattedDate // Результат: "24.11.2024"
            } else {
                dateText.text = "Нет даты"
            }}
        else {
            dateText.text = "Нет даты"
        }
        
        titleText.text = item.title ?? "Нет названия"
        newsText.text = item.content ?? "Нет статьи"
 
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
           
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            newsImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 0),
            newsImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 0),
            newsImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: 0),
            newsImage.heightAnchor.constraint(equalTo: backView.widthAnchor, multiplier: newsImage.image?.getRatio() ?? 0.7),
            
            starBtn.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            starBtn.topAnchor.constraint(equalTo: backView.topAnchor, constant: 20),
            
            sourceText.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 18),
            sourceText.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10),
            
            dateText.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -18),
            dateText.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 10),
            
            titleText.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 18),
            titleText.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -18),
            titleText.topAnchor.constraint(equalTo: sourceText.bottomAnchor, constant: 10),
            
            newsText.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 18),
            newsText.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -18),
            newsText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 10),
            
           backView.bottomAnchor.constraint(equalTo: newsText.bottomAnchor, constant: 20)
        ])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
