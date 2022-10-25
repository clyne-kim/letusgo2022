//
//  let us: Go! 2022, fall
//  CosineInject.swift
//
//  Created by clyne.kim on 2022/10/24.
//  Copyright 2022 clyne.kim All rights reserved
//

import Foundation
import Cosine
import MyDI

struct CosineInject: Injectable {
    var id: String = "cosineKey"
    
    func resolve() -> Any {
        CosineProtocolImpl()
    }
}
