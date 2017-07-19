 class Solution {
     public:
     int longestConsecutive(vector<int>& nums) {
             unordered_set<int> set;
             for(auto i : nums) set.insert(i);

             int longest = 0;
             for(auto i : nums)
             {
                         int length = 1;
                         for(int j = i - 1; set.find(j) != set.end(); j--)
                         {
                                         ++length;
                                         set.erase(j);
                                     }
                         for(int j = i + 1; set.find(j) != set.end(); j++)
                         {
                                         ++length;
                                         set.erase(j);
                                     }
                         longest = max(longest, length);
                     }

             return longest;
         }
 };
