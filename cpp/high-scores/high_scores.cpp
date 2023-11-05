#include "high_scores.h"

#include <algorithm>

namespace arcade {

    std::vector<int> HighScores::list_scores() {
        return scores;
    }

    int HighScores::latest_score() {
        return scores.back();
    }

    int HighScores::personal_best() {
        int best = scores.front();
        for (int score : scores) {
            if (score > best) {
                best = score;
            }
        }
        return best;
    }

    std::vector<int> HighScores::top_three() {
        std::vector<int> local_scores{scores};
        std::sort(local_scores.begin(), local_scores.end(), std::greater<int>());
        if (local_scores.size() > 3) {
            local_scores.erase(local_scores.begin() + 3, local_scores.end());
        }
        return local_scores;
    }

}  // namespace arcade
