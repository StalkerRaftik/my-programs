#include <iostream>
#include <Magick++.h>
#include "Filters.h"

using namespace std;
using namespace Magick;

int main() {
    Image img("image.jpg");
    int w = img.columns();
    int h = img.rows();
    int counter = 0;

    // Just pretty squares
    for (size_t i = 0; i < img.columns(); i++ ) {
        for (size_t j = 0; j < img.rows(); j++) {
            img.pixelColor(i, j, ColorRGB((float)(i %100)/100, (float)(j % 100) / 100, (float)((i+j) % 100)/100 ) );
        }
    }
    img.write("output" + to_string(counter) + ".jpg"); counter++;

    img = Image("image.jpg");
    BlackAndWhite(img) .write("output" + to_string(counter) + ".jpg"); counter++;
    Negative(img) .write("output" + to_string(counter) + ".jpg"); counter++;

    PurpleMidnight(img) .write("output" + to_string(counter) + ".jpg"); counter++;
}

