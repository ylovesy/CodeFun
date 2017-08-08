//
//  Solution.swift
//  wendSolution
//
//  Created by Wend on 2017/7/10.
//  Copyright © 2017年 wend. All rights reserved.
//

import UIKit
import Foundation

class Solution: NSObject {
    //MARK: - 1 Aarry hash
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var array = [Int]()
        for i in 0 ..< nums.count-1 {
            let destination = target - nums[i]
            for j in i+1 ..< nums.count {
                if nums[j] == destination {
                    array.append(i)
                    array.append(j)
                }
            }
        }
        return array
    }
    func twoSumImprove(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0 ..< nums.count-1 {
            let destination = target - nums[i]
            for j in i+1 ..< nums.count {
                if nums[j] == destination {
                    return [i,j]
                }
            }
        }
        return []
    }
    func twoSumBest(_ nums: [Int], _ target: Int) -> [Int] {
        let count = nums.count
        var m: [Int: Int] = [:]
        for index in (0..<count) {
            let value = nums[index]
            if let idx = m[target - value] {
                return [idx, index]
            }
            m[value] = index
        }
        
        return []
    }
    
    //MARK: - 344. Reverse String
    func reverseString(_ s: String) -> String {
        var result = ""
        for character in s.characters.reversed() {
            result.append(character)
        }
        return result
    }
    func reverseStringImprove(_ s: String) -> String {
        var arr = Array(s.characters)
        let numOfArr = arr.count
        for index in 0 ..< numOfArr/2 {
            let char = arr[index]
            arr[index] = arr[numOfArr - 1 - index]
            arr[numOfArr - 1 - index] = char
        }
        return String(arr)
    }
    func reverseStringBest(_ s: String) -> String {
        let arr = Array(s.characters)
        var result: String = ""
        for i in 0 ..< arr.count {
            result.append(arr[arr.count - 1 - i])
        }
        return result
    }
    
    //MARK: - 461. Hamming Distance
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var diffent = x ^ y
        var count = 0
        while diffent > 0 {
            if diffent % 2 == 1 {
                count = count + 1
            }
            diffent /= 2
        }
        return count
    }
    func hammingDistanceBest(_ x: Int, _ y: Int) -> Int {
        var z = x ^ y
        var count = 0
        repeat {
            if (z >> 1) << 1 != z {
                count += 1
                z = z >> 1
            } else {
                z = z >> 1
            }} while z != 0
        return count
    }
    //MARK: - 617. Merge Two Binary Trees
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if  t1 != nil && t2 != nil {
            t1?.val += (t2?.val)!
        } else if t1 != nil && t2 == nil {
            return t1
        } else if t1 == nil && t2 != nil {
            return t2
        }
        t1?.left = self.mergeTrees(t1?.left, t2?.left)
        t1?.right = self.mergeTrees(t1?.right, t2?.right)
        return t1
    }
    func mergeTreesImprove(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        if t1 == nil {
            return t2
        } else if t2 == nil {
            return t1
        } else if t1 != nil && t2 != nil {
            t1?.val += (t2?.val)!
        }
        t1?.left = self.mergeTrees(t1?.left, t2?.left)
        t1?.right = self.mergeTrees(t1?.right, t2?.right)
        return t1
    }
    
    //MARK: - 26. Remove Duplicates from Sorted Array
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var count = 0
        for num in nums {
            if nums[count] != num {
                nums[count] = num;
                count += 1
            } else {
                
            }
        }
        return count + 1
    }
    func removeDuplicatesImprove(_ nums: inout [Int]) -> Int {
        let total = nums.count
        if total < 2 {
            return total;
        }
        
        var count = 0
        for index in 0 ..< total {
            if nums[count] != nums[index] {
                count += 1
                nums[count] = nums[index];
            }
        }
        return count + 1
    }
    
    //MARK: - 283. Move Zeroes
    func moveZeroes(_ nums: inout [Int]) {
        let count = nums.count;
        var zeroIndex = 0;
        for i in 0 ..< count {
            if nums[i] != 0 {
                while nums[zeroIndex] != 0 && zeroIndex < i {
                    zeroIndex += 1
                }
                let tmp = nums[i]
                nums[i] = nums[zeroIndex]
                nums[zeroIndex] = tmp
            }
        }
    }
    func moveZeroesImprove(_ nums: inout [Int]) {
        var begin = 0
        var end = 0
        while end < nums.count {
            if nums[end] != 0 {
                let temp = nums[end]
                nums[end] = nums[begin]
                nums[begin] = temp
                begin += 1
            }
            end += 1
        }
    }
    
    //MARK: - 128. Longest Consecutive Sequence
    func longestConsecutive(_ nums: [Int]) -> Int {
        let count = nums.count
        var best = 0
        var existDict:[Int:Int] = [:]
        var visitDict:[Int:Int] = [:]
        for num in nums {
            existDict[num] = 1
        }
        for num in nums {
            if visitDict[num] == 1 {
                continue
            }
            visitDict[num] = 1
            var length = 0
            for index in 0 ..< count {
                if existDict[num - index] == 1 {
                    visitDict[num - index] = 1
                    length += 1
                } else {
                    break;
                }
            }
            best = max(best, length)
        }
        return best
    }
    func longestConsecutiveBest(_ nums: [Int]) -> Int {
        let hash = Set(nums)
        var longestSeqLength = 0
        for n in nums {
            if !hash.contains(n - 1) { // First element in sequence
                var currentSeqLength = 1
                var m = n + 1
                while hash.contains(m) { // Check if consecutive numbersa are in hash
                    currentSeqLength += 1
                    m += 1
                }
                if currentSeqLength > longestSeqLength {
                    longestSeqLength = currentSeqLength
                }
            }
        }
        
        return longestSeqLength
    }
    
    //MARK: - 27. Remove Element
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for j in 0 ..< nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
    func removeElementBest(_ nums: inout [Int], _ val: Int) -> Int {
        var count = 0
        var i = 0
        while (i < nums.count) {
            if (nums[i] == val) {
                count += 1
            }
            else {
                nums[i - count] = nums[i]
            }
            i += 1
        }
        return nums.count - count
    }
    
    //MARK: - 3Sum
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count < 3 {
            return []
        }
        var result:[[Int]] = [];
        for i in 0 ..< count - 2 {
            for j in i+1 ..< count - 1 {
                for k in j+1 ..< count {
                    if nums[i] + nums[j] + nums[k] == 0 {
                        var have = false
                        for var tmp in result {
                            if tmp.contains(nums[i]) {
                                tmp.remove(at: tmp.index(of: nums[i])!)
                                if tmp.contains(nums[j]) {
                                    have = true
                                }
                            }
                        }
                        if have == false {
                            result.append([nums[i],nums[j],nums[k]])
                        }
                        
                    }
                }
            }
        }
        return result;
    }
    func threeSumImprove(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        if count < 3 {
            return []
        }
        let sortedNums = nums.sorted()
        var result:[[Int]] = [];
        var dict1:[Int:Int] = [:]
        for i in 0 ..< count - 2 {
            if dict1[sortedNums[i]] == 1 {
                continue
            }
            var dict2:[Int:Int] = [:]
            for j in i+1 ..< count - 1 {
                for k in j+1 ..< count {
                    if dict2[sortedNums[k]] == 1 || dict2[sortedNums[j]] == 1{
                        continue
                    }
                    if sortedNums[i] + sortedNums[j] + sortedNums[k] == 0 {
                        result.append([sortedNums[i],sortedNums[j],sortedNums[k]])
                        dict2[sortedNums[k]] = 1
                        dict2[sortedNums[j]] = 1
                    }
                }
            }
            dict1[sortedNums[i]] = 1
        }
        return result;
    }
    
    //MARK: - 628 Maximum Product of Three Numbers
    func maximumProduct(_ nums: [Int]) -> Int {
        let count = nums.count
        if count < 3{
            return 0
        }
        let sortedNums = Array(nums.sorted().reversed())
        if sortedNums[count-1] > 0 || sortedNums[0] < 0 {
            return sortedNums[0] * sortedNums[1] * sortedNums[2]
        } else if (sortedNums[count-1] < 0 && sortedNums[count - 2] < 0) {
            let num1 = sortedNums[0] * sortedNums[1] * sortedNums[2]
            let num2 = sortedNums[0] * sortedNums[count-1] * sortedNums[count - 2]
            return num1 > num2 ? num1 : num2
        }
        return 0
    }
    func maximumProductImprove(_ nums: [Int]) -> Int {
        let count = nums.count
        if count < 3{
            return 0
        }
        let sortedNums = nums.sorted()
        let num1 = sortedNums[0] * sortedNums[1] * sortedNums[count - 1]
        let num2 = sortedNums[count - 3] * sortedNums[count-1] * sortedNums[count - 2]
        return num1 > num2 ? num1 : num2
    }
    func maximumProductBest(_ nums: [Int]) -> Int {
        let count = nums.count
        if count < 3{
            return 0
        }
        var min1 = Int.max
        var min2 = Int.max
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for n in nums {
            
            if n > max1 {
                max3 = max2
                max2 = max1
                max1 = n
            } else if n > max2 {
                max3 = max2
                max2 = n
            } else if n > max3 {
                max3 = n
            }
            
            if n < min1 {
                min2 = min1
                min1 = n
            } else if n < min2 {
                min2 = n
            }
        }
        return max(max1*max2*max3, max1*min1*min2);
    }
    //MARK: - 17. Letter Combinations of a Phone Number
    func letterCombinations(_ digits: String) -> [String] {
        if digits.characters.count == 0 {
            return []
        }
        let lettersOfNums : [Character : [String]] = ["1":[],
                                                      "2":["a", "b", "c"],
                                                      "3":["d", "e", "f"],
                                                      "4":["g", "h", "i"],
                                                      "5":["j", "k", "l"],
                                                      "6":["m", "n", "o"],
                                                      "7":["p", "q", "r", "s"],
                                                      "8":["t", "u", "v"],
                                                      "9":["w", "x", "y", "z"]]
        
        let characters = [Character](digits.characters)
        guard characters.count > 0 else {
            return []
        }
        
        var combinations : [String] = []
        for digit in characters {
            guard let letters = lettersOfNums[digit] else {
                return []
            }
            guard combinations.count > 0 else {
                combinations = letters
                continue
            }
            
            var nextCombinations : [String] = []
            for combination in combinations {
                for letter in letters {
                    nextCombinations.append(combination + letter)
                }
            }
            
            combinations = nextCombinations
        }
        
        return combinations
    }
    func letterCombinationsBest(_ digits: String) -> [String] {
        guard !digits.isEmpty else {
            return []
        }
        let digitToLetters = [[""],[""],["a","b","c"],["d","e","f"],["g","h","i"],["j","k","l"],["m","n","o"],["p","q","r","s"],["t","u","v"],["w","x","y","z"]]
        
        var originalCombinations: [String] = [""]
        
        for digit in digits.characters {
            var newCombinations: [String] = []
            for letter in digitToLetters[Int(String(digit))!] {
                for combination in originalCombinations {
                    newCombinations.append(combination+letter)
                }
            }
            
            originalCombinations = newCombinations
        }
        
        return originalCombinations
    }
    //MARK: - 637. Average of Levels in Binary Tree
    //TODO: 有问题
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var result:[Double] = []
        var tmpQueue:[TreeNode?] = []
        tmpQueue.append(root)
        while !tmpQueue.isEmpty {
            var sum = 0
            var count = 0
            var tmp:[TreeNode?] = []
            while !tmpQueue.isEmpty {
                let node = tmpQueue.removeFirst()
                sum += node!.val
                count += 1
                if node!.left != nil {
                    tmp.append(node!.left)
                }
                if node!.right != nil {
                    tmp.append(node!.right)
                }
            }
            tmpQueue = tmp;
            result.append(Double(sum) / Double(count));
        }
        return result
    }
    //MARK: - 383. Ransom Note
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict:[Character:Int] = [:];
        for character in magazine.characters {
            if let count = dict[character] {
                dict[character] = count + 1
            } else {
                dict[character] = 1
            }
        }
        for character in ransomNote.characters {
            if let count = dict[character] {
                if count > 0 {
                    dict[character] = count - 1
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return true;
    }
    func canConstructBest(_ ransomNote: String, _ magazine: String) -> Bool {
        var result : Array<Int> = Array(repeating:0, count: 26)
        for character in magazine.characters {
            let index1 = (String(character).unicodeScalars.first?.value)!
            let index2 = ("a".unicodeScalars.first?.value)!
            
            result[Int(index1) - Int(index2)] += 1
        }
        for character in ransomNote.characters {
            let index = (String(character).unicodeScalars.first?.value)! - ("a".unicodeScalars.first?.value)!
            if  result[Int(index)] == 0 {
                return false
            }
            result[Int(index) ] -= 1
        }
        return true
    }
    //MARK: - 350. Intersection of Two Arrays II
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result:[Int] = []
        var dict:[Int: Int] = [:]
        for num in nums1 {
            if let count = dict[num] {
                dict[num] = count + 1
            } else {
                dict[num] = 1
            }
        }
        for num in nums2 {
            if let count = dict[num] {
                if count > 0 {
                    dict[num] = count - 1
                    result.append(num)
                }
            }
        }
        return result
    }
    func intersectBest(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for i in nums1 {
            if dict[i] != nil {
                dict[i] = dict[i]! + 1
            } else {
                dict[i] = 1
            }
        }
        var res: [Int] = []
        for i in nums2 {
            if dict[i] != nil && dict[i]! > 0 {
                dict[i] = dict[i]! - 1
                res.append(i)
            }
        }
        return res
    }
    //MARK: - 136. Single Number
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
    //MARK: - 4Sum
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let count = nums.count
        if count < 4 {
            return []
        }
        var result:[[Int]] = []
        let sorterNums = nums.sorted()
        for i in 0 ..< count-3 {
            if i > 0 && sorterNums[i] == sorterNums[i - 1] {
                continue
            } else if sorterNums[i] + sorterNums[count - 1] + sorterNums[count - 2] + sorterNums[count - 3] < target {
                continue
            } else if (sorterNums[i] + sorterNums[i + 1] + sorterNums[i + 2] + sorterNums[i + 3] > target) {
                break
            }
            for j in i+1 ..< count-2 {
                if j > i + 1 && sorterNums[j] == sorterNums[j - 1] {
                    continue
                } else if (sorterNums[i] + sorterNums[j] + sorterNums[count - 1] + sorterNums[count - 2] < target) {
                    continue
                } else if (sorterNums[i] + sorterNums[j] + sorterNums[j + 1] + sorterNums[j+2] > target){
                    break
                }
                var left = j + 1
                var right = count - 1
                while left < right {
                    let sum = sorterNums[left] + sorterNums[right] + sorterNums[i] + sorterNums[j]
                    if sum < target {
                        left += 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        result.append([sorterNums[i],sorterNums[j],sorterNums[left],sorterNums[right]])
                        repeat {
                            left += 1
                        }while(sorterNums[left] == sorterNums[left - 1] && left < right)
                        repeat {
                            right -= 1
                        }while(sorterNums[right] == sorterNums[right + 1] && left < right)
                    }
                }
            }
        }
        return result
    }
    //MARK: - 168. Excel Sheet Column Title
    func convertToTitle(_ n: Int) -> String {
        var num = n
        var result:String = ""
        let ascIIA = 65
        repeat {
            let remainder = (num - 1) % 26
            let char = Character(UnicodeScalar(remainder + ascIIA)!)
            result = String(char) + result
            num = (num - 1)/26
        } while num >= 1
        return result
    }
    //MARK - 148. Sort List
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil {
            return head
        }
        var prev = head, slow = head, fast = head
        while fast != nil, fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        
        let firstHalf = sortList(head)
        let secondHalf = sortList(slow)
        return mergeTwoLists(firstHalf, secondHalf)
    }
    
    private func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result = ListNode(0)
        var head = result
        var l1 = l1
        var l2 = l2
        while l1 != nil, l2 != nil {
            if l1!.val < l2!.val {
                head.next = l1
                l1 = l1?.next
            } else {
                head.next = l2
                l2 = l2?.next
            }
            head = head.next!
        }
        head.next = l1 != nil ? l1 : l2
        return result.next
    }
    //MARK - 231. Power of Two
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && (n & (n - 1) == 0)
    }
    func isPowerOfTwoBest(_ n: Int) -> Bool {
        var n = n
        while n > 0 {
            if n == 1 {
                return true
            }
            if n > 2 && n % 2 == 1 {
                return false
            }
            n /= 2
        }
        
        return false
    }
    //MARK - 43. Multiply Strings
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        var n1:[Int] = num1.characters.map { (character) -> Int in
            return Int("\(character)")!
        }
        var n2:[Int] = num2.characters.map { (character) -> Int in
            return Int("\(character)")!
        }
        n1 = n1.reversed()
        n2 = n2.reversed()
        var n:[Int] = Array(repeating: 0, count: n1.count+n2.count)
        //将相乘的结果保存，不考虑进位问题
        for i in 0 ..< n1.count {
            for j in 0 ..< n2.count {
                //n一定是i+j，因为每次变动都要补一位0
                n[i+j] = n[i+j] + n1[i]*n2[j];//不考虑进位，最后统一处理进位问题
            }
        }
        var k = 0;//进位
        var result = "";
        for i in 0 ..< n.count {
            n[i] = n[i] + k;//先加进位
            k = n[i]/10;//下个进位
            n[i] = n[i]%10;//余数
            result = n[i].description + result;//将结果逆序保存
        }
        let regex = try! NSRegularExpression(pattern: "^0*", options: NSRegularExpression.Options(rawValue:0))
        let matchs = regex.matches(in: result, options: .anchored, range: NSMakeRange(0, result.characters.count))
//        let match = regex.firstMatch(in: result, options: NSRegularExpression.MatchingOptions.anchored, range:  NSMakeRange(0, result.characters.count))
        for match in matchs {
            result = (result as NSString).replacingCharacters(in: match.range, with: "")
        }
        return result;
    }
    //MARK - 322. Coin Change
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        let len = coins.count
        var nums:[Int] = Array.init(repeating: 0, count: amount + 1)
        nums[0] = 0
        for i in 0 ... amount {
            nums[i] = Int.max - 1
        }
        for i in 0 ..< len {
            if coins[i] <= amount {
                nums[coins[i]] = 1
            }
        }
        for i in 0 ..< len {
            for j in 0 ... amount {
                if j >= coins[i] && nums[j-coins[i]] >= 0 {
                    nums[j] = min(nums[j], nums[j-coins[i]] + 1)
                }
            }
        }
        if nums[amount] >= Int.max - 1 {
            return -1
        } else {
            return nums[amount]
        }
    }
    func coinChangeBest(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        let arrayLength = amount + 1
        // Since later we add 1 to the array, we need to subtract 1 so that a runtime overflow error doesn't occur
        var arr = [Int](repeating: Int.max-1, count: arrayLength)
        arr[0] = 0
        for x in 1...amount {
            for c in coins {
                if c <= x {
                    let currentValue = arr[x]
                    let newValue = arr[x-c] + 1
                    if currentValue > newValue {
                        arr[x] = newValue
                    }
                }
            }
        }
        return arr[amount] > amount ? -1 : arr[amount]
    }
}
