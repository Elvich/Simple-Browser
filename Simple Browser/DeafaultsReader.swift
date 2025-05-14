//
//  DeafaultsReader.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 15.04.2025.
//

import Foundation

class DefaultsManager {
    // Singleton instance
    static let shared = DefaultsManager()
    
    private init() {}
    
    // Метод для получения значения по ключу
    func getValue<T>(forKey key: String) -> T? {
        let path = try! checkDefaultsFileExists()
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            if let result = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                return result[key] as? T
            }
        } catch {
            print("Ошибка при чтении файла Defaults.plist: \(error)")
        }
        return nil
    }
    
    func setValue<T>(_ value: T?, forKey key: String) -> Bool {
        let path = try! checkDefaultsFileExists()
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            if var result = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                result[key] = value
            }
            return true
        } catch {
            print("Ошибка при чтении файла Defaults.plist: \(error)")
            return false
        }
    }
    
    private func checkDefaultsFileExists() throws -> String {
        guard let path = Bundle.main.path(forResource: "Defaults", ofType: "plist") else {
            print("Файл Defaults.plist не найден")
            
            let error = NSError(domain: NSCocoaErrorDomain, code: 4, userInfo: [
                    NSLocalizedDescriptionKey: "Файл не найден."
                ])
            throw error
        }
        
        return path
    }
}
