#include <iostream>
#include <string>

struct multi_return{
    int a = 1;
    int b = 2;
    std::string string1 = "hello"; 
};

multi_return & MultiReturn(multi_return & test){
    test.a = 3;

    return test;
}

int main(){
    multi_return multi_test;
    multi_return & test = MultiReturn(multi_test);

    std::cout << test.a << test.b << test.string1 << std::endl;

    return 0;
}


// wrong 

// multi_return & MultiReturn(){
//     multi_return multi1;

//     return multi1;
// }

// int main(){
//     multi_return & test = MultiReturn();

//     std::cout << test.a << test.b << test.string1 << std::endl;

//     return 0;
// }

// 错误案例里的multi1创建于MultiReturn函数内部，作用域也在函数内部，在return后离开函数作用域multi1值失效，将导致得到的test是一个地址（内存泄漏），
// 函数内部创建的局部变量multi1在函数返回后会超出作用域，其生命周期结束，因此返回的引用将指向一个已经被销毁的对象，这会导致未定义行为。
// 正确做法在mian作用域中使用multi_test创建，使用test（别名）接收，保证三个结构变量始终在各自作用域中生效，但实际上按引用传递无需再创建test变量，只需直接使用multi_test
// 实际上test应该应用于第三个函数，不写了。