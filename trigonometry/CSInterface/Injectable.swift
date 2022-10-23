//
//  let us: Go! 2022, fall
//  Injectable.swift
//
//  Created by clyne.kim on 2022/10/22.
//  Copyright 2022 clyne.kim All rights reserved
//

import Foundation

public protocol Injectable {
  init()
  var id: String { get }
  func resolve() -> Any
}
