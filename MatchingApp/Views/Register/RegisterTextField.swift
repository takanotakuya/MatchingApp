//
//  RegisterTextField.swift
//  MatchingApp
//
//  Created by 髙野拓弥 on 2021/06/17.
//

import UIKit

class RegisterTextField: UITextField {
    
    init(plachHolder: String) {
        super.init(frame: .zero)
        
        placeholder = plachHolder
        borderStyle = .roundedRect
        font = .systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
