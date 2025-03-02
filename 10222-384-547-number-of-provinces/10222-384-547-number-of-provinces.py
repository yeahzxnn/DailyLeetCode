class UnionFind:
    def __init__(self, n: int):
        # Initialize the count of components and the id array
        self.count = n  # Number of connected components
        self.id = list(range(n))  # Each node is its own parent initially
        self.rank = [0] * n  # Rank for union by rank optimization

    def unionByRank(self, u: int, v: int) -> None:
        # Union two components u and v
        i = self._find(u)  # Find the root of u
        j = self._find(v)  # Find the root of v
        if i == j:
            return  # They are already in the same component
        # Union by rank
        if self.rank[i] < self.rank[j]:
            self.id[i] = j  # Attach smaller tree under larger tree
        elif self.rank[i] > self.rank[j]:
            self.id[j] = i  # Attach smaller tree under larger tree
        else:
            self.id[i] = j  # Attach one tree under the other
            self.rank[j] += 1  # Increase the rank of the new root
        self.count -= 1  # Decrease the count of components

    def _find(self, u: int) -> int:
        # Find the root of the component
        if self.id[u] != u:
            self.id[u] = self._find(self.id[u])  # Path compression
        return self.id[u]  # Return the root


class Solution:
    def findCircleNum(self, isConnected: list[list[int]]) -> int:
        n = len(isConnected)  # Number of cities
        uf = UnionFind(n)  # Create a UnionFind instance

        for i in range(n):
            for j in range(i, n):
                if isConnected[i][j] == 1:  # Check if cities i and j are connected
                    uf.unionByRank(i, j)  # Union the two cities

        return uf.count  # Return the number of connected components
