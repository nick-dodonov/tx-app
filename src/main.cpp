#include <iostream>
#include <Shared/Version.h>

int main(int argc, char** argv)
{
	std::cout << "Hello world!\n";
	for (int i = 0; i < argc; ++i) {
		std::cout << "Arg " << i << ": " << argv[i] << '\n';
	}
	std::cout << GetVersionDetailed() << '\n';
	return 0;
}
