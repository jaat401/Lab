#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

long int p, q, n, t, e, d, temp[100], m[100], en[100], i;
char msg[100];

int prime(long int num) {
    if (num <= 1) return 0;
    for (int i = 2; i <= sqrt(num); i++)
        if (num % i == 0) return 0;
    return 1;
}

void calc_keys() {
    for (e = 2; e < t; e++) {
        if (prime(e) && t % e != 0) {
            long int k = 1;
            while ((k = k + t) % e != 0);
            d = k / e;
            break;
        }
    }
}

void encrypt() {
    for (i = 0; i < strlen(msg); i++) {
        long int pt = msg[i] - 96, ct = 1;
        for (int j = 0; j < e; j++) ct = (ct * pt) % n;
        en[i] = ct + 96;
    }
    en[i] = -1;
    printf("\nENCRYPTED MESSAGE:\n");
    for (i = 0; en[i] != -1; i++) printf("%c", (char)en[i]);
}

void decrypt() {
    for (i = 0; en[i] != -1; i++) {
        long int ct = en[i] - 96, pt = 1;
        for (int j = 0; j < d; j++) pt = (pt * ct) % n;
        m[i] = pt + 96;
    }
    m[i] = -1;
    printf("\nDECRYPTED MESSAGE:\n");
    for (i = 0; m[i] != -1; i++) printf("%c", (char)m[i]);
}

int main() {
    printf("ENTER TWO DISTINCT PRIME NUMBERS:\n");
    scanf("%ld %ld", &p, &q);

    if (!prime(p) || !prime(q) || p == q) {
        printf("INVALID INPUT\n");
        return 1;
    }

    printf("ENTER MESSAGE: ");
    scanf(" %[^\n]s", msg);

    n = p * q;
    t = (p - 1) * (q - 1);

    calc_keys();

    printf("PUBLIC KEY: {e = %ld, n = %ld}\n", e, n);
    printf("PRIVATE KEY: {d = %ld, n = %ld}\n", d, n);

    encrypt();
    decrypt();

    return 0;
}
