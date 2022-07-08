import Foundation

let file = Bundle.main.url(forResource: "input", withExtension: "txt")!
let content = try! String(contentsOf: file, encoding: .utf8)
let array = content.split(whereSeparator: \.isNewline)[0]
    .split(whereSeparator: \.isWhitespace)
    .map { Int($0) }
    .compactMap { $0 }
let rotations = content.split(whereSeparator: \.isNewline)[1]
    .split(whereSeparator: \.isWhitespace)
    .map { Int($0) }
    .compactMap { $0 }
    .first!


func rotLeft(a: [Int], d: Int) -> [Int] {
    var input = a
    for _ in 0..<d {
        let r = input.removeFirst()
        input.append(r)
    }
    return input
}

let result = rotLeft(a: array, d: rotations)
print("Result:", result) //5 1 2 3 4
