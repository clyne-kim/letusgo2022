//
//  let us: Go! 2022, fall
//  CosService.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//
    

import Foundation
import CSInterface
import MyDI

public struct CosService {
    private let sineProtocol: SineProtocol
    private let cosineProtocol: CosineProtocol
    public init() {
        let container = DIContainer.shared
        guard
            let sine주사기 = container.꺼내오기(key: "sineKey"),
            let cosine주사기 = container.꺼내오기(key: "cosineKey"),
            let sine구현 = sine주사기.주입() as? SineProtocol,
            let cosine구현 = cosine주사기.주입() as? CosineProtocol
        else {
            fatalError("[CosService] need to regist implementations")
        }
        self.sineProtocol = sine구현
        self.cosineProtocol = cosine구현
    }
    
    public func cosine(_ x: Double) async throws -> Double {
        try await cosineProtocol.cosine(x)
    }
    
    public func cosine2(_ x: Double) async throws -> Double {
        let sin = try await sineProtocol.sine(x)
        return 1 - 2 * sin * sin
    }
}





