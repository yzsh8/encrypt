//
//  md5.swift
//  encrypt
//
//  Created by jack on 2020/10/26.
//

import Foundation
import CommonCrypto


extension String {
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        return String(format: hash as String)
    }
    
    var sha256: String {
            let utf8 = cString(using: .utf8)
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
            CC_SHA256(utf8, CC_LONG(utf8!.count - 1), &digest)
            return digest.reduce("") { $0 + String(format:"%02x", $1) }
        }
}
