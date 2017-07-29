import Foundation

/*
 Given two arrays, write a function to compute their intersection.
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
 
 Note:
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 */
private class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let count = min(nums1.count, nums2.count)
        var minAry = nums1.count < nums2.count ? nums1 : nums2
        var maxAry = nums2.count > nums1.count ? nums2 : nums1
        var resAry = [Int]()
        for _ in 0 ..< count {
            if maxAry.contains(minAry[0]) {
                resAry.append(minAry[0])
                maxAry.remove(at: maxAry.index(of: minAry[0])!)
            }
            minAry.remove(at: 0)
        }
        return resAry
    }
}
