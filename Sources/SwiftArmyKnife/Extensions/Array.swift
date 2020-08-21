import Foundation

public extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
    func grouping<T>(by keyForValue: (Element) -> T) -> Dictionary<T, Array<Element>> {
        return Dictionary(grouping: self, by: keyForValue)
    }
}
