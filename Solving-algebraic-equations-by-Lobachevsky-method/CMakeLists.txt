cmake_minimum_required(VERSION 3.16)

project(Solving-algebraic-equations-by-Lobachevsky-method LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(Solving-algebraic-equations-by-Lobachevsky-method main.cpp
    equation.h
    lobachevskyMethod.h
)

include(GNUInstallDirs)
install(TARGETS Solving-algebraic-equations-by-Lobachevsky-method
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
