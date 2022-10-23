//
//  let us: Go! 2022, fall
//  TanService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation
import CSInterface

public struct TanService {
    private let sineProtocol: SineProtocol
    private let cosineProtocol: CosineProtocol
    public init() {
        let container = DIContainer.shared
        guard let sineImpl = container.load(for: sinInjectId)?.resolve() as? SineProtocol,
              let cosineImpl = container.load(for: cosInjectId)?.resolve() as? CosineProtocol
        else {
            fatalError("need to regist implementations")
        }
        self.sineProtocol = sineImpl
        self.cosineProtocol = cosineImpl
    }
    
    public func tangent(_ x: Double) async throws -> Double {
        let cosine = try await cosineProtocol.cosine(x)
        let sine = try await sineProtocol.sine(x)
        return sine / cosine
    }
}
