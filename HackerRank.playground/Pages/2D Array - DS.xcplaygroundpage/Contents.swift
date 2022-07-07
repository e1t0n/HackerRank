import Foundation

let file = Bundle.main.url(forResource: "input", withExtension: "txt")!
let content = try! String(contentsOf: file, encoding: .utf8)
let input = content.split(whereSeparator: \.isNewline)
    .map { $0.split(whereSeparator: \.isWhitespace) }
    .map { $0.map { Int($0) }.compactMap { $0 } }

func hourglassSum(arr: [[Int]]) -> Int {
    let hourGlassIndices = [(0,0), (0,1), (0,2), (1,1), (2,0), (2,1), (2,2)]
    var sums = [Int]()
    
    for dr in 0...3 {
        for dc in 0...3 {
            var sum = 0
            for i in hourGlassIndices {
                sum += arr[i.0+dr][i.1+dc]
            }
            sums.append(sum)
        }
    }    
    print(sums)
    return sums.max()!
}

let result = hourglassSum(arr: input)
print("Result:", result) //Ans: 28
