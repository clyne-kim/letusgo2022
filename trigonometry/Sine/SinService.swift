//
//  let us: Go! 2022, fall
//  SinService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation
import CSInterface

public struct SinService {
    private let sineProtocol: SineProtocol
    private let cosineProtocol: CosineProtocol
    public init() {
        let container = DIContainer.shared
        guard let sineImpl = container.load(for: sinInjectId)?.resolve() as? SineProtocol,
              let cosineImpl = container.load(for: cosInjectId)?.resolve() as? CosineProtocol
        else {
            fatalError("[SinService] need to regist implementations")
        }
        self.sineProtocol = sineImpl
        self.cosineProtocol = cosineImpl
    }
    
    public func sine(_ x: Double) async throws -> Double {
        try await sineProtocol.sine(x)
    }
    
    public func sine2(_ x: Double) async throws -> Double {
        let sine = try await sine(x)
        let cosine = try await cosineProtocol.cosine(x)
        return 2 * sine * cosine
    }
}
