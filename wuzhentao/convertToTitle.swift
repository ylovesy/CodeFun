class Solution {
    func convertToTitle(_ n: Int) -> String {
        var s = n
        var str:String = ""
        
        while s > 0 {
            let r = s % 26
            s = s / 26
            
            if r == 0 {
                str = str + "Z"
                s -= 1
            } else {
                str = str +  String(Character(UnicodeScalar(Int((UnicodeScalar("A")?.value)!) + r - 1)!))
            }
            
        }
        let sddd = str.characters.reversed()
        return String(sddd)
    }
}

let s = Solution()
print(s.convertToTitle(37))
