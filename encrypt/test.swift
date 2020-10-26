//
//  test.swift
//  encrypt
//
//  Created by jack on 2020/10/26.
//

import Foundation

//Test:
let digest = "123456"
var chk = digest.md5()
print("digest: \(chk)")


var str = "123456"
print(str.sha256)
