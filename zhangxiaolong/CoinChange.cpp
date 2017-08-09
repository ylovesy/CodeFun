//
//  CoinChange.cpp
//  数据结构练习
//
//  Created by zhangxiaolong on 2017/8/9.
//  Copyright © 2017年 zhangxiaolong. All rights reserved.
//

#include <stdio.h>
#include <string>
#include <vector>

using namespace std;

class CoinChangeSolution {
public:
    int countMount(vector<int>& coins, int amount,vector<int> &dp){
    if (amount < 0) {
        return  -1;
    }
    if (dp[amount] != INT_MAX) {
        return dp[amount];
    }
    for (int index = 0; index < coins.size(); index++) {
        int count = countMount(coins, amount - coins[index], dp);
        if (count >= 0) {
            dp[amount] = min(dp[amount], count + 1);
        }
    }
    return dp[amount] = (dp[amount] == INT_MAX) ? -1 : dp[amount];
}

    int coinChange(vector<int>& coins, int amount) {
        vector<int> dp(INT_MAX, INT_MAX);
        dp[0] = 0;
        return countMount(coins, amount, dp);
    }

//    int countMount(vector<int>& coins, int amount){
//        if (amount < 0) {
//            return  -1;
//        }
//        if (amount == 0) {
//            return 0;
//        }
//        int count = 0;
//        for (int index = 0; index < coins.size(); index++) {
//            if (amount == coins[index]) {
//                count = 1;
//            }else{
//                int tem = countMount(coins, amount - coins[index]);
//                if (tem > 0) {
//                    if (tem < count) {
//                        count = tem;
//                    }
//                }
//            }
//        }
//        return count;
//    }
//
//    int coinChange(vector<int>& coins, int amount) {
//        return countMount(coins, amount);
//    }
};
