#include <iostream>

#include "lobachevskyMethod.h"

int main() {
    Equation eq;

    LobachevskyMethod boo(eq, 14);
    boo.calculateQuadrizationMatrix();
    boo.printQuadrizationMatrix();

    auto result = boo();

    std::cout << "Подставим в полином: " << std::endl;
    std::cout << eq(*result.begin()) << std::endl;

    return 0;
}
