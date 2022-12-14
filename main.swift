/*
You have a graph of n nodes. You are given an integer n and an array edges where edges[i] = [ai, bi] indicates that there is an edge between ai and bi in the graph.

Return the number of connected components in the graph.
*/

func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var countOfComponents = 0
    var adjList: [[Int]] = Array(repeating: [], count: n)
    var visited: Set<Int> = []

    for edge in edges {
        let v = edge[0], u = edge[1]
        adjList[v].append(u)
        adjList[u].append(v)
    }

    func dfs(_ root: Int) {
        visited.insert(root)
        for neighbor in adjList[root] {
            if !visited.contains(neighbor) {
                dfs(neighbor)
            }
        }
    }

    for v in 0..<n {
        if !visited.contains(v) {
            countOfComponents += 1
            dfs(v)
        }
    }

    return countOfComponents
}