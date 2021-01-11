#include "Filters.h"

Image BlackAndWhite(Image src) {

    for (size_t i = 0; i < src.columns(); i++) {
        for (size_t j = 0; j < src.rows(); j++) {
            ColorRGB cc = src.pixelColor(i, j);
            double max = 0;
            if (cc.red() >= cc.green())
                if (cc.red() >= cc.blue()) max = cc.red(); else max = cc.blue();
            else
                if (cc.green() >= cc.blue()) max = cc.green(); else max = cc.blue();

            src.pixelColor(i, j, ColorRGB(max, max, max));
        }
    }
   
    return src;

}

Image Negative(Image src)
{
    for (size_t i = 0; i < src.columns(); i++) {
        for (size_t j = 0; j < src.rows(); j++) {
            ColorRGB cc = src.pixelColor(i, j);
            src.pixelColor(i, j, ColorRGB(1.0 - cc.red(), 1.0 - cc.green(), 1.0 - cc.blue()));
        }
    }
    return src;
}

Image PurpleMidnight(Image src)
{
    for (size_t i = 0; i < src.columns(); i++) {
        for (size_t j = 0; j < src.rows(); j++) {
            ColorRGB cc = src.pixelColor(i, j);
            src.pixelColor(i, j, ColorRGB(cc.green()/3*2, cc.green()/3, cc.blue() ));
        }
    }
    return src;
}

