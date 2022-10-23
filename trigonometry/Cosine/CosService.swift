//
//  let us: Go! 2022, fall
//  CosService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation
import CSInterface

public struct CosService {
    private let sineProtocol: SineProtocol
    private let cosineProtocol: CosineProtocol
    public init() {
        let container = DIContainer.shared
        guard let sineImpl = container.load(for: sinInjectId)?.resolve() as? SineProtocol,
              let cosineImpl = container.load(for: cosInjectId)?.resolve() as? CosineProtocol
        else {
            fatalError("[CosService] need to regist implementations")
        }
        self.sineProtocol = sineImpl
        self.cosineProtocol = cosineImpl
    }
    
    public func cosine(_ x: Double) async throws -> Double {
        try await cosineProtocol.cosine(x)
    }
    
    public func cosine2(_ x: Double) async throws -> Double {
        let sin = try await sineProtocol.sine(x)
        return 1 - 2 * sin * sin
    }
}





