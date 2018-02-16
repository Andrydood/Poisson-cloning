# Poisson-cloning

### What is it:

This matlab function implements poisson seamless cloning from the paper : *“Poisson image editing",
P. Pérez, M. Gangnet, and A. Blake, Siggraph 2003.* It allows seamless cloning of a patch from one image into a second. This keeps the liting conditions and colors of the destination image, but imports the object (shapes, texture and gradients) from the source image. An example can be found in "Example images"

### How to use it:

Call the function poissonCloning() with it's first parameter being the image with the object being cloned in, and the secont parameter being the destination image. The third parameter is the "Gradient mix" option. If set as 0, the gradient taken will be that of the source image. If set as 1, the gradient will be a best fit mix of the source and destination image (see difference in the example images).


*Example : poissonCloning('foreground.jpg','background.png',0)*


Once called, a prompt will come up. Select the area to clone in the first image, and select the area in which to paste the patch in the second image.

### Screenshots

**Originals**

![](https://github.com/Andrydood/Poisson-cloning/blob/master/Example%20images/Source.jpg?raw=true)
![](https://github.com/Andrydood/Poisson-cloning/blob/master/Example%20images/Destination.png?raw=true)

**Result of Cloning**
![](https://github.com/Andrydood/Poisson-cloning/blob/master/Example%20images/Output.jpg?raw=true)
