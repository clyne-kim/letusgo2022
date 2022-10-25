//
//  let us: Go! 2022, fall
//  SineInject.swift
//
//  Created by clyne.kim on 2022/10/24.
//  Copyright 2022 clyne.kim All rights reserved
//
    
import Foundation
import Sine
import MyDI

struct Sine주사기: Injectable {
    var key: String = "sineKey"
    
    func 주입() -> Any {
        SineProtocolImpl()
    }
}
