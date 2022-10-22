//
//  let us: Go! 2022, fall
//  CosService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation
import CosineInterface

struct CosService: CosineServiceable {
    func cosine(_ x: Double) async throws -> Double {
        print("아주 복잡한 cosine 함수 계산 중")
        try await Task.sleep(nanoseconds: .oneSecond)
        let cos = String(format: "%.5f", Darwin.cos(x))
        return Double(cos) ?? 0.0
    }
}

extension UInt64 {
    static let oneSecond: UInt64 = 1_000_000_000
}
