//
//  let us: Go! 2022, fall
//  TanService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation

struct TanService {
    let cosService: CosService
    let sinService: SinService
    
    func tangent(_ x: Double) async throws -> Double {
        let cosine = try await cosService.cosine(x)
        let sine = try await sinService.sine(x)
        return sine / cosine
    }
}