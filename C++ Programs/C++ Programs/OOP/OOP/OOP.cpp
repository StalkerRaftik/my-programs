#include <iostream>

using namespace std;

class Vector2D {
private:
    double x;
    double y;
public:
    Vector2D();
    Vector2D(double x, double y);
    Vector2D(int x, int y);

    void SetX(int x);
    void SetY(int y);
    double GetX();
    double GetY();

    Vector2D& operator +(const Vector2D other);
    Vector2D& operator -(const Vector2D other);
    Vector2D& operator =(const Vector2D other);
};

Vector2D::Vector2D() {
    x = 0;
    y = 0;
}
Vector2D::Vector2D(double x, double y) {
    this->x = x;
    this->y = y;
}
Vector2D::Vector2D(int x, int y) {
    this->x = (double)x;
    this->y = (double)y;
}

void Vector2D::SetX(int x) {
    this->x = x;
}
void Vector2D::SetY(int y) {
    this->y = y;
}
double Vector2D::GetX() {
    return x;
}
double Vector2D::GetY() {
    return y;
}

Vector2D& Vector2D::operator +(const Vector2D other) {
    this->x += other.x;
    this->y += other.y;

    return *this;
}
Vector2D& Vector2D::operator -(const Vector2D other) {
    this->x -= other.x;
    this->y -= other.y;

    return *this;
}
Vector2D& Vector2D::operator =(const Vector2D other) {
    this->x = other.x;
    this->y = other.y;

    return *this;
}

// Перегрузка оператора вывода для вектора
ostream& operator << (ostream& out, Vector2D Vector) {
    out << "Vector2D(" << Vector.GetX() << "," << Vector.GetY() << ")";
    return out;
}

int main()
{
    Vector2D a(50,30);
    Vector2D b(100,100);
    Vector2D c;
    a = a + b;
    c = a;
    cout << c;

}

