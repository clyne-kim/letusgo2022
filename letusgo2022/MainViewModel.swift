//
//  let us: Go! 2022, fall
//  MainViewModel.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//

import Foundation
import Cosine
import Sine
import Tangent

struct MainViewModel {
    let sinService: SinService
    let cosService: CosService
    let tanService: TanService
    
    func tangent(_ x: Double) async throws -> Double {
        try await tanService.tangent(x)
    }
    
    func sine(_ x: Double) async throws -> Double {
        try await sinService.sine(x)
    }
    
    func cosine(_ x: Double) async throws -> Double {
        try await cosService.cosine(x)
    }
}
