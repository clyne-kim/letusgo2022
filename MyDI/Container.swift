//
//  let us: Go! 2022, fall
//  DIContainable.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//

import Foundation

public protocol DIContainable {
    func 등록하기(주사기: Injectable.Type)
    func 꺼내오기(key: String) -> Injectable?
}

public class DIContainer: DIContainable {
    private var injections: [String: Injectable] = [:]
    public static let shared: DIContainer = DIContainer()
    
    public func 등록하기(주사기: Injectable.Type) {
        let injection = 주사기.init()
        injections[injection.key] = injection
    }
    
    public func 꺼내오기(key: String) -> Injectable? {
        injections[key]
    }
}
