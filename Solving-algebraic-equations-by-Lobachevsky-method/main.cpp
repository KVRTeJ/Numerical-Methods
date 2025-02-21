#include <iostream>

#include "lobachevskyMethod.h"

int main() {
    Equation eq;

    LobachevskyMethod boo(eq, 3);
    boo.calculateQuadrizationMatrix();
    boo.printQuadrizationMatrix();

    std::cout << eq(1) << std::endl;

    return 0;
}
