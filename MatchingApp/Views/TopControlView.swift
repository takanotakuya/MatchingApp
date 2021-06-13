//
//  TopControlView.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/13.
//

import UIKit
import RxCocoa

class TopControlView: UIView {
    
    let tinderButton = createTopButton(imageName: "火の玉のアイコン素材")
    let goodButton = createTopButton(imageName: "ダイヤのマーク3")
    let commentButton = createTopButton(imageName: "吹き出しのアイコン3")
    let profileButton = createTopButton(imageName: "人物アイコン")
    
    static private func createTopButton(imageName: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupBindings()
    }
    
    private func setupLayout() {
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton, goodButton, commentButton, profileButton])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
        ].forEach { $0.isActive = true }
    }
    
    private func setupBindings() {
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


