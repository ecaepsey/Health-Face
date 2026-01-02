//
//  String+Ext.swift
//  Health Face
//
//  Created by Damir Aushenov on 2/1/26.
//

import Foundation

extension String {
    public func localized(with arguments: [CVarArg]) -> String {
        return String(format: NSLocalizedString(self, comment: ""), locale: nil, arguments: arguments)
    }
}
