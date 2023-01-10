//
//  String+Helpers.swift
//
//  Created by Benjamin Caceres on 28-03-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import Foundation

// MARK: - Helpers
extension String {
    var hyphened: String {
        var mutableSelf = self

        guard !mutableSelf.isEmpty else { return "-" }

        guard mutableSelf.count > 1 else { return "-\(mutableSelf)" }

        let indexToInsertHyphen = mutableSelf.index(before: mutableSelf.endIndex)
        
        mutableSelf.insert("-", at: indexToInsertHyphen)
        
        return mutableSelf
    }

    func addDecimalDots() -> String? {
        let numberFormatter = NumberFormatter()

        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: .appLocale)

        guard let asInt = Int(self) else { return nil }

        return numberFormatter.string(from: NSNumber(value: asInt))
    }

    func toDate(with format: String, timeZone: TimeZone = .init(abbreviation: "UTC")!) -> Date? {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone

        return dateFormatter.date(from: self)
    }
    
    func getRutVd(value: String) -> (run: String, dv: String) {
        if (value.isEmpty || value.count < 2) { return (.empty, .empty) }
        
        var rut = value.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range: nil)
        rut = rut.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        let dv = String(rut.last!)
        let run = String(rut.dropLast())
        
        return (run, dv)
    }
    
    func validateVd(rut: String) -> String? {
        var acumulated = 0
        var ti = 2
        
        stride(from: rut.count - 1, through: 0, by: -1).forEach {
            index in

            let n = Array(rut)[index]
            let nl = String(n)

            guard let vl = Int(nl) else { return }

            acumulated += vl * ti

            if ti == 7 { ti = 1 }

            ti += 1
        }
        
        let resto: Int = acumulated % 11
        let numericDigit = 11 - resto
        var digit = ""
        
        if (numericDigit <= 9) { digit = String(numericDigit) }
        else if (numericDigit == 10) { digit = "K" }
        else { digit = "0" }

        return digit
    }
    
    func isRut() -> Bool {
        var rut = self.replacingOccurrences(of: ".", with: "", options: .literal, range : nil)
        rut = rut.replacingOccurrences(of: "-", with: "", options: .literal, range : nil)
        rut = rut.uppercased()
        
        if (rut.count < 8 || rut.count > 10) { return false }
        
        let rutRegex = "^(\\d{1,3}(\\.?\\d{3}){2})\\-?([\\dkK])$"
        let rutTest = NSPredicate(format: "SELF MATCHES %@", rutRegex)

        if !rutTest.evaluate(with: rut) { return false }
        
        let runTovalidate = getRutVd(value: self)
        
        let rutNumber = runTovalidate.run
        let rutDV = runTovalidate.dv
        
        let calculatedDV = validateVd(rut: rutNumber)

        return rutDV.uppercased() == calculatedDV
    }

    func isValidEmail() -> Bool {
        guard !self.lowercased().hasPrefix("mailto:") else { return false }

        guard let emailDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return false }
        
        let matches = emailDetector.matches(
            in: self,
            options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: self.count)
        )
        
        guard matches.count == 1 else { return false }
        
        return matches[0].url?.scheme == "mailto"
    }
}
