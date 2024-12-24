//
//  View.ext.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

//Чтобы писать addSubviews(aaa, bbb,ccc)
extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}

//Загрузка одного изображения
extension UIImageView {
    func load(url: URL, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                    completion?() // Вызов колбэка после загрузки
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = UIImage(systemName: "link")
                    self?.tintColor = .black
                    completion?() // Все равно вызываем completion
                }
            }
        }
    }
}

//Вычисление пропорций изображения
extension UIImage {
    func getRatio() -> CGFloat {
        return self.size.height / self.size.width
    }
}
