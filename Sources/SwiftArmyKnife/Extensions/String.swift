import Foundation

public extension String {
    subscript(r: ClosedRange<Int>) -> String {
        get {
            let si = self.index(startIndex, offsetBy: r.lowerBound)
            let ei = self.index(startIndex, offsetBy: r.upperBound)
            return String(self[si...ei])
        }
    }
    
    subscript(safe r: ClosedRange<Int>) -> String {
        get {
            if (r.lowerBound < 0 && r.upperBound < 0) {
                return ""
            }
            if (r.upperBound >= count && r.lowerBound >= count) {
                return ""
            }
            return self[min(max(r.lowerBound, 0), count - 1)...max(min(r.upperBound, count - 1), 0)]
        }
    }
    
    subscript(r: Range<Int>) -> String {
        get {
            let si = self.index(startIndex, offsetBy: r.lowerBound)
            let ei = self.index(startIndex, offsetBy: r.upperBound)
            return String(self[si..<ei])
        }
    }
    
    subscript(safe r: Range<Int>) -> String {
        get {
            return self[min(max(r.lowerBound, 0), count)..<max(min(r.upperBound, count), 0)]
        }
    }
    
    subscript(r: PartialRangeFrom<Int>) -> String {
        get {
            let si = self.index(startIndex, offsetBy: r.lowerBound)
            return String(self[si...])
        }
    }
    
    subscript(safe r: PartialRangeFrom<Int>) -> String {
        get {
            return self[(min(max(r.lowerBound, 0), count))...]
        }
    }
    
    subscript(r: PartialRangeUpTo<Int>) -> String {
        get {
            let ei = self.index(startIndex, offsetBy: r.upperBound)
            return String(self[..<ei])
        }
    }
    
    subscript(safe r: PartialRangeUpTo<Int>) -> String {
        get {
            return self[..<min(max(r.upperBound, 0), count)]
        }
    }
    
    subscript(r: PartialRangeThrough<Int>) -> String {
        get {
            let ei = self.index(startIndex, offsetBy: r.upperBound)
            return String(self[...ei])
        }
    }
    
    subscript(safe r: PartialRangeThrough<Int>) -> String {
        get {
            if (r.upperBound < 0) {
                return ""
            }
            return self[...min(max(r.upperBound, 0), count - 1)]
        }
    }
}
