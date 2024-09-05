#include<iostream>

void printHello(const std::string s1, const std::string s2){
    std::cout << s1 + s2 << ", this is printHello1" << std::endl;
}

void printHello(const std::string s3){
    std::cout << s3 << ", this is printHello2" << std::endl;
}

int main () {
    std::string s1 = "hello,";
    std::string s2 = " nemo";
    printHello(s1, s2);
    printHello(s1 + s2);

    return 0;
}


// 但是实际上这样做没有意义，这种情况其实用默认参数就可以实现同样的效果，不要做多此一举的事。
// void printHello(const std::string s1, const std::string s2 = "");