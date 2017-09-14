import Foundation

/*
 14. Longest Common Prefix
 Write a function to find the longest common prefix string amongst an array of strings.
 */
private class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        var prefixStr = strs[0]
        var idx = 0
        while idx < strs.count {
            while !strs[idx].hasPrefix(prefixStr) {
                prefixStr = prefixStr.substring(to: prefixStr.endIndex)
            }
            idx += 1
        }
        return prefixStr
    }
}
