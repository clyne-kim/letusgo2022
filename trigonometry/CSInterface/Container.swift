//
//  let us: Go! 2022, fall
//  DIContainable.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//

import Foundation

public protocol DIContainable {
  func regist(injectType: Injectable.Type)
  func load(for injectId: String) -> Injectable?
}

public class DIContainer: DIContainable {
  private var injections: [String: Injectable] = [:]
  public static let shared: DIContainer = DIContainer()

  public func regist(injectType: Injectable.Type) {
    let injection = injectType.init()
    injections[injection.id] = injection
  }

  public func load(for injectId: String) -> Injectable? {
    return injections[injectId]
  }
}
