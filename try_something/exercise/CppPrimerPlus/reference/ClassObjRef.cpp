#include<iostream>


class hello{
    private:
        std::string hello = "hello";
        std::string world = "world";

    public:
        void sayHello(){
            std::string say = hello + world;
            std::cout << say << std::endl;
        }
};


void say(hello & saysome);


int main(){
    hello hello1;
    say(hello1);

    return 0;
}

void say(hello & saysome){
    saysome.sayHello();
}