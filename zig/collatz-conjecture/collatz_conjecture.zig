pub const ComputationError = error {
    IllegalArgument
};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) {
        return ComputationError.IllegalArgument;
    }

    var count: usize = 0;
    var curNum: usize = number;
    while(curNum != 1) {
        count += 1;
        if (curNum % 2 == 0) {
            curNum = curNum / 2;
        } else {
            curNum = curNum * 3 + 1;
        }
    }

    return count;
}
