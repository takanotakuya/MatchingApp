//
//  ViewController.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView()
        view1.backgroundColor = .yellow
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = UIView()
        view3.backgroundColor = .green
        
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: view.topAnchor),
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor)].forEach { $0.isActive = true }
        
    }


}

