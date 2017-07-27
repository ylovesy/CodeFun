class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var map : [Character : Int] = [Character : Int]()
        var collections: [Character: Int] = [:]
        
        for ch in magazine.characters {
            if let count = collections[ch] {
                collections[ch] = count + 1
            }else {
                collections[ch] = 1
            }
        }
        for ch in ransomNote.characters {
            if let count = collections[ch] {
                if count <= 0 {
                    return false
                } else {
                    collections[ch] = count - 1
                }
            } else {
                return false
            }
        }
        return true
    }
}
