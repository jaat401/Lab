
#include <stdio.h>

#define INFINITY 999

int prim(int cost[10][10], int source, int n) {
    int visited[10] = {0}, cmp[10], vertex[10], sum = 0;

    // Initialize comparison array and vertex array
    for (int i = 0; i < n; i++) {
        cmp[i] = cost[source][i];
        vertex[i] = source;
    }
    visited[source] = 1;

    // Main loop to find MST
    for (int i = 1; i < n; i++) {
        int min = INFINITY, u = -1;
        for (int j = 0; j < n; j++) {
            if (!visited[j] && cmp[j] < min) {
                min = cmp[j];
                u = j;
            }
        }
        if (u == -1) break; // Exit if no connected vertex is found

        visited[u] = 1;
        sum += cmp[u];
        printf("\n %d -> %d, cost = %d", vertex[u] + 1, u + 1, cmp[u]);

        for (int v = 0; v < n; v++) {
            if (!visited[v] && cost[u][v] < cmp[v]) {
                cmp[v] = cost[u][v];
                vertex[v] = u;
            }
        }
    }
    return sum;
}

int main() {
    int a[10][10], n, source;

    printf("\nEnter the number of vertices: ");
    scanf("%d", &n);

    // Ensure the number of vertices is within bounds
    if (n < 1 || n > 10) {
        printf("\nInvalid number of vertices. Must be between 1 and 10.");
        return 1;
    }

    printf("\nEnter the cost matrix (0 for self-loop and 999 for no edge):\n");
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            scanf("%d", &a[i][j]);
        }
    }

    // Validate the matrix symmetry and diagonal elements
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            if ((i == j && a[i][j] != 0) || (i != j && a[i][j] != a[j][i])) {
                printf("\nInvalid entry\nCost matrix should be symmetrical & diagonal elements should be zero.");
                return 1;
            }
        }
    }

    printf("\nEnter the source vertex (1 to %d): ", n);
    scanf("%d", &source);
    source--;  // Adjust for 0-based indexing

    // Validate source input
    if (source < 0 || source >= n) {
        printf("\nInvalid source vertex.");
        return 1;
    }

    int totalCost = prim(a, source, n);
    printf("\n\nTotal cost = %d", totalCost);

    return 0;
}
