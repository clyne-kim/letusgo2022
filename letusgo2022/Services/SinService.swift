//
//  let us: Go! 2022, fall
//  SinService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation

struct SinService {
    func sine(_ x: Double) async throws -> Double {
        print("아주 복잡한 sine 함수 계산 중")
        try await Task.sleep(nanoseconds: .oneSecond)
        let sin = String(format: "%.5f", Darwin.sin(x))
        return Double(sin) ?? 0.0
    }
}
