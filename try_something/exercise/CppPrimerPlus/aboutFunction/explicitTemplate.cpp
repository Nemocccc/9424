// specialization overrides a template

#include<iostream>

template <typename T>
void Swap(T &a, T &b);

struct job{
    char name[40];
    double salary;
    int floor;
};

template <> void Swap<job>(job &a, job & b); // explicit template, the first 'job' can be ignore like this : template <> void Swap<>(job &a, job &b);

int main () {
    // explicit template has a higher priority then simple template.
    return 0;
}