class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int len = nums.size();
        if (len < 2) {
            return vector<int>();
        }
        unordered_map<int, int> map; // num -> index
        for (int i = 0; i < len; i++) {
            if (map.contains(target - nums[i])) {
                vector<int> ret;
                ret.push_back(i);
                ret.push_back(map[target - nums[i]]);
                return ret;
            } else {
                map[nums[i]] = i;
            }
        }
        return vector<int>();
    }
};