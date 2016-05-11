#include <cerrno>
#include <cstdio>
#include <cstring>
#include <map>
#include <set>
#include <string>

// #include "llvm/IR/Module.h"

using namespace std;

static void objdump2CFG(string fileName) {
    // open and read objdump file
    FILE *stream = fopen(fileName.c_str(), "r");
    if (stream == nullptr) {
        fprintf(stderr, "error: failed to open \"%s\": %s\n", fileName.c_str(),
            strerror(errno));
        exit(-1);
    }

    fclose(stream);
}

int main(int argc, char **argv) {
    string fileName(argv[1]);
    objdump2CFG(fileName);
    return 0;
}

