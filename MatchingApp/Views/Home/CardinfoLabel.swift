//
//  CardinfoLabel.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/14.
//

import UIKit

class CardinfoLabel: UILabel {
    
    // nopeとgoodのラベル
    init(text: String, textColor: UIColor) {
        super.init(frame: .zero)
        
        font = .boldSystemFont(ofSize: 45)
        self.text = text
        self.textColor = textColor
        
        layer.borderWidth = 3
        layer.borderColor = textColor.cgColor
        layer.cornerRadius = 10
        
        textAlignment = .center
        alpha = 0
    }
    
    // その他のtextColorが白のラベル
    init(text: String, font: UIFont) {
        super.init(frame: .zero)
        
        self.font = font
        textColor = .white
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
