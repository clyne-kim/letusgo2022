//
//  let us: Go! 2022, fall
//  TanService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation
import CosineInterface
import Sine

public struct TanService {
    let cosService: CosineServiceable
    let sinService: SinService
    
    public init(cosService: CosineServiceable,
                sinService: SinService) {
        self.cosService = cosService
        self.sinService = sinService
    }
    
    public func tangent(_ x: Double) async throws -> Double {
        let cosine = try await cosService.cosine(x)
        let sine = try await sinService.sine(x)
        return sine / cosine
    }
}

extension UInt64 {
    static let oneSecond: UInt64 = 1_000_000_000
}
