//
//  NewsDetailView.swift
//  NewsApplication
//
//  Created by Вадим Кононенко on 08.12.2024.
//

import UIKit

class NewsDetailView: UIViewController {
    
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
    
    // Титульная картинка новостей
    lazy var newsImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 300).isActive = true
        $0.image = UIImage(named: imageSource)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
          
        // Градиент
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.8).cgColor,
        ]
       gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.6) // Снизу
       gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)   // Сверху
       gradientLayer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)


      $0.layer.addSublayer(gradientLayer)
            
            return $0
        }(UIImageView())
    
//    Надпись источник
        lazy var sourceTextLabel: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalToConstant: 150).isActive = true
            $0.text = linkText
            $0.numberOfLines = 1
            $0.textColor = .white
            $0.font = .montserrat(.mRegular, 14)
//            $0.font = .systemFont(ofSize: 14, weight: .semibold)
            return $0
        }(UILabel())
        
//    Надпись дата
            lazy var dateTextLabel: UILabel = {
                $0.translatesAutoresizingMaskIntoConstraints = false
                $0.numberOfLines = 1
                $0.text = dateText
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
            
            scrollContent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            scrollContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            scrollContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            scrollContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            
            scrollContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            newsImage.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 0),
            newsImage.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: 0),
            newsImage.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 0),
            
            sourceTextLabel.bottomAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: -20),
            sourceTextLabel.leadingAnchor.constraint(equalTo: newsImage.leadingAnchor, constant: 30),
            
            dateTextLabel.bottomAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: -20),
            dateTextLabel.trailingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: -30),

            titleTextLabel.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 26),
            titleTextLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            titleTextLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            
            newsTextLabel.topAnchor.constraint(equalTo: titleTextLabel.bottomAnchor, constant: 26),
            newsTextLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            newsTextLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            
            goToSiteBtn.topAnchor.constraint(equalTo: newsTextLabel.bottomAnchor, constant: 30),
            goToSiteBtn.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            goToSiteBtn.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            
            scrollContent.bottomAnchor.constraint(equalTo: goToSiteBtn.bottomAnchor, constant: 30),
            
            
        ])
    }
}


