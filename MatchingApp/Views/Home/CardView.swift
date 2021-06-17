//
//  CardView.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/13.
//

import UIKit

class CardView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    // MARK: UIViews
    private let cardImageView = CardImageView(frame: .zero)
    private let infoButton = UIButton(type: .system).createCardInfoButton()
    private let nameLabel = CardinfoLabel(labelText: "Taro, 22", labelFont: .systemFont(ofSize: 40, weight: .heavy))
        private let residenceLabel = CardinfoLabel(labelText: "日本、大阪", labelFont: .systemFont(ofSize: 20, weight: .regular))
    private let hobbyLabel = CardinfoLabel(labelText: "ランニング", labelFont: .systemFont(ofSize: 25, weight: .regular))
    private let introductionLabel = CardinfoLabel(labelText: "走り回るのが大好きです", labelFont: .systemFont(ofSize: 25, weight: .regular))
    private let goodLabel = CardinfoLabel(labaeText: "GOOD", labelColor: .rgb(red: 137, green: 223, blue: 86))
    private let nopeLabel = CardinfoLabel(labaeText: "NOPE", labelColor: .rgb(red: 222, green: 110, blue: 110))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupGradietntLayer()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView))
        self.addGestureRecognizer(panGesture)
    }
    
    private func setupGradietntLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.3, 1.1]
        cardImageView.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.bounds
    }
    
    @objc private func panCardView(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        
        if gesture.state == .changed {
            
            self.handlePanChenge(translation: translation)
            
        } else if gesture.state == .ended {
            self.handlePanEnded()
        }
    }
    
    private func handlePanChenge(translation: CGPoint) {
        let degree: CGFloat = translation.x / 20
        let angle = degree * CGFloat.pi / 100
        
        let rotateTranslation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotateTranslation.translatedBy(x: translation.x, y: translation.y)
        
        let ratio: CGFloat = 1 / 100
        let ratioValue = ratio * translation.x
        
        if translation.x > 0 {
            self.goodLabel.alpha = ratioValue
        } else if translation.x < 0 {
            self.nopeLabel.alpha = -ratioValue
        }
        
    }
    
    private func handlePanEnded() {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
            self.transform = .identity
            self.layoutIfNeeded()
            self.goodLabel.alpha = 0
            self.nopeLabel.alpha = 0
        }
    }
    
    private func setupLayout() {
        let infoVerticalStackView = UIStackView(arrangedSubviews: [residenceLabel, hobbyLabel, introductionLabel])
        infoVerticalStackView.axis = .vertical
        
        let baseStackView = UIStackView(arrangedSubviews: [infoVerticalStackView, infoButton])
        baseStackView.axis = .horizontal
        
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(baseStackView)
        addSubview(goodLabel)
        addSubview(nopeLabel)
        
        cardImageView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 10, rightPadding: 10)
        infoButton.anchor(width: 30)
        baseStackView.anchor(bottom: cardImageView.bottomAnchor, left: cardImageView.leftAnchor, right: cardImageView.rightAnchor, bottomPadding: 20, leftPadding: 20, rightPadding: 20)
        nameLabel.anchor(bottom: baseStackView.topAnchor, left: cardImageView.leftAnchor, bottomPadding: 10, leftPadding: 20)
        goodLabel.anchor(top: cardImageView.topAnchor, left: cardImageView.leftAnchor, width: 140, height: 55, topPadding: 25, leftPadding: 20)
        nopeLabel.anchor(top: cardImageView.topAnchor, right: cardImageView.rightAnchor, width: 140, height: 55, topPadding: 25, rightPadding: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
