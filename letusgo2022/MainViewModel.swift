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
    private let sinService: SinService = .init()
    private let cosService: CosService = .init()
    private let tanService: TanService = .init()
    
    func tangent(_ x: Double) async throws -> Double {
        try await tanService.tangent(x)
    }
    
    func sine(_ x: Double) async throws -> Double {
        try await sinService.sine(x)
    }
    
    func cosine(_ x: Double) async throws -> Double {
        try await cosService.cosine(x)
    }
    
    // MARK: 추가된 기능
    
    func sine2(_ x: Double) async throws -> Double {
        try await sinService.sine2(x)
    }
    
    func cosine2(_ x: Double) async throws -> Double {
        try await cosService.cosine2(x)
    }
}
