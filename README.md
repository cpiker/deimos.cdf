# deimos.cdf
Common Data Format (CDF) library D language bindings


## Conversion Notes

The CDF library makes heavy use of function macros to wrap calls to a 
lower level function named: CDFLib().  In the spirit (for good or for ill)
of the old Motif libraries this is a var-args function with custom integer
type specifiers.  The net effect of function macros paired with a var-args
uber function is type erasure.  This is unfortunate as code using the 
CDF libray must provide proper C data types or else calls to CDFLib
will fail horribly.  The proper data types are not documented in the header
but rather in the [C Reference manual](https://spdf.gsfc.nasa.gov/pub/software/cdf/doc/cdf380/cdf380crm.pdf).

To build the D prototypes, Appendix B of the above manual was used in 
in conjunction with the supplied C header files cdf.h, and to a much 
lesser extent, cdfdist.h. 
 
1. Invoke dstep on the included cdf.h header
    
2. Convert the cdf380crm.pdf to Markdown.  This was handled via a tool
   provided at https://pdf2md.morethan.io/
   
3. All D templates that invoke functions with proper type information 
   were left as is.
 
4. All templates that call CDFLib() were converted to actual D functions
   so that type information is available to creators of higher level
   modules.

The first iteration of this process was handled manually.  For future 
updates an automatic converter shoud be written using the experience 
gained from converting version 3.8. 
