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

struct Cosine주사기: Injectable {
    var key: String = "cosineKey"
    
    func 주입() -> Any {
        CosineProtocolImpl()
    }
}
