//
//  JSONDecoder.swift
//  Sports App
//
//  Created by MAC on 19/06/2022.
//

import Foundation

// generic to work with any codable

func convertFromJson<T:Codable>(data:Data) -> T? {
    let decoder     = JSONDecoder()
    let decodedData = try? decoder.decode(T.self, from: data)
    return decodedData
}
