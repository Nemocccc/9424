#include <iostream>


template <typename T>
void anytype(T a){
    std::cout << a << std::endl;
}


int main () {
    int a = 1;
    double b = 1.111;
    std::string c = "hello";
    anytype(a);
    anytype(b);
    anytype(c);
    anytype(b + double(a));

    return 0;
}
