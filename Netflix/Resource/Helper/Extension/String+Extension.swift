//
//  String+Extension.swift
//  Netflix
//
//  Created by Николай Игнатов on 07.02.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
