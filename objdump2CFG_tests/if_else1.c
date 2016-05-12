int sum(int x, int y) {
    return x+y;
}

int minus(int x, int y) {
    return x-y;
}

int main() {
    int a, b, res;
    if (a > 0) {
        res = sum(a, b);
    } else {
        res = minus(a, b);
    }
    return 0;
}