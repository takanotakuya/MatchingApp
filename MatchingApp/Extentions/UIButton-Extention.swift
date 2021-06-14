//
//  UIButton-Extention.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/14.
//

import UIKit

extension UIButton {
    
    func createCardInfoButton() -> UIButton {
        self.setImage(UIImage(named: "インフォメーションアイコン4")?.resize(size: .init(width: 40, height: 40)), for: .normal)
        self.tintColor = .white
        self.imageView?.contentMode = .scaleAspectFit
        return self
    }
    
}
