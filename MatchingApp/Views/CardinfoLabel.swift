//
//  CardinfoLabel.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/14.
//

import UIKit

class CardinfoLabel: UILabel {
    
    // nopeとgoodのラベル
    init(frame: CGRect, labaeText: String, labelColor: UIColor) {
        super.init(frame: frame)
        
        font = .boldSystemFont(ofSize: 45)
        text = labaeText
        textColor = labelColor
        
        layer.borderWidth = 3
        layer.borderColor = labelColor.cgColor
        layer.cornerRadius = 10
        
        textAlignment = .center
        alpha = 0
    }
    
    // その他のtextColorが白のラベル
    init(frame: CGRect, labelText: String, labelFont: UIFont) {
        super.init(frame: frame)
        
        font = labelFont
        textColor = .white
        text = labelText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
