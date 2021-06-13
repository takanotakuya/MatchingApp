//
//  TopControlView.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/13.
//

import UIKit

class TopControlView: UIView {
    
    let tinderButton = createTopButton()
    let goodButton = createTopButton()
    let commentButton = createTopButton()
    let profileButton = createTopButton()
    
    static private func createTopButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("tap", for: .normal)
        return button
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .purple
        
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton, goodButton, commentButton, profileButton])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 10
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ].forEach { $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


