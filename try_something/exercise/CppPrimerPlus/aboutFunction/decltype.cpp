#include<iostream>


int example(){
    return 0;
}


template <typename T1, typename T2>
void twosum(T1 & num1, T2 & num2){
    // commonly , the type of x is hard to settle when T1 and T2 is different types(will cause Type conversion)
    // so decltype(expression) invented. 
    decltype(num1 + num2) x = num1 + num2;    // x is the type of the result of num1 + num2
    decltype(example()) y; //y is the type int, which is the return type of example() function
    decltype((y)) z; //z is tyhe type int &, in decltype(), type with () refer to type & 
    std::cout << x << std::endl;
}

// a situation that exceed the power of decltype:
template <typename T1, typename T2>
auto exceed (T1 num1, T2 num2) -> decltype(num1 + num2){
    return (num1 + num2)
} 
//when num1 and num2(which are parameters) are the return of the function
// you can not use declare like decltype(num1 + num2) exceed(T1 num1, T2 num2)
// because the declare of variable is behind the invoke, which cause scope exceed problem.
// -> give us the option to declare the return type behind the declare of paremeters.
// auto before the function name is a placeholder, here.


int main() {
    int num1 = 5;
    double num2 = 6.1;
    twosum(num1, num2);

    return 0;
}