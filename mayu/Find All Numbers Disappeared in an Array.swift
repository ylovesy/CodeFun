import Foundation

/*

 448. Find All Numbers Disappeared in an Array
 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.
 
 Find all the elements of [1, n] inclusive that do not appear in this array.
 
 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 
 Example:
 
 Input:
 [4,3,2,7,8,2,3,1]
 
 Output:
 [5,6]
 */
private class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var ary = nums
        for i in 0 ..< ary.count {
            let index = abs(ary[i]) - 1
            if ary[index] > 0 {
                ary[index] = -ary[index]
            }
        }
        var resAry = [Int]()
        for i in 0 ..< ary.count {
            if ary[i] > 0 {
                resAry.append(i + 1)
            }
        }
        return resAry
    }
}
