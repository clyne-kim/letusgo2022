//
//  let us: Go! 2022, fall
//  SineInject.swift
//
//  Created by clyne.kim on 2022/10/24.
//  Copyright 2022 clyne.kim All rights reserved
//
    
import Foundation
import CSInterface
import Sine
import MyDI

struct SineInject: Injectable {
    var id: String = sinInjectId
    
    func resolve() -> Any {
        SineProtocolImpl()
    }
}
