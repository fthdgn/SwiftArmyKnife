import Foundation

public extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func grouping<T>(by keyForValue: (Element) -> T) -> Dictionary<T, Array<Element>> {
        return Dictionary(grouping: self, by: keyForValue)
    }
    
    subscript(safe r: ClosedRange<Int>) -> ArraySlice<Element> {
        get {
            if (r.lowerBound < 0 && r.upperBound < 0) {
                return .init()
            }
            if (r.upperBound >= count && r.lowerBound >= count) {
                return .init()
            }
            return self[Swift.min(Swift.max(r.lowerBound, 0), count - 1)...Swift.max(Swift.min(r.upperBound, count - 1), 0)]
        }
    }
    
    subscript(safe r: Range<Int>) -> ArraySlice<Element> {
        get {
            return self[Swift.min(Swift.max(r.lowerBound, 0), count)..<Swift.max(Swift.min(r.upperBound, count), 0)]
        }
    }
    
    subscript(safe r: PartialRangeFrom<Int>) -> ArraySlice<Element> {
        get {
            return self[(Swift.min(Swift.max(r.lowerBound, 0), count))...]
        }
    }
    
    subscript(safe r: PartialRangeUpTo<Int>) -> ArraySlice<Element> {
        get {
            return self[..<Swift.min(Swift.max(r.upperBound, 0), count)]
        }
    }
    
    subscript(safe r: PartialRangeThrough<Int>) -> ArraySlice<Element> {
        get {
            if (r.upperBound < 0) {
                return .init()
            }
            return self[...Swift.min(Swift.max(r.upperBound, 0), count - 1)]
        }
    }
    
}

public extension Array where Element: Equatable {
    func deduped() -> [Element] {
        var result: [Element] = []
        for value in self {
            if (!result.contains(value)) {
                result.append(value)
            }
        }
        return result
    }
}
