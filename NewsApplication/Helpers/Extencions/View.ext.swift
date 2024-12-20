//
//  View.ext.swift
//  NewsPostVK
//
//  Created by Олег Дмитриев on 07.12.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}

//Загрузка одного изображения
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
                else {
                    DispatchQueue.main.async {
                        self?.image = UIImage(systemName: "externaldrive.trianglebadge.exclamationmark")
                    }
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
