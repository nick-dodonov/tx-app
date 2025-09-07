#include <iostream>
#include <foo.h>
#include <Shared/Version.h>

int main(int argc, char** argv) {
    std::cout << "Hello world!" << std::endl;
    std::cout << GetVersionDetailed() << std::endl;
    std::cout << "add = " << add(1, 2) << std::endl;    
    return 0;
}
