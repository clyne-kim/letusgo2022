//
//  let us: Go! 2022, fall
//  CosineServiceable.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//

public protocol CosineServiceable {
    func cosine(_ x: Double) async throws -> Double
}
