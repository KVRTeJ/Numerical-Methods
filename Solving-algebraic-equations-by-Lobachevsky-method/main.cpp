#include <iostream>

#include "lobachevskyMethod.h"

int main() {
    Equation eq;

    LobachevskyMethod boo(eq, 14);
    boo.calculateQuadrizationMatrix();
    boo.printQuadrizationMatrix();

    auto result = boo();
    for(int i = 0; i < result.size(); ++i) {
        std::cout << result[i] << std::endl;
    }

    for(int i = 0; i < result.size(); ++i) {
        std::cout << eq(result[i]) << std::endl;
    }

    return 0;
}
