# deimos.cdf
[Common Data Format](https://cdf.gsfc.nasa.gov/) (CDF) library D language bindings

CDF files are the most common data interchange format used in space particles
and fields research.  [Phobos](https://dlang.org/phobos/) is the standard D
library that comes with the D compiler. [Deimos](https://github.com/D-Programming-Deimos)
is the namespace for D bindings for non-D libraries, notably those which have
a C binary call interface.

## Creating a D project using deimos.cdf

Initialzation of new D projects is typically handled via the 
[dub](https://dub.pm/index.html)
program which is the D package manager and build tool.  On Linux,
dub is installed directly to your $PATH.  As usual on Windows the
program is much harder to find.  If you're using the dmd compiler
on Windows the program will be in a path similar to:
```
C:\D\dmd2\windows\bin64\dub.exe
```

The following terminal session illustrates how to initialize a new 
test program using the CDF library.  Commands are the same on Windows,
Linux and MacOS.

```
dub init my_cdf_test
Name [my_cdf_test]: 
...
Add dependency (leave empty to skip) []: cdf
Adding dependency cdf >=3.8.0-alpha.2 <3.9.0-0
Add dependency (leave empty to skip) []: 
...
```

After the project is generated you should have a `dub.json` file that 
looks similar to the following.

```json
{
   "authors": [
      "Your Name"
   ],
   "copyright": "Copyright © 2021, Your Name",
   "dependencies": {
      "cdf": ">=3.8.0-alpha.1 <3.9.0-0"
   },
   "description": "CDF Bindings Test",
   "license": "Boost",
   "name": "my_cdf_test"
}
```
In order to use this package add the line:
```D
import deimos.cdf;
```
to the automatically generated `app.d` file.

On Linux the deimos.cdf package does not supply libcdf.a so you'll have
to install the standard CDF binaries on your own.  It's easier if
you install the CDF libs directly into `/usr/local` instead of
`/usr/local/cdf` as the sub-directory "cdf" is not automatically searched
by the linker.  On Windows deimos.cdf caries a copy of `libcdf.lib` so
this step isn't necessary.

After you have installed libcdf.so (if needed) build your project using:
```
cd my_cdf_test
dub build
```
Which will autmatically fetch the [deimos.cdf package](https://code.dlang.org/packages/cdf)
from the dub repository and add it to your project.  If you're having 
trouble linking to dllcdf.dll on wondows, update your `%PATH%` environment
variable to include the location of dllcdf.dll.  Or just copy `dllcdf.dll` 
and `dllcdf.lib` into to top of your project directory.


## Module Creation Notes

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
