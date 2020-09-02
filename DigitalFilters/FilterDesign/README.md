# Filter Design Techniques

**_How do you design a filter?_**

There lies the question to be answered... from its conception to its actual implementation, this section aims to show different techniques used in the design of digital filters. Some techniques used in section are the following:

**1. Zero-pole placement**

Where you construct the transfer function of the filter with an intuitive approach, by defining zeros and poles in the Z-Plane such as these:

![ZPlane](https://github.com/MystoganX/Matlab-Digital-Signal-Processing/blob/master/DigitalFilters/FilterDesign/DAC_ZPlane.png)

To later implement the result by filtering a signal, like in this case, where the effects of a DAC's sample and hold step are compensated by the filter: 

![filterresponse](https://github.com/MystoganX/Matlab-Digital-Signal-Processing/blob/master/DigitalFilters/FilterDesign/DAC_Compensation.png)
