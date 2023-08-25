//
//  FileManager-DocumentDirectory.swift
//  BucketList
//
//  Created by Alex Bonder on 8/25/23.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = Self.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func store<T: Codable>(content: T, inFile fileName: String) {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        
        if let encoded = try? JSONEncoder().encode(content) {
            do {
                try encoded.write(to: url)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func retrieve<T: Codable>(_ t: T.Type, from fileName: String) throws -> T? {
        let url = getDocumentsDirectory().appendingPathComponent(fileName)
        let decoder = JSONDecoder()
        
        do {
            let savedData = try Data(contentsOf: url)
            
            let decodedData = try decoder.decode(T.self, from: savedData)
            return decodedData
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
