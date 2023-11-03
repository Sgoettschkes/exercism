#include <string>
#include <vector>

namespace election {
    struct ElectionResult {
        // Name of the candidate
        std::string name{};
        // Number of votes the candidate has
        int votes{};
    };

    int vote_count(ElectionResult result) {
        return result.votes;
    }

    void increment_vote_count(ElectionResult& result, int num) {
        result.votes += num;
    }

    ElectionResult& determine_result(std::vector<ElectionResult>& result_list) {
        int max=0;
        int index=0;
        for (int i=0; i<result_list.size(); i++){
            if (result_list[i].votes > max){
                max = result_list[i].votes;
                index=i;
            }
        }
        result_list[index].name = "President " + result_list[index].name;
        return result_list[index];
    }
} 
