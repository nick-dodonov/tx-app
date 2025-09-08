#include <iostream>
#include <Shared/Version.h>

int main(int argc, char** argv) {
    std::cout << "Hello world!" << std::endl;
    std::cout << GetVersionDetailed() << std::endl;
    return 0;
}
