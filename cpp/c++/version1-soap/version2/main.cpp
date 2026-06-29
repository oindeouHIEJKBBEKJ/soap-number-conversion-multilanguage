#include <iostream>
#include <string>

int main()
{
    std::string texto = "ten";

    if(texto=="ten")
        texto="diez";

    std::cout << texto << std::endl;

    return 0;
}