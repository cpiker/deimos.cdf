# deimos.cdf
[Common Data Format](https://cdf.gsfc.nasa.gov/) (CDF) library D language bindings

## Usage Notes

Initialzation of new D projects is typically handled via the `dub`
program which is the D package manager and build tool.  On linux,
dub is installed directly to your programs path.  On windows
you may need to run:

```batch
C:\\path\to\my\windows\build\tools\vcvars.bat
```
in the `cmd.exe` window first.  Typically when dub is installed on 
windows it integrates itself into your existing Visual Studio build
enviornment.

The following terminal session illustrates how to initialize a new 
test program using the CDF library.  Commands are the same on Windows,
Linux and MacOS.

```
dub init my_cdf_test
Name [my_cdf_test]: 
Description [A minimal D application.]: *CDF Bindings Test*
Author name [Your Name]: 
License [proprietary]: *Boost*
Copyright string [Copyright © 2021, Your Name]: 
Add dependency (leave empty to skip) []: *cdf*
Adding dependency cdf >=3.8.0-alpha.2 <3.9.0-0
Add dependency (leave empty to skip) []: 
Successfully created an empty project in '/home/you/my_cdf_test'.
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

This pack does not supply libcdf.so or cdf.dll you'll have to install
those on your own.  On linux it best to install these directly into
'/usr/local' instead of '/usr/local/cdf' as the sub-directory 'cdf' 
is not automatically searched by the linker.

After you have installed libcdf.so/cdf.dll, build your project by 
giving the commands:
```
cd my_cdf_test
dub build
```

Which will autmatically fetch these wrappers from the dub package
repository and add them to your project.


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
