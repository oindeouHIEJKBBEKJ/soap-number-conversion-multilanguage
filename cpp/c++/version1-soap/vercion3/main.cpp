#include <iostream>
#include <string>

std::string numeroALetras(int n)
{
    switch(n)
    {
        case 1:
            return "uno";

        case 2:
            return "dos";

        case 3:
            return "tres";

        case 10:
            return "diez";

        case 100:
            return "cien";

        case 1000:
            return "mil";

        default:
            return "no implementado";
    }
}

int main()
{
    int numero;

    std::cout << "Numero: ";
    std::cin >> numero;

    std::cout
        << numeroALetras(numero)
        << std::endl;

    return 0;
}
