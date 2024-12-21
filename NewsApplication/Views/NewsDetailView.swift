import UIKit

protocol NewsDetailViewControllerProtocol: AnyObject{
    var imageSource: String {set get}
    var titleText: String {set get}
    var dateText: String {set get}
    var descrText: String {set get}
    var linkText: String {set get}
}

class NewsDetailView: UIViewController, NewsDetailViewControllerProtocol  {
    
    var presenter: NewsDetailViewPresenterProtocol!

    var imageSource: String = ""
    var titleText: String = ""
    var dateText: String = ""
    var descrText: String = ""
    var linkText: String = ""
    
    lazy var scrollView: UIScrollView = {
        $0.backgroundColor = .clear
        $0.addSubview(scrollContent)
        return $0
    }(UIScrollView(frame: view.frame))
    
    lazy var scrollContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubviews(newsImage, sourceTextLabel, dateTextLabel, dateTextLabel, titleTextLabel, newsTextLabel, goToSiteBtn)
        return $0
    }(UIView())
  
//    Изображение для новости с градиентом
    lazy var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        if let url = URL(string: imageSource), !imageSource.isEmpty {
            imageView.load(url: url) { [weak self] in
                guard let self = self, let loadedImage = imageView.image else { return }
                
                // Обновляем констрейнты высоты после загрузки изображения
                NSLayoutConstraint.deactivate(imageView.constraints)
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: loadedImage.getRatio())
                ])
                self.view.layoutIfNeeded()
            }
            imageView.contentMode = .scaleAspectFill
        } else {
            imageView.image = UIImage(systemName: "link")
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = .black
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        }
        // Градиентный слой
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        imageView.layer.addSublayer(gradientLayer)
        return imageView
    }()
    
//    Надпись источник
        lazy var sourceTextLabel: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 210).isActive = true
         
//            Обрезаю с ссылки только домен
            if linkText != "Нет ссылки" {
                if let url = URL(string: linkText) {
                    let domain = url.host
                    $0.text = domain?.description ?? "Нет ссылки"
                }}
            else {$0.text = "Нет ссылки"}
            
            $0.numberOfLines = 1
            $0.textColor = .white
            $0.font = .montserrat(.mRegular, 14)
            return $0
        }(UILabel())
        
//    Надпись дата
            lazy var dateTextLabel: UILabel = {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.numberOfLines = 1
                $0.widthAnchor.constraint(equalToConstant: 120).isActive = true
                $0.textAlignment = .right
                
                //        Конвертирую дату
                        if dateText != "", dateText != "Нет даты" {
                            let isoDate = dateText
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
                                $0.text = formattedDate // Результат: "24.11.2024"
                            } else {
                                $0.text = "Нет даты"
                            }}
                        else {
                            $0.text = "Нет даты"
                        }
                
                $0.textColor = .white
                $0.font = .montserrat(.mRegular, 14)
//                $0.font = .systemFont(ofSize: 14, weight: .semibold)
                return $0
            }(UILabel())
        
//    Надпись заголовок
            lazy var titleTextLabel: UILabel = {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.numberOfLines = 0
                $0.text = titleText
                $0.textColor = .black
                $0.font = .montserrat(.mBold, 20)
//                $0.font = .systemFont(ofSize: 20, weight: .black)
                return $0
            }(UILabel())
        
//    Основной текст статьи
            lazy var newsTextLabel: UILabel = {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.numberOfLines = 0
                $0.text = descrText
                $0.textColor = .black
                $0.font = .montserrat(.mRegular, 16)
//                $0.font = .systemFont(ofSize: 16, weight: .light)
                return $0
            }(UILabel())

    
    // Кнопка перейти на источник
    lazy var goToSiteBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 58).isActive = true
        $0.layer.cornerRadius = 30
        $0.setTitle("Перейти на сайт", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        return $0
    }(UIButton(primaryAction: goToSiteBtnAction))
    
    // Здесь переход по ссылке происходит
    lazy var goToSiteBtnAction: UIAction = UIAction { [weak self] _ in
        guard let url = URL(string: self!.linkText) else {
              print("Некорректный URL")
              return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Новость"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubviews(scrollView)
        
        setupConstraints()
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // Привязка scrollContent к scrollView
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: newsTextLabel.bottomAnchor, constant: 20), // Нижняя граница контента

            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // Привязки для элементов внутри scrollContent
            newsImage.topAnchor.constraint(equalTo: scrollContent.topAnchor),
            newsImage.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor),

            sourceTextLabel.bottomAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: -20),
            sourceTextLabel.leadingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: 20),

            dateTextLabel.bottomAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: -20),
            dateTextLabel.trailingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: -20),

            titleTextLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 26),
            titleTextLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            titleTextLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),

            newsTextLabel.topAnchor.constraint(equalTo: titleTextLabel.bottomAnchor, constant: 26),
            newsTextLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            newsTextLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),

            // Привязка кнопки goToSiteBtn к нижней части экрана
            goToSiteBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            goToSiteBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            goToSiteBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            goToSiteBtn.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
}


