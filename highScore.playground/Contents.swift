import UIKit

///
struct Score4 {
    private(set) var current: Int = 0
    static var highestScore: Int = 0
    
    mutating func increment(_ val: Int = 1) {
        current += val
        if current > Score4.highestScore {
            Score4.highestScore = current

        }
    }
}

var score_1 = Score4()
var score_2 = Score4()

score_1.increment(2)
print(score_1)
