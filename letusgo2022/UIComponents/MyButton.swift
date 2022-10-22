//
//  let us: Go! 2022, fall
//  MyButton.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation
import UIKit

final class MyButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        titleLabel?.font = .systemFont(ofSize: 50, weight: .bold)
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.blue : UIColor.systemBlue
        }
    }
}
