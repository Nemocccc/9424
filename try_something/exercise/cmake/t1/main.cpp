// main.cpp

#include<iostream>
#include"config.h"

#ifdef USE_MYMATH
    #include "math/math.h"
#else 
    #include <math.h>
#endif

int main(){
    std::cout << "hello world" << std::endl;
    
#ifdef USE_MYMATH
    math();
#else 
    std::cout << "im standard math lib" << std::endl;
#endif

    return 0;
}