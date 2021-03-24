/******************************************************************************
* Copyright 1996-2016 United States Government as represented by the
* Administrator of the National Aeronautics and Space Administration.
* All Rights Reserved.
******************************************************************************/
/******************************************************************************
*
*  NSSDC/CDF            CDF Header file for C/C++ applications.
*
*  Version 3.5d, 14-Dec-97, Hughes STX.
*
*  Modification history:
*
*   V1.0  22-Jan-91, R Kulkarni   Original version (for CDF V2.0).
*           J Love
*   V2.0   3-Jun-91, J Love     Modified for CDF V2.1 enhancements,
*            namely the INTERNAL interface and the
*            MULTI/SINGLE file option.  Added
*            macros to replace C i/f functions.
*   V2.1  20-Jun-91, J Love   Added function prototypes.
*   V2.2   8-Aug-91, J Love   Increment for CDF V2.1.2.  Use
*            'CDFlib'.  Renamed a few items.
*   V3.0  19-May-92, J Love   IBM PC & HP-UX port.  CDF V2.2.
*   V3.1  23-Sep-92, J Love   CDF V2.3 (shareable/NeXT/zVar).
*   V3.1a  5-Oct-92, J Love   CDF V2.3.0a (NeXT/encoding).
*   V3.1b  6-Oct-92, J Love   CDF V2.3.0b (CDFcompare).
*   V3.1c 27-Oct-92, J Love   CDF V2.3.0c (pad values).
*   V3.2  12-Jan-94, J Love   CDF V2.4.
*   V3.2a  4-Feb-94, J Love   DEC Alpha/OpenVMS port.
*   V3.2b 22-Feb-94, J Love   Spelling lesson.
*   V3.3   8-Dec-94, J Love   CDF V2.5.
*   V3.3a  3-Mar-95, J Love   Solaris 2.3 IDL i/f.
*   V3.4  28-Mar-95, J Love   POSIX.
*   V3.4a  8-May-95, J Love   ILLEGAL_EPOCH_VALUE.
*   V3.4b  9-Jun-95, J Love   EPOCH custom format.
*   V3.4c 20-Jul-95, J Love   CDFexport-related changes.
*   V3.5  12-Sep-96, J Love   CDF V2.6.
*   V3.5a 21-Feb-97, J Love   Removed RICE.
*   V3.5b  9-Mar-97, J Love   Windows NT for MS Visual C++ 4.0 on an IBM PC.
*   V3.5c  2-Sep-97, J Love   `__STDC__' not defined for all AIX compilers.
*   V3.5d 14-Dec-97, J Love   Added ALPHAVMSi encoding.
*   V3.6  08-Apr-04, M Liu      Added  new data type CDF_EPOCH16 and some
*                               epoch functions related to the new type.
*   V3.7  28-Apr-09, M Liu      Modified MAC_ENCODING/DECODEING to PPC_ENCODING
*                               /DECODING as Mac and Linux can run on PPC box.
*   V3.8  10-Dec-10, M Liu      Added encodeEPOCH4, encodeEPOCH16_4,
*                               parseEPOCH4, parseEPOCH16_4 to handle epochs
*                               conforming to ISO 8601.
*   V3.9  04-Apr-11, M Liu      Added a few new functions for TT2000 epoch.
*   V3.10 03-Jan-12, M Liu      Added CDFgetzVarAllRecordsByVarID,
*                               CDFgetzVarRangeRecordsByVarID,
*                               CDFgetVarAllRecordsByVarName,
*                               CDFgetVarRangeRecordsByVarName functions, and
*                               a set of similar functions for put operations.
*                               Added a new error message.
*   V3.11 29-May-12, M Liu      Added CDFinsertVarRecordsByVarID and
*                               CDFinsertVarRecorsByVarName.
*   V3.12 28-May-14, M Liu      Added function items for record deletion:
*                               r/zVAR__RECORDS_RENUMBER_.
*   V3.13 20-Oct-16, M Liu      Added a new set CDFread functions with CDFdata
*                               type. Moved a few functions from cdfdist.h to
*                               here.
*   V3.14 10-Jan-18, M Liu      Added ARM and IA64 openVMS encoding.
******************************************************************************/

/*****************************************************************************
* Conversion Notes:
*
* The CDF library makes heavy use of function macros to wrap calls to a 
* lower level function named: CDFLib().  In the spirit (for good or for ill)
* of the old Motif libraries this as a var-args function with custom integer
* type specifiers.  The net effect of function macros paired with a var-args
* uber function is type erasure.  This is unfortunate as code using the 
* CDF libray must provide pointers proper C data types or else calls to CDFLib
* will fail horribly.  Fortunatly proper call signatures are included in the
* C Referenece Manual available from:
*
*  https://spdf.gsfc.nasa.gov/pub/software/cdf/doc/cdf380/cdf380crm.pdf
*
* The resulting D prototypes were built from a combination of the actual C
* header file and the users guide via the following procedure.
* 
* 1. Invoke dstep on the included cdf.h header
*    
* 2. Convert the cdf380crm.pdf to Markdown.  This was handled via a tool
*    provided at https://pdf2md.morethan.io/
*    
* 3. All D templates that invoke functions with proper type information 
*    were left as is.
* 
* 4. All templates that call CDFLib() were converted to actual D functions
*    so that type information is available to the compiler.
*
* Currently these steps are manual, just to get going.  An automatic converter
* could be provided in the future that would also generate ddoc comments from
* the users guide.
*
*   -- C. Piker 2021-03-23
*/


import core.stdc.config;

extern (C):

/******************************************************************************
* CDF defined types
******************************************************************************/

alias CDFid = void*;
alias CDFstatus = c_long;
alias CDFdata = void*;

/******************************************************************************
* CDF defined variables
******************************************************************************/

extern __gshared double* TT2000NULL;

/******************************************************************************
* Limits
******************************************************************************/

enum CDF_MIN_DIMS = 0; /* Min number of dimensions a CDF
                  variable may have */
enum CDF_MAX_DIMS = 10; /* Max number of dimensions a CDF
                  variable may have */

/******************************************************************************
* Lengths
******************************************************************************/

enum CDF_VAR_NAME_LEN = 64;
enum CDF_ATTR_NAME_LEN = 64;

enum CDF_VAR_NAME_LEN256 = 256;
enum CDF_ATTR_NAME_LEN256 = 256;

enum CDF_COPYRIGHT_LEN = 256;
enum CDF_STATUSTEXT_LEN = 200;
enum CDF_PATHNAME_LEN = 512;

enum EPOCH_STRING_LEN = 24;
enum EPOCH1_STRING_LEN = 16;
enum EPOCH2_STRING_LEN = 14;
enum EPOCH3_STRING_LEN = 24;
enum EPOCH4_STRING_LEN = 23;

enum EPOCH16_STRING_LEN = 36;
enum EPOCH16_1_STRING_LEN = 24;
enum EPOCH16_2_STRING_LEN = 14;
enum EPOCH16_3_STRING_LEN = 36;
enum EPOCH16_4_STRING_LEN = 32;

enum TT2000_0_STRING_LEN = 30;
enum TT2000_1_STRING_LEN = 19;
enum TT2000_2_STRING_LEN = 14;
enum TT2000_3_STRING_LEN = 29;
enum TT2000_4_STRING_LEN = 30;

enum EPOCHx_STRING_MAX = 50;
enum EPOCHx_FORMAT_MAX = 68;

/******************************************************************************
* Data types.
******************************************************************************/

enum CDF_INT1 = 1L;
enum CDF_INT2 = 2L;
enum CDF_INT4 = 4L;
enum CDF_INT8 = 8L;
enum CDF_UINT1 = 11L;
enum CDF_UINT2 = 12L;
enum CDF_UINT4 = 14L;
enum CDF_REAL4 = 21L;
enum CDF_REAL8 = 22L;
enum CDF_EPOCH = 31L; /* Standard style. */
enum CDF_EPOCH16 = 32L; /* Extended style. */
enum CDF_TIME_TT2000 = 33L; /* One more style with leap seconds
                  and J2000 base time. */
enum CDF_BYTE = 41L; /* same as CDF_INT1 (signed) */
enum CDF_FLOAT = 44L; /* same as CDF_REAL4 */
enum CDF_DOUBLE = 45L; /* same as CDF_REAL8 */
enum CDF_CHAR = 51L; /* a "string" data type */
enum CDF_UCHAR = 52L; /* a "string" data type */

/******************************************************************************
* Encoding (for data only, everything else is network encoding).
******************************************************************************/

enum NETWORK_ENCODING = 1L;
enum SUN_ENCODING = 2L;
enum VAX_ENCODING = 3L;
enum DECSTATION_ENCODING = 4L;
enum SGi_ENCODING = 5L;
enum IBMPC_ENCODING = 6L;
enum IBMRS_ENCODING = 7L;
enum HOST_ENCODING = 8L;
enum PPC_ENCODING = 9L;
enum HP_ENCODING = 11L;
enum NeXT_ENCODING = 12L;
enum ALPHAOSF1_ENCODING = 13L;
enum ALPHAVMSd_ENCODING = 14L;
enum ALPHAVMSg_ENCODING = 15L;
enum ALPHAVMSi_ENCODING = 16L;
enum ARM_LITTLE_ENCODING = 17L;
enum ARM_BIG_ENCODING = 18L;
enum IA64VMSi_ENCODING = 19L;
enum IA64VMSd_ENCODING = 20L;
enum IA64VMSg_ENCODING = 21L;

/******************************************************************************
* Decodings.
******************************************************************************/

enum NETWORK_DECODING = NETWORK_ENCODING;
enum SUN_DECODING = SUN_ENCODING;
enum VAX_DECODING = VAX_ENCODING;
enum DECSTATION_DECODING = DECSTATION_ENCODING;
enum SGi_DECODING = SGi_ENCODING;
enum IBMPC_DECODING = IBMPC_ENCODING;
enum IBMRS_DECODING = IBMRS_ENCODING;
enum HOST_DECODING = HOST_ENCODING;
enum PPC_DECODING = PPC_ENCODING;
enum MAC_ENCODING = PPC_ENCODING;
enum MAC_DECODING = PPC_ENCODING;
enum HP_DECODING = HP_ENCODING;
enum NeXT_DECODING = NeXT_ENCODING;
enum ALPHAOSF1_DECODING = ALPHAOSF1_ENCODING;
enum ALPHAVMSd_DECODING = ALPHAVMSd_ENCODING;
enum ALPHAVMSg_DECODING = ALPHAVMSg_ENCODING;
enum ALPHAVMSi_DECODING = ALPHAVMSi_ENCODING;
enum ARM_LITTLE_DECODING = ARM_LITTLE_ENCODING;
enum ARM_BIG_DECODING = ARM_BIG_ENCODING;
enum IA64VMSi_DECODING = IA64VMSi_ENCODING;
enum IA64VMSd_DECODING = IA64VMSd_ENCODING;
enum IA64VMSg_DECODING = IA64VMSg_ENCODING;

/******************************************************************************
* Variance flags
******************************************************************************/

enum VARY = -1L; /* TRUE record or dimension variance flag */
enum NOVARY = 0L; /* FALSE record or dimension variance flag */

/******************************************************************************
* Majorities
******************************************************************************/

enum ROW_MAJOR = 1L;
enum COLUMN_MAJOR = 2L;

/******************************************************************************
* Formats.
******************************************************************************/

enum SINGLE_FILE = 1L;
enum MULTI_FILE = 2L;

/******************************************************************************
* Checksum
******************************************************************************/

enum NO_CHECKSUM = 0L;
enum MD5_CHECKSUM = 1L;
enum OTHER_CHECKSUM = 2L;

/******************************************************************************
* Attribute scopes
******************************************************************************/

enum GLOBAL_SCOPE = 1L;
enum VARIABLE_SCOPE = 2L;

/******************************************************************************
* Readonly modes.
******************************************************************************/

enum READONLYon = -1L;
enum READONLYoff = 0L;

/******************************************************************************
* Validate data modes.
******************************************************************************/

enum VALIDATEFILEon = -1L;
enum VALIDATEFILEoff = 0L;

/******************************************************************************
* zModes.
******************************************************************************/

enum zMODEoff = 0L;
enum zMODEon1 = 1L;
enum zMODEon2 = 2L;

/******************************************************************************
* Negative to positive floating point zero modes.
******************************************************************************/

enum NEGtoPOSfp0on = -1L;
enum NEGtoPOSfp0off = 0L;

/******************************************************************************
* Backward file mode.
******************************************************************************/

enum BACKWARDFILEon = 1;
enum BACKWARDFILEoff = 0;

/******************************************************************************
* Compression/sparseness constants.
******************************************************************************/

enum CDF_MAX_PARMS = 5;
enum NO_COMPRESSION = 0L;
enum RLE_COMPRESSION = 1L;
enum HUFF_COMPRESSION = 2L;
enum AHUFF_COMPRESSION = 3L;
/**************************************************
* Compression `4' used to be RICE.  Do not reuse! *
**************************************************/
enum GZIP_COMPRESSION = 5L;

enum RLE_OF_ZEROs = 0L;
enum OPTIMAL_ENCODING_TREES = 0L;
enum NO_SPARSEARRAYS = 0L;
enum NO_SPARSERECORDS = 0L;
enum PAD_SPARSERECORDS = 1L;
enum PREV_SPARSERECORDS = 2L;

/*****************************************************************************
* Invalid/reserved constants.
*****************************************************************************/

enum RESERVED_CDFID = cast(CDFid) null; /* Indicates that a CDF hasn't
                     been selected yet. */
enum RESERVED_CDFSTATUS = cast(CDFstatus) -1; /* Indicates that a CDFstatus
                     hasn't been selected yet. */

enum ILLEGAL_EPOCH_VALUE = -1.0;
enum ILLEGAL_TT2000_VALUE = -9223372036854775805L;
/* as 1707-09-22T12:12:10.961224195*/

enum FILLED_TT2000_VALUE = -9223372036854775807L - 1;

/******************************************************************************
* Status codes (CDFstatus)
*  - informatory codes are greater than CDF_OK
******************************************************************************/

enum VIRTUAL_RECORD_DATA = cast(CDFstatus) 1001;
enum DID_NOT_COMPRESS = cast(CDFstatus) 1002;
enum VAR_ALREADY_CLOSED = cast(CDFstatus) 1003;
enum SINGLE_FILE_FORMAT = cast(CDFstatus) 1004;
enum NO_PADVALUE_SPECIFIED = cast(CDFstatus) 1005;
enum NO_VARS_IN_CDF = cast(CDFstatus) 1006;
enum MULTI_FILE_FORMAT = cast(CDFstatus) 1007;
enum SOME_ALREADY_ALLOCATED = cast(CDFstatus) 1008;
enum PRECEEDING_RECORDS_ALLOCATED = cast(CDFstatus) 1009;
enum TT2000_CDF_MAYNEEDUPDATE = cast(CDFstatus) 1010;
enum BLOCKINGFACTOR_TOO_SMALL = cast(CDFstatus) 1011;
enum BLOCKINGFACTOR_TOO_SMALL2 = cast(CDFstatus) 1012;

enum CDF_OK = cast(CDFstatus) 0;

enum ATTR_NAME_TRUNC = cast(CDFstatus) -1001;
enum CDF_NAME_TRUNC = cast(CDFstatus) -1002;
enum VAR_NAME_TRUNC = cast(CDFstatus) -1003;
enum NEGATIVE_FP_ZERO = cast(CDFstatus) -1004;
/* -1005 unused. */
enum FORCED_PARAMETER = cast(CDFstatus) -1006;
enum NA_FOR_VARIABLE = cast(CDFstatus) -1007;

enum CDF_WARN = cast(CDFstatus) -2000;

enum ATTR_EXISTS = cast(CDFstatus) -2001;
enum BAD_CDF_ID = cast(CDFstatus) -2002;
enum BAD_DATA_TYPE = cast(CDFstatus) -2003;
enum BAD_DIM_SIZE = cast(CDFstatus) -2004;
enum BAD_DIM_INDEX = cast(CDFstatus) -2005;
enum BAD_ENCODING = cast(CDFstatus) -2006;
enum BAD_MAJORITY = cast(CDFstatus) -2007;
enum BAD_NUM_DIMS = cast(CDFstatus) -2008;
enum BAD_REC_NUM = cast(CDFstatus) -2009;
enum BAD_SCOPE = cast(CDFstatus) -2010;
enum BAD_NUM_ELEMS = cast(CDFstatus) -2011;
enum CDF_OPEN_ERROR = cast(CDFstatus) -2012;
enum CDF_EXISTS = cast(CDFstatus) -2013;
enum BAD_FORMAT = cast(CDFstatus) -2014;
enum BAD_ALLOCATE_RECS = cast(CDFstatus) -2015;
enum BAD_CDF_EXTENSION = cast(CDFstatus) -2016;
enum NO_SUCH_ATTR = cast(CDFstatus) -2017;
enum NO_SUCH_ENTRY = cast(CDFstatus) -2018;
enum NO_SUCH_VAR = cast(CDFstatus) -2019;
enum VAR_READ_ERROR = cast(CDFstatus) -2020;
enum VAR_WRITE_ERROR = cast(CDFstatus) -2021;
enum BAD_ARGUMENT = cast(CDFstatus) -2022;
enum IBM_PC_OVERFLOW = cast(CDFstatus) -2023;
enum TOO_MANY_VARS = cast(CDFstatus) -2024;
enum VAR_EXISTS = cast(CDFstatus) -2025;
enum BAD_MALLOC = cast(CDFstatus) -2026;
enum NOT_A_CDF = cast(CDFstatus) -2027;
enum CORRUPTED_V2_CDF = cast(CDFstatus) -2028;
enum VAR_OPEN_ERROR = cast(CDFstatus) -2029;
enum BAD_INITIAL_RECS = cast(CDFstatus) -2030;
enum BAD_BLOCKING_FACTOR = cast(CDFstatus) -2031;
enum END_OF_VAR = cast(CDFstatus) -2032;
/* -2033 unused. */
enum BAD_CDFSTATUS = cast(CDFstatus) -2034;
enum CDF_INTERNAL_ERROR = cast(CDFstatus) -2035;
enum BAD_NUM_VARS = cast(CDFstatus) -2036;
enum BAD_REC_COUNT = cast(CDFstatus) -2037;
enum BAD_REC_INTERVAL = cast(CDFstatus) -2038;
enum BAD_DIM_COUNT = cast(CDFstatus) -2039;
enum BAD_DIM_INTERVAL = cast(CDFstatus) -2040;
enum BAD_VAR_NUM = cast(CDFstatus) -2041;
enum BAD_ATTR_NUM = cast(CDFstatus) -2042;
enum BAD_ENTRY_NUM = cast(CDFstatus) -2043;
enum BAD_ATTR_NAME = cast(CDFstatus) -2044;
enum BAD_VAR_NAME = cast(CDFstatus) -2045;
enum NO_ATTR_SELECTED = cast(CDFstatus) -2046;
enum NO_ENTRY_SELECTED = cast(CDFstatus) -2047;
enum NO_VAR_SELECTED = cast(CDFstatus) -2048;
enum BAD_CDF_NAME = cast(CDFstatus) -2049;
/* -2050 unused. */
enum CANNOT_CHANGE = cast(CDFstatus) -2051;
enum NO_STATUS_SELECTED = cast(CDFstatus) -2052;
enum NO_CDF_SELECTED = cast(CDFstatus) -2053;
enum READ_ONLY_DISTRIBUTION = cast(CDFstatus) -2054;
enum CDF_CLOSE_ERROR = cast(CDFstatus) -2055;
enum VAR_CLOSE_ERROR = cast(CDFstatus) -2056;
/* -2057 unused. */
enum BAD_FNC_OR_ITEM = cast(CDFstatus) -2058;
/* -2059 unused. */
enum ILLEGAL_ON_V1_CDF = cast(CDFstatus) -2060;
/* -2061 unused. */
/* -2062 unused. */
enum BAD_CACHE_SIZE = cast(CDFstatus) -2063;
/* -2064 unused. */
/* -2065 unused. */
enum CDF_CREATE_ERROR = cast(CDFstatus) -2066;
enum NO_SUCH_CDF = cast(CDFstatus) -2067;
enum VAR_CREATE_ERROR = cast(CDFstatus) -2068;
/* -2069 unused. */
enum READ_ONLY_MODE = cast(CDFstatus) -2070;
enum ILLEGAL_IN_zMODE = cast(CDFstatus) -2071;
enum BAD_zMODE = cast(CDFstatus) -2072;
enum BAD_READONLY_MODE = cast(CDFstatus) -2073;
enum CDF_READ_ERROR = cast(CDFstatus) -2074;
enum CDF_WRITE_ERROR = cast(CDFstatus) -2075;
enum ILLEGAL_FOR_SCOPE = cast(CDFstatus) -2076;
enum NO_MORE_ACCESS = cast(CDFstatus) -2077;
/* -2078 unused. */
enum BAD_DECODING = cast(CDFstatus) -2079;
/* -2080 unused. */
enum BAD_NEGtoPOSfp0_MODE = cast(CDFstatus) -2081;
enum UNSUPPORTED_OPERATION = cast(CDFstatus) -2082;
enum CDF_SAVE_ERROR = cast(CDFstatus) -2083;
enum VAR_SAVE_ERROR = cast(CDFstatus) -2084;
/* -2085 unused. */
enum NO_WRITE_ACCESS = cast(CDFstatus) -2086;
enum NO_DELETE_ACCESS = cast(CDFstatus) -2087;
enum CDF_DELETE_ERROR = cast(CDFstatus) -2088;
enum VAR_DELETE_ERROR = cast(CDFstatus) -2089;
enum UNKNOWN_COMPRESSION = cast(CDFstatus) -2090;
enum CANNOT_COMPRESS = cast(CDFstatus) -2091;
enum DECOMPRESSION_ERROR = cast(CDFstatus) -2092;
enum COMPRESSION_ERROR = cast(CDFstatus) -2093;
/* -2094 unused. */
/* -2095 unused. */
enum EMPTY_COMPRESSED_CDF = cast(CDFstatus) -2096;
enum BAD_COMPRESSION_PARM = cast(CDFstatus) -2097;
enum UNKNOWN_SPARSENESS = cast(CDFstatus) -2098;
enum CANNOT_SPARSERECORDS = cast(CDFstatus) -2099;
enum CANNOT_SPARSEARRAYS = cast(CDFstatus) -2100;
enum TOO_MANY_PARMS = cast(CDFstatus) -2101;
enum NO_SUCH_RECORD = cast(CDFstatus) -2102;
enum CANNOT_ALLOCATE_RECORDS = cast(CDFstatus) -2103;
/* -2104 unused. */
/* -2105 unused. */
enum SCRATCH_DELETE_ERROR = cast(CDFstatus) -2106;
enum SCRATCH_CREATE_ERROR = cast(CDFstatus) -2107;
enum SCRATCH_READ_ERROR = cast(CDFstatus) -2108;
enum SCRATCH_WRITE_ERROR = cast(CDFstatus) -2109;
enum BAD_SPARSEARRAYS_PARM = cast(CDFstatus) -2110;
enum BAD_SCRATCH_DIR = cast(CDFstatus) -2111;
enum NOT_A_CDF_OR_NOT_SUPPORTED = cast(CDFstatus) -2113;
enum CORRUPTED_V3_CDF = cast(CDFstatus) -2223;
enum ILLEGAL_EPOCH_FIELD = cast(CDFstatus) -2224;
enum BAD_CHECKSUM = cast(CDFstatus) -2225;
enum CHECKSUM_ERROR = cast(CDFstatus) -2226;
enum CHECKSUM_NOT_ALLOWED = cast(CDFstatus) -2227;
enum IS_A_NETCDF = cast(CDFstatus) -2228;
enum TT2000_TIME_ERROR = cast(CDFstatus) -2229;
enum UNABLE_TO_PROCESS_CDF = cast(CDFstatus) -2230;
enum ZLIB_COMPRESS_ERROR = cast(CDFstatus) -2231;
enum ZLIB_UNCOMPRESS_ERROR = cast(CDFstatus) -2232;
enum CANNOT_INSERT_RECORDS = cast(CDFstatus) -2233;
enum TT2000_USED_OUTDATED_TABLE = cast(CDFstatus) -2234;
enum BADDATE_LEAPSECOND_UPDATED = cast(CDFstatus) -2235;
enum FUNCTION_NOT_SUPPORTED = cast(CDFstatus) -2236;
enum TRY_TO_READ_NONSTRING_DATA = cast(CDFstatus) -2237;
enum BAD_NUM_STRINGS = cast(CDFstatus) -2238;

/******************************************************************************
* Functions (for INTERNAL interface).
* NOTE: These values must be different from those of the items.
******************************************************************************/

enum CREATE_ = 1001L;
enum OPEN_ = 1002L;
enum DELETE_ = 1003L;
enum CLOSE_ = 1004L;
enum SELECT_ = 1005L;
enum CONFIRM_ = 1006L;
enum GET_ = 1007L;
enum PUT_ = 1008L;

enum SAVE_ = 1009L;
enum BACKWARD_ = 1010L;
enum GETCDFFILEBACKWARD_ = 1011L;
enum CHECKSUM_ = 1012L;
enum GETCDFCHECKSUM_ = 1013L;
enum VALIDATE_ = 1014L;
enum GETCDFVALIDATE_ = 1015L;
enum GETLEAPSECONDSENVVAR_ = 1016L;

enum NULL_ = 1000L;

/******************************************************************************
* Items on which functions are performed (for INTERNAL interface).
* NOTE: These values must be different from those of the functions.
******************************************************************************/

enum CDF_ = 1L;
enum CDF_NAME_ = 2L;
enum CDF_ENCODING_ = 3L;
enum CDF_DECODING_ = 4L;
enum CDF_MAJORITY_ = 5L;
enum CDF_FORMAT_ = 6L;
enum CDF_COPYRIGHT_ = 7L;
enum CDF_NUMrVARS_ = 8L;
enum CDF_NUMzVARS_ = 9L;
enum CDF_NUMATTRS_ = 10L;
enum CDF_NUMgATTRS_ = 11L;
enum CDF_NUMvATTRS_ = 12L;
enum CDF_VERSION_ = 13L;
enum CDF_RELEASE_ = 14L;
enum CDF_INCREMENT_ = 15L;
enum CDF_STATUS_ = 16L;
enum CDF_READONLY_MODE_ = 17L;
enum CDF_zMODE_ = 18L;
enum CDF_NEGtoPOSfp0_MODE_ = 19L;
enum LIB_COPYRIGHT_ = 20L;
enum LIB_VERSION_ = 21L;
enum LIB_RELEASE_ = 22L;
enum LIB_INCREMENT_ = 23L;
enum LIB_subINCREMENT_ = 24L;
enum rVARs_NUMDIMS_ = 25L;
enum rVARs_DIMSIZES_ = 26L;
enum rVARs_MAXREC_ = 27L;
enum rVARs_RECDATA_ = 28L;
enum rVARs_RECNUMBER_ = 29L;
enum rVARs_RECCOUNT_ = 30L;
enum rVARs_RECINTERVAL_ = 31L;
enum rVARs_DIMINDICES_ = 32L;
enum rVARs_DIMCOUNTS_ = 33L;
enum rVARs_DIMINTERVALS_ = 34L;
enum rVAR_ = 35L;
enum rVAR_NAME_ = 36L;
enum rVAR_DATATYPE_ = 37L;
enum rVAR_NUMELEMS_ = 38L;
enum rVAR_RECVARY_ = 39L;
enum rVAR_DIMVARYS_ = 40L;
enum rVAR_NUMBER_ = 41L;
enum rVAR_DATA_ = 42L;
enum rVAR_HYPERDATA_ = 43L;
enum rVAR_SEQDATA_ = 44L;
enum rVAR_SEQPOS_ = 45L;
enum rVAR_MAXREC_ = 46L;
enum rVAR_MAXallocREC_ = 47L;
enum rVAR_DATASPEC_ = 48L;
enum rVAR_PADVALUE_ = 49L;
enum rVAR_INITIALRECS_ = 50L;
enum rVAR_BLOCKINGFACTOR_ = 51L;
enum rVAR_nINDEXRECORDS_ = 52L;
enum rVAR_nINDEXENTRIES_ = 53L;
enum rVAR_EXISTENCE_ = 54L;
enum zVARs_MAXREC_ = 55L;
enum zVARs_RECDATA_ = 56L;
enum zVAR_ = 57L;
enum zVAR_NAME_ = 58L;
enum zVAR_DATATYPE_ = 59L;
enum zVAR_NUMELEMS_ = 60L;
enum zVAR_NUMDIMS_ = 61L;
enum zVAR_DIMSIZES_ = 62L;
enum zVAR_RECVARY_ = 63L;
enum zVAR_DIMVARYS_ = 64L;
enum zVAR_NUMBER_ = 65L;
enum zVAR_DATA_ = 66L;
enum zVAR_HYPERDATA_ = 67L;
enum zVAR_SEQDATA_ = 68L;
enum zVAR_SEQPOS_ = 69L;
enum zVAR_MAXREC_ = 70L;
enum zVAR_MAXallocREC_ = 71L;
enum zVAR_DATASPEC_ = 72L;
enum zVAR_PADVALUE_ = 73L;
enum zVAR_INITIALRECS_ = 74L;
enum zVAR_BLOCKINGFACTOR_ = 75L;
enum zVAR_nINDEXRECORDS_ = 76L;
enum zVAR_nINDEXENTRIES_ = 77L;
enum zVAR_EXISTENCE_ = 78L;
enum zVAR_RECNUMBER_ = 79L;
enum zVAR_RECCOUNT_ = 80L;
enum zVAR_RECINTERVAL_ = 81L;
enum zVAR_DIMINDICES_ = 82L;
enum zVAR_DIMCOUNTS_ = 83L;
enum zVAR_DIMINTERVALS_ = 84L;
enum ATTR_ = 85L;
enum ATTR_SCOPE_ = 86L;
enum ATTR_NAME_ = 87L;
enum ATTR_NUMBER_ = 88L;
enum ATTR_MAXgENTRY_ = 89L;
enum ATTR_NUMgENTRIES_ = 90L;
enum ATTR_MAXrENTRY_ = 91L;
enum ATTR_NUMrENTRIES_ = 92L;
enum ATTR_MAXzENTRY_ = 93L;
enum ATTR_NUMzENTRIES_ = 94L;
enum ATTR_EXISTENCE_ = 95L;
enum gENTRY_ = 96L;
enum gENTRY_EXISTENCE_ = 97L;
enum gENTRY_DATATYPE_ = 98L;
enum gENTRY_NUMELEMS_ = 99L;
enum gENTRY_DATASPEC_ = 100L;
enum gENTRY_DATA_ = 101L;
enum rENTRY_ = 102L;
enum rENTRY_NAME_ = 103L;
enum rENTRY_EXISTENCE_ = 104L;
enum rENTRY_DATATYPE_ = 105L;
enum rENTRY_NUMELEMS_ = 106L;
enum rENTRY_DATASPEC_ = 107L;
enum rENTRY_DATA_ = 108L;
enum zENTRY_ = 109L;
enum zENTRY_NAME_ = 110L;
enum zENTRY_EXISTENCE_ = 111L;
enum zENTRY_DATATYPE_ = 112L;
enum zENTRY_NUMELEMS_ = 113L;
enum zENTRY_DATASPEC_ = 114L;
enum zENTRY_DATA_ = 115L;
enum STATUS_TEXT_ = 116L;
enum CDF_CACHESIZE_ = 117L;
enum rVARs_CACHESIZE_ = 118L;
enum zVARs_CACHESIZE_ = 119L;
enum rVAR_CACHESIZE_ = 120L;
enum zVAR_CACHESIZE_ = 121L;
enum zVARs_RECNUMBER_ = 122L;
enum rVAR_ALLOCATERECS_ = 123L;
enum zVAR_ALLOCATERECS_ = 124L;
enum DATATYPE_SIZE_ = 125L;
enum CURgENTRY_EXISTENCE_ = 126L;
enum CURrENTRY_EXISTENCE_ = 127L;
enum CURzENTRY_EXISTENCE_ = 128L;
enum CDF_INFO_ = 129L;
enum CDF_COMPRESSION_ = 130L;
enum zVAR_COMPRESSION_ = 131L;
enum zVAR_SPARSERECORDS_ = 132L;
enum zVAR_SPARSEARRAYS_ = 133L;
enum zVAR_ALLOCATEBLOCK_ = 134L;
enum zVAR_NUMRECS_ = 135L;
enum zVAR_NUMallocRECS_ = 136L;
enum rVAR_COMPRESSION_ = 137L;
enum rVAR_SPARSERECORDS_ = 138L;
enum rVAR_SPARSEARRAYS_ = 139L;
enum rVAR_ALLOCATEBLOCK_ = 140L;
enum rVAR_NUMRECS_ = 141L;
enum rVAR_NUMallocRECS_ = 142L;
enum rVAR_ALLOCATEDFROM_ = 143L;
enum rVAR_ALLOCATEDTO_ = 144L;
enum zVAR_ALLOCATEDFROM_ = 145L;
enum zVAR_ALLOCATEDTO_ = 146L;
enum zVAR_nINDEXLEVELS_ = 147L;
enum rVAR_nINDEXLEVELS_ = 148L;
enum CDF_SCRATCHDIR_ = 149L;
enum rVAR_RESERVEPERCENT_ = 150L;
enum zVAR_RESERVEPERCENT_ = 151L;
enum rVAR_RECORDS_ = 152L;
enum zVAR_RECORDS_ = 153L;
enum STAGE_CACHESIZE_ = 154L;
enum COMPRESS_CACHESIZE_ = 155L;
enum CDF_CHECKSUM_ = 156L;
enum rVAR_RECORDS_RENUMBER_ = 157L;
enum zVAR_RECORDS_RENUMBER_ = 158L;
enum CDF_LEAPSECONDLASTUPDATED_ = 159L;
enum rENTRY_STRINGSDATA_ = 160L;
enum zENTRY_STRINGSDATA_ = 161L;
enum rENTRY_NUMSTRINGS_ = 162L;
enum zENTRY_NUMSTRINGS_ = 163L;

enum CDFwithSTATS_ = 200L; /* For CDF internal use only! */
enum CDF_ACCESS_ = 201L; /* For CDF internal use only! */

enum TT2000END = -99999.999;
enum STRINGDELIMITER = "\\N ";

/******************************************************************************
* C interface macros.
******************************************************************************/

alias CDFattrCreate = CDFcreateAttr;  // dstep output changed
alias CDFattrNum = CDFgetAttrNum;     // dstep output changed
alias CDFvarCreate = CDFcreaterVar;   // dstep output changed
alias CDFvarNum = CDFgetVarNum;       // dstep output changed
alias CDFerror = CDFgetStatusText;    // dstep output changed
alias CDFattrRename = CDFrenameAttr;  // dstep output changed
alias CDFopenCDF = CDFopen;           // dstep output changed
alias CDFdeleteCDF = CDFdelete;       // dstep output changed
alias CDFcloseCDF = CDFclose;         // dstep output changed
alias CDFselectCDF = CDFselect;       // dstep output changed

extern (D) auto CDFattrEntryInquire(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems)
{
    return CDFinquireAttrEntry(id, 0, attrNum, entryNum, dataType, numElems);
}

extern (D) auto CDFinquireAttrgEntry(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems)
{
    return CDFinquireAttrEntry(id, 1, attrNum, entryNum, dataType, numElems);
}

extern (D) auto CDFinquireAttrrEntry(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems)
{
    return CDFinquireAttrEntry(id, 2, attrNum, entryNum, dataType, numElems);
}

extern (D) auto CDFinquireAttrzEntry(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems)
{
    return CDFinquireAttrEntry(id, 3, attrNum, entryNum, dataType, numElems);
}

extern (D) auto CDFinquireAttr1Info(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 attrName, auto ref T3 attrScope, auto ref T4 maxEntry)
{
    return CDFinquireAttrInfo(id, 0, attrNum, attrName, attrScope, maxEntry);
}

extern (D) auto CDFinquireAttr2Info(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 attrName, auto ref T3 attrScope, auto ref T4 maxEntry)
{
    return CDFinquireAttrInfo(id, 1, attrNum, attrName, attrScope, maxEntry);
}

extern (D) auto CDFattrPut(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems, auto ref T5 value)
{
    return CDFputAttrEntry(id, 0, attrNum, entryNum, dataType, numElems, value);
}

extern (D) auto CDFputAttrgEntry(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems, auto ref T5 value)
{
    return CDFputAttrEntry(id, 1, attrNum, entryNum, dataType, numElems, value);
}

extern (D) auto CDFputAttrrEntry(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems, auto ref T5 value)
{
    return CDFputAttrEntry(id, 2, attrNum, entryNum, dataType, numElems, value);
}

extern (D) auto CDFputAttrzEntry(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType, auto ref T4 numElems, auto ref T5 value)
{
    return CDFputAttrEntry(id, 3, attrNum, entryNum, dataType, numElems, value);
}

extern (D) auto CDFattrGet(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 value)
{
    return CDFgetAttrEntry(id, 0, attrNum, entryNum, value);
}

extern (D) auto CDFgetAttrgEntry(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 value)
{
    return CDFgetAttrEntry(id, 1, attrNum, entryNum, value);
}

extern (D) auto CDFgetAttrrEntry(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 value)
{
    return CDFgetAttrEntry(id, 2, attrNum, entryNum, value);
}

extern (D) auto CDFgetAttrzEntry(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 value)
{
    return CDFgetAttrEntry(id, 3, attrNum, entryNum, value);
}

extern (D) auto CDFgetAttrrEntryStrings(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numStrings, auto ref T4 strings)
{
    return CDFgetAttrEntryStrings(id, 0, attrNum, entryNum, numStrings, strings);
}

extern (D) auto CDFgetAttrzEntryStrings(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numStrings, auto ref T4 strings)
{
    return CDFgetAttrEntryStrings(id, 1, attrNum, entryNum, numStrings, strings);
}

extern (D) auto CDFputAttrrEntryStrings(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numStrings, auto ref T4 strings)
{
    return CDFputAttrEntryStrings(id, 0, attrNum, entryNum, numStrings, strings);
}

extern (D) auto CDFputAttrzEntryStrings(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numStrings, auto ref T4 strings)
{
    return CDFputAttrEntryStrings(id, 1, attrNum, entryNum, numStrings, strings);
}

extern (D) auto CDFgetAttrgEntryDataType(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType)
{
    return CDFgetAttrEntryDataType(id, 1, attrNum, entryNum, dataType);
}

extern (D) auto CDFgetAttrrEntryDataType(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType)
{
    return CDFgetAttrEntryDataType(id, 2, attrNum, entryNum, dataType);
}

extern (D) auto CDFgetAttrzEntryDataType(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType)
{
    return CDFgetAttrEntryDataType(id, 3, attrNum, entryNum, dataType);
}

extern (D) auto CDFsetAttrgEntryDataSpec(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType)
{
    return CDFsetAttrEntryDataSpec(id, 1, attrNum, entryNum, dataType, cast(c_long) -99);
}

extern (D) auto CDFsetAttrrEntryDataSpec(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType)
{
    return CDFsetAttrEntryDataSpec(id, 2, attrNum, entryNum, dataType, cast(c_long) -99);
}

extern (D) auto CDFsetAttrzEntryDataSpec(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 dataType)
{
    return CDFsetAttrEntryDataSpec(id, 3, attrNum, entryNum, dataType, cast(c_long) -99);
}

// dstep output adjustment: change from enum to alias
alias CDFvarRename = CDFrenamerVar;

extern (D) auto CDFrenamerVar(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 varName)
{
    return CDFrenameVar(id, 0, varNum, varName);
}

extern (D) auto CDFrenamezVar(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 varName)
{
    return CDFrenameVar(id, 1, varNum, varName);
}

extern (D) auto CDFinquirerVar(T0, T1, T2, T3, T4, T5, T6, T7, T8)(auto ref T0 id, auto ref T1 varN, auto ref T2 varName, auto ref T3 dataType, auto ref T4 numElems, auto ref T5 numDims, auto ref T6 dimSizes, auto ref T7 recVary, auto ref T8 dimVarys)
{
    return CDFinquireVar(id, 0, varN, varName, dataType, numElems, numDims, dimSizes, recVary, dimVarys);
}

extern (D) auto CDFinquirezVar(T0, T1, T2, T3, T4, T5, T6, T7, T8)(auto ref T0 id, auto ref T1 varN, auto ref T2 varName, auto ref T3 dataType, auto ref T4 numElems, auto ref T5 numDims, auto ref T6 dimSizes, auto ref T7 recVary, auto ref T8 dimVarys)
{
    return CDFinquireVar(id, 1, varN, varName, dataType, numElems, numDims, dimSizes, recVary, dimVarys);
}

alias CDFvarPut = CDFputrVarData;  // dstep output changed

extern (D) auto CDFputrVarData(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 indices, auto ref T4 value)
{
    return CDFputVarData(id, 0, varNum, recNum, indices, value);
}

extern (D) auto CDFputzVarData(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 indices, auto ref T4 value)
{
    return CDFputVarData(id, 1, varNum, recNum, indices, value);
}

alias CDFvarGet = CDFgetrVarData; // dstep output changed

extern (D) auto CDFgetrVarData(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 indices, auto ref T4 value)
{
    return CDFgetVarData(id, 0, varNum, recNum, indices, value);
}

extern (D) auto CDFgetzVarData(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 indices, auto ref T4 value)
{
    return CDFgetVarData(id, 1, varNum, recNum, indices, value);
}

alias CDFvarHyperPut = CDFhyperPutrVarData; // dstep output changed

extern (D) auto CDFhyperPutrVarData(T0, T1, T2, T3, T4, T5, T6, T7, T8)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recS, auto ref T3 recC, auto ref T4 recI, auto ref T5 indices, auto ref T6 counts, auto ref T7 intervals, auto ref T8 buff)
{
    return CDFhyperPutVarData(id, 0, varNum, recS, recC, recI, indices, counts, intervals, buff);
}

extern (D) auto CDFhyperPutzVarData(T0, T1, T2, T3, T4, T5, T6, T7, T8)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recS, auto ref T3 recC, auto ref T4 recI, auto ref T5 indices, auto ref T6 counts, auto ref T7 intervals, auto ref T8 buff)
{
    return CDFhyperPutVarData(id, 1, varNum, recS, recC, recI, indices, counts, intervals, buff);
}

alias CDFvarHyperGet = CDFhyperGetrVarData; // dstep output changed

extern (D) auto CDFhyperGetrVarData(T0, T1, T2, T3, T4, T5, T6, T7, T8)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recS, auto ref T3 recC, auto ref T4 recI, auto ref T5 indices, auto ref T6 counts, auto ref T7 intervals, auto ref T8 buff)
{
    return CDFhyperGetVarData(id, 0, varNum, recS, recC, recI, indices, counts, intervals, buff);
}

extern (D) auto CDFhyperGetzVarData(T0, T1, T2, T3, T4, T5, T6, T7, T8)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recS, auto ref T3 recC, auto ref T4 recI, auto ref T5 indices, auto ref T6 counts, auto ref T7 intervals, auto ref T8 buff)
{
    return CDFhyperGetVarData(id, 1, varNum, recS, recC, recI, indices, counts, intervals, buff);
}

alias CDFvarClose = CDFcloserVar;  // dstep output changed

extern (D) auto CDFcloserVar(T0, T1)(auto ref T0 id, auto ref T1 varNum)
{
    return CDFcloseVar(id, 0, varNum);
}

extern (D) auto CDFclosezVar(T0, T1)(auto ref T0 id, auto ref T1 varNum)
{
    return CDFcloseVar(id, 1, varNum);
}

extern (D) auto CDFdeleteAttrgEntry(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum)
{
    return CDFdeleteAttrEntry(id, 1, attrNum, entryNum);
}

extern (D) auto CDFdeleteAttrrEntry(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum)
{
    return CDFdeleteAttrEntry(id, 2, attrNum, entryNum);
}

extern (D) auto CDFdeleteAttrzEntry(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum)
{
    return CDFdeleteAttrEntry(id, 3, attrNum, entryNum);
}

extern (D) auto CDFgetNumAttrgEntries(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 numEntries)
{
    return CDFgetNumAttrEntries(id, 1, attrNum, numEntries);
}

extern (D) auto CDFgetNumAttrrEntries(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 numEntries)
{
    return CDFgetNumAttrEntries(id, 2, attrNum, numEntries);
}

extern (D) auto CDFgetNumAttrzEntries(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 numEntries)
{
    return CDFgetNumAttrEntries(id, 3, attrNum, numEntries);
}

extern (D) auto CDFgetAttrMaxgEntry(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 maxEntry)
{
    return CDFgetAttrMaxEntry(id, 1, attrNum, maxEntry);
}

extern (D) auto CDFgetAttrMaxrEntry(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 maxEntry)
{
    return CDFgetAttrMaxEntry(id, 2, attrNum, maxEntry);
}

extern (D) auto CDFgetAttrMaxzEntry(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 maxEntry)
{
    return CDFgetAttrMaxEntry(id, 3, attrNum, maxEntry);
}

extern (D) auto CDFgetAttrgEntryNumElements(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numElems)
{
    return CDFgetAttrEntryNumElements(id, 1, attrNum, entryNum, numElems);
}

extern (D) auto CDFgetAttrrEntryNumElements(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numElems)
{
    return CDFgetAttrEntryNumElements(id, 2, attrNum, entryNum, numElems);
}

extern (D) auto CDFgetAttrzEntryNumElements(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numElems)
{
    return CDFgetAttrEntryNumElements(id, 3, attrNum, entryNum, numElems);
}

extern (D) auto CDFgetAttrrEntryNumStrings(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numStrings)
{
    return CDFgetAttrEntryNumStrings(id, 0, attrNum, entryNum, numStrings);
}

extern (D) auto CDFgetAttrzEntryNumStrings(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum, auto ref T3 numStrings)
{
    return CDFgetAttrEntryNumStrings(id, 1, attrNum, entryNum, numStrings);
}

extern (D) auto CDFgetNumrVars(T0, T1)(auto ref T0 id, auto ref T1 numVars)
{
    return CDFgetNumVars(id, 0, numVars);
}

extern (D) auto CDFgetNumzVars(T0, T1)(auto ref T0 id, auto ref T1 numVars)
{
    return CDFgetNumVars(id, 1, numVars);
}

extern (D) auto CDFdeletezVar(T0, T1)(auto ref T0 id, auto ref T1 varNum)
{
    return CDFdeleteVar(id, 1, varNum);
}

extern (D) auto CDFdeletezVarRecords(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 sRec, auto ref T3 eRec)
{
    return CDFdeleteVarRecords(id, 1, varNum, sRec, eRec);
}

extern (D) auto CDFdeletezVarRecordsRenumber(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 sRec, auto ref T3 eRec)
{
    return CDFdeleteVarRecordsRenumber(id, 1, varNum, sRec, eRec);
}

extern (D) auto CDFgetzVarName(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 varName)
{
    return CDFgetVarName(id, 1, varNum, varName);
}

extern (D) auto CDFgetzVarMaxWrittenRecNum(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 maxRec)
{
    return CDFgetVarMaxWrittenRecNum(id, 1, varNum, maxRec);
}

extern (D) auto CDFgetzVarsMaxWrittenRecNum(T0, T1)(auto ref T0 id, auto ref T1 maxRec)
{
    return CDFgetVarsMaxWrittenRecNum(id, 1, maxRec);
}

extern (D) auto CDFgetzVarMaxAllocRecNum(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 maxAllocRec)
{
    return CDFgetVarMaxAllocRecNum(id, 1, varNum, maxAllocRec);
}

extern (D) auto CDFgetzVarDataType(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 dataType)
{
    return CDFgetVarDataType(id, 1, varNum, dataType);
}

extern (D) auto CDFgetzVarAllocRecords(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 allocRecs)
{
    return CDFgetVarAllocRecords(id, 1, varNum, allocRecs);
}

extern (D) auto CDFsetzVarAllocRecords(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 allocRecs)
{
    return CDFsetVarAllocRecords(id, 1, varNum, allocRecs);
}

extern (D) auto CDFsetzVarAllocBlockRecords(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 firstRec, auto ref T3 lastRec)
{
    return CDFsetVarAllocBlockRecords(id, 1, varNum, firstRec, lastRec);
}

extern (D) auto CDFgetzVarBlockingFactor(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 bf)
{
    return CDFgetVarBlockingFactor(id, 1, varNum, bf);
}

extern (D) auto CDFsetzVarBlockingFactor(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 bf)
{
    return CDFsetVarBlockingFactor(id, 1, varNum, bf);
}

extern (D) auto CDFgetzVarCompression(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 cType, auto ref T3 cParms, auto ref T4 cPct)
{
    return CDFgetVarCompression(id, 1, varNum, cType, cParms, cPct);
}

extern (D) auto CDFsetzVarCompression(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 cType, auto ref T3 cParms)
{
    return CDFsetVarCompression(id, 1, varNum, cType, cParms);
}

extern (D) auto CDFsetzVarDataSpec(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 dataType)
{
    return CDFsetVarDataSpec(id, 1, varNum, dataType, cast(c_long) -99);
}

extern (D) auto CDFsetzVarDimVariances(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 dimVarys)
{
    return CDFsetVarDimVariances(id, 1, varNum, dimVarys);
}

extern (D) auto CDFgetzVarDimVariances(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 dimVarys)
{
    return CDFgetVarDimVariances(id, 1, varNum, dimVarys);
}

extern (D) auto CDFgetzVarNumElements(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 numEles)
{
    return CDFgetVarNumElements(id, 1, varNum, numEles);
}

extern (D) auto CDFgetzVarNumRecsWritten(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 numRecs)
{
    return CDFgetVarNumRecsWritten(id, 1, varNum, numRecs);
}

extern (D) auto CDFsetzVarInitialRecs(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 initRecs)
{
    return CDFsetVarInitialRecs(id, 1, varNum, initRecs);
}

extern (D) auto CDFgetzVarPadValue(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 pad)
{
    return CDFgetVarPadValue(id, 1, varNum, pad);
}

extern (D) auto CDFsetzVarPadValue(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 pad)
{
    return CDFsetVarPadValue(id, 1, varNum, pad);
}

extern (D) auto CDFgetzVarRecVariance(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recVary)
{
    return CDFgetVarRecVariance(id, 1, varNum, recVary);
}

extern (D) auto CDFsetzVarRecVariance(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recVary)
{
    return CDFsetVarRecVariance(id, 1, varNum, recVary);
}

extern (D) auto CDFgetzVarSeqData(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 data)
{
    return CDFgetVarSeqData(id, 1, varNum, data);
}

extern (D) auto CDFputzVarSeqData(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 data)
{
    return CDFputVarSeqData(id, 1, varNum, data);
}

extern (D) auto CDFgetzVarSparseRecords(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 sprecs)
{
    return CDFgetVarSparseRecords(id, 1, varNum, sprecs);
}

extern (D) auto CDFsetzVarSparseRecords(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 sprecs)
{
    return CDFsetVarSparseRecords(id, 1, varNum, sprecs);
}

extern (D) auto CDFgetzVarsRecordData(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 numVars, auto ref T2 varNames, auto ref T3 recNum, auto ref T4 bufferPtr)
{
    return CDFgetVarsRecordDatabyNames(id, 1, numVars, varNames, recNum, bufferPtr);
}

extern (D) auto CDFputzVarsRecordData(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 numVars, auto ref T2 varNames, auto ref T3 recNum, auto ref T4 bufferPtr)
{
    return CDFputVarsRecordDatabyNames(id, 1, numVars, varNames, recNum, bufferPtr);
}

extern (D) auto CDFgetzVarsRecordDatabyNumbers(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 numVars, auto ref T2 varNumbers, auto ref T3 recNum, auto ref T4 buffer)
{
    return CDFgetVarsRecordDatabyNumbers(id, 1, numVars, varNumbers, recNum, buffer);
}

extern (D) auto CDFputzVarsRecordDatabyNumbers(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 numVars, auto ref T2 varNumbers, auto ref T3 recNum, auto ref T4 buffer)
{
    return CDFputVarsRecordDatabyNumbers(id, 1, numVars, varNumbers, recNum, buffer);
}

extern (D) auto CDFgetzVarRecordData(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 buffer)
{
    return CDFgetVarRecordData(id, 1, varNum, recNum, buffer);
}

extern (D) auto CDFputzVarRecordData(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 buffer)
{
    return CDFputVarRecordData(id, 1, varNum, recNum, buffer);
}

extern (D) auto CDFsetzVarCacheSize(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 numBuffers)
{
    return CDFsetVarCacheSize(id, 1, varNum, numBuffers);
}

extern (D) auto CDFsetzVarsCacheSize(T0, T1)(auto ref T0 id, auto ref T1 numBuffers)
{
    return CDFsetVarsCacheSize(id, 1, numBuffers);
}

extern (D) auto CDFgetzVarCacheSize(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 numBuffers)
{
    return CDFgetVarCacheSize(id, 1, varNum, numBuffers);
}

extern (D) auto CDFconfirmzVarExistence(T0, T1)(auto ref T0 id, auto ref T1 varName)
{
    return CDFconfirmVarExistence(id, 1, varName);
}

extern (D) auto CDFconfirmzVarPadValueExistence(T0, T1)(auto ref T0 id, auto ref T1 varNum)
{
    return CDFconfirmVarPadValueExistence(id, 1, varNum);
}

extern (D) auto CDFgetzVarReservePercent(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 percent)
{
    return CDFgetVarReservePercent(id, 1, varNum, percent);
}

extern (D) auto CDFsetzVarReservePercent(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 percent)
{
    return CDFsetVarReservePercent(id, 1, varNum, percent);
}

extern (D) auto CDFgetzVarSeqPos(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 indices)
{
    return CDFgetVarSeqPos(id, 1, varNum, recNum, indices);
}

extern (D) auto CDFsetzVarSeqPos(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 recNum, auto ref T3 indices)
{
    return CDFsetVarSeqPos(id, 1, varNum, recNum, indices);
}

extern (D) auto CDFgetzVarAllRecordsByVarID(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 buffer)
{
    return CDFgetVarAllRecordsByVarID(id, 1, varNum, buffer);
}

extern (D) auto CDFputzVarAllRecordsByVarID(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 varNum, auto ref T2 numRecs, auto ref T3 buffer)
{
    return CDFputVarAllRecordsByVarID(id, 1, varNum, numRecs, buffer);
}

extern (D) auto CDFgetzVarRangeRecordsByVarID(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 startRec, auto ref T3 stopRec, auto ref T4 buffer)
{
    return CDFgetVarRangeRecordsByVarID(id, 1, varNum, startRec, stopRec, buffer);
}

extern (D) auto CDFputzVarRangeRecordsByVarID(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 startRec, auto ref T3 stopRec, auto ref T4 buffer)
{
    return CDFputVarRangeRecordsByVarID(id, 1, varNum, startRec, stopRec, buffer);
}

extern (D) auto CDFinsertzVarRecordsByVarID(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 startRec, auto ref T3 numRecs, auto ref T4 buffer)
{
    return CDFinsertVarRecordsByVarID(id, 1, varNum, startRec, numRecs, buffer);
}

extern (D) auto CDFinsertrVarRecordsByVarID(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 varNum, auto ref T2 startRec, auto ref T3 numRecs, auto ref T4 buffer)
{
    return CDFinsertVarRecordsByVarID(id, 0, varNum, startRec, numRecs, buffer);
}

/*
 * CLOSE_  *
 *         */

//extern (D) auto CDFclose(T)(auto ref T id)
//### 5.8 CDFclose
extern (D) CDFstatus CDFclose(CDFid id){
   return CDFlib(SELECT_, CDF_, id, CLOSE_, CDF_, NULL_);
}

//extern (D) CDFstatus CDFcloseVar(T0, T1, T2)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum)
extern (D) CDFcloseVar(CDFid id, int zVar, c_long varNum){
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, CLOSE_, zVar ? zVAR_ : rVAR_, NULL_);
}

/*
 * CONFIRM_  *
 *           */

//extern (D) auto CDFconfirmAttrExistence(T0, T1)(auto ref T0 id, auto ref T1 attrName)
extern (D) CDFstatus CDFconfirmAttrExistence(
   CDFid id, /* in */
   const char *attrName, /* in */
){
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, ATTR_EXISTENCE_, attrName, NULL_);
}

extern (D) auto CDFgetCacheSize(T0, T1)(auto ref T0 id, auto ref T1 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, CDF_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFgetVarCacheSize(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, CONFIRM_, zVar ? zVAR_CACHESIZE_ : rVAR_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFgetDecoding(T0, T1)(auto ref T0 id, auto ref T1 decoding)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, CDF_DECODING_, decoding, NULL_);
}

extern (D) auto CDFgetName(T0, T1)(auto ref T0 id, auto ref T1 cdfName)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, CDF_NAME_, cdfName, NULL_);
}

extern (D) auto CDFgetNegtoPosfp0Mode(T0, T1)(auto ref T0 id, auto ref T1 negtoPosfp0)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, CDF_NEGtoPOSfp0_MODE_, negtoPosfp0, NULL_);
}

extern (D) auto CDFgetReadOnlyMode(T0, T1)(auto ref T0 id, auto ref T1 readOnlyMode)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, CDF_READONLY_MODE_, readOnlyMode, NULL_);
}

extern (D) auto CDFgetzMode(T0, T1)(auto ref T0 id, auto ref T1 zMode)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, CDF_zMODE_, zMode, NULL_);
}

extern (D) auto CDFgetCompressionCacheSize(T0, T1)(auto ref T0 id, auto ref T1 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, COMPRESS_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFconfirmgEntryExistence(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, CONFIRM_, gENTRY_EXISTENCE_, entryNum, NULL_);
}

extern (D) auto CDFconfirmrEntryExistence(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, CONFIRM_, rENTRY_EXISTENCE_, entryNum, NULL_);
}

extern (D) auto CDFgetStageCacheSize(T0, T1)(auto ref T0 id, auto ref T1 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, STAGE_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFconfirmVarExistence(T0, T1, T2)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varName)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, zVar ? zVAR_EXISTENCE_ : rVAR_EXISTENCE_, varName, NULL_);
}

extern (D) auto CDFconfirmVarPadValueExistence(T0, T1, T2)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, CONFIRM_, zVar ? zVAR_PADVALUE_ : rVAR_PADVALUE_, NULL_);
}

extern (D) auto CDFgetVarReservePercent(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 percent)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, CONFIRM_, zVar ? zVAR_RESERVEPERCENT_ : rVAR_RESERVEPERCENT_, percent, NULL_);
}

extern (D) auto CDFgetVarSeqPos(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 recNum, auto ref T4 indices)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, CONFIRM_, zVar ? zVAR_SEQPOS_ : rVAR_SEQPOS_, recNum, indices, NULL_);
}

extern (D) auto CDFconfirmzEntryExistence(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 entryNum)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, CONFIRM_, zENTRY_EXISTENCE_, entryNum, NULL_);
}

extern (D) auto CDFconfirmChecksum(T)(auto ref T id)
{
    return CDFlib(SELECT_, CDF_, id, CONFIRM_, CDF_CHECKSUM_, NULL_);
}

/*
 * CREATE_ *
 *         */

extern (D) auto CDFcreate(T0, T1, T2, T3, T4, T5)(auto ref T0 CDFname, auto ref T1 numDims, auto ref T2 dimSizes, auto ref T3 encoding, auto ref T4 majority, auto ref T5 id)
{
    return CDFlib(CREATE_, CDF_, CDFname, numDims, dimSizes, id, PUT_, CDF_ENCODING_, encoding, CDF_MAJORITY_, majority, NULL_);
}



extern (D) auto CDFcreateAttr(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 attrName, auto ref T2 attrScope, auto ref T3 attrNum)
{
    return CDFlib(SELECT_, CDF_, id, CREATE_, ATTR_, attrName, attrScope, attrNum, NULL_);
}

extern (D) auto CDFcreaterVar(T0, T1, T2, T3, T4, T5, T6)(auto ref T0 id, auto ref T1 varName, auto ref T2 dataType, auto ref T3 numElements, auto ref T4 recVary, auto ref T5 dimVarys, auto ref T6 varNum)
{
    return CDFlib(SELECT_, CDF_, id, CREATE_, rVAR_, varName, dataType, numElements, recVary, dimVarys, varNum, NULL_);
}

// dstep output changed
//extern (D) auto CDFcreatezVar(T0, T1, T2, T3, T4, T5, T6, T7, T8)(auto ref T0 id, auto ref T1 varName, auto ref T2 dataType, auto ref T3 numElements, auto ref T4 numDims, auto ref T5 dimSizes, auto ref T6 recVary, auto ref T7 dimVarys, auto ref T8 varNum)
//{
//    return CDFlib(SELECT_, CDF_, id, CREATE_, zVAR_, varName, dataType, numElements, numDims, dimSizes, recVary, dimVarys, varNum, NULL_);
//}
// 6.3.4 CDFcreatezVar
extern (D) CDFstatus CDFcreatezVar( /* out -- Completion status code. */
  CDFid id, /* in -- CDF identifier. */
  const char *varName, /* in -- zVariable name. */
  c_long dataType, /* in -- Data type. */
  c_long numElements, /* in -- Number of elements (of the data type). */
  c_long numDims, /* in -- Number of dimensions. */
  const c_long dimSizes, /* in -- Dimension sizes */
  c_long recVariance, /* in -- Record variance. */
  const c_long dimVariances, /* in -- Dimension variances. */
  c_long *varNum) /* out -- zVariable number. */
{
   return CDFlib(
      SELECT_, CDF_, id, CREATE_, zVAR_, varName, dataType, numElements, 
      numDims, dimSizes, recVary, dimVarys, varNum, NULL_
   );
}

/*
 * DELETE_ *
 *         */

extern (D) auto CDFdelete(T)(auto ref T id)
{
    return CDFlib(SELECT_, CDF_, id, DELETE_, CDF_, NULL_);
}

extern (D) auto CDFdeleteAttr(T0, T1)(auto ref T0 id, auto ref T1 attrNum)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, DELETE_, ATTR_, NULL_);
}

extern (D) auto CDFdeleteVar(T0, T1, T2)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, DELETE_, zVar ? zVAR_ : rVAR_, NULL_);
}

extern (D) auto CDFdeleteVarRecords(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 firstRec, auto ref T4 lastRec)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, DELETE_, zVar ? zVAR_RECORDS_ : rVAR_RECORDS_, firstRec, lastRec, NULL_);
}

extern (D) auto CDFdeleteVarRecordsRenumber(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 firstRec, auto ref T4 lastRec)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, DELETE_, zVar ? zVAR_RECORDS_RENUMBER_ : rVAR_RECORDS_RENUMBER_, firstRec, lastRec, NULL_);
}

/*
 * GET_ *
 *      */

extern (D) auto CDFgetAttrName(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 attrName)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, GET_, ATTR_NAME_, attrName, NULL_);
}

extern (D) auto CDFgetAttrScope(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 attrScope)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, GET_, ATTR_SCOPE_, attrScope, NULL_);
}

extern (D) auto CDFgetCompression(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 cType, auto ref T2 cParms, auto ref T3 cPercent)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_COMPRESSION_, cType, cParms, cPercent, NULL_);
}

extern (D) auto CDFgetCopyright(T0, T1)(auto ref T0 id, auto ref T1 copyright)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_COPYRIGHT_, copyright, NULL_);
}

extern (D) auto CDFgetEncoding(T0, T1)(auto ref T0 id, auto ref T1 encoding)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_ENCODING_, encoding, NULL_);
}

extern (D) auto CDFgetFormat(T0, T1)(auto ref T0 id, auto ref T1 format)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_FORMAT_, format, NULL_);
}

extern (D) auto CDFgetLeapSecondLastUpdated(T0, T1)(auto ref T0 id, auto ref T1 lastUpdated)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_LEAPSECONDLASTUPDATED_, lastUpdated, NULL_);
}

extern (D) auto CDFgetCompressionInfo(T0, T1, T2, T3, T4)(auto ref T0 name, auto ref T1 cType, auto ref T2 cParms, auto ref T3 cSize, auto ref T4 uSize)
{
    return CDFlib(GET_, CDF_INFO_, name, cType, cParms, cSize, uSize, NULL_);
}

extern (D) auto CDFgetMajority(T0, T1)(auto ref T0 id, auto ref T1 majority)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_MAJORITY_, majority, NULL_);
}

extern (D) auto CDFgetNumAttributes(T0, T1)(auto ref T0 id, auto ref T1 numAttrs)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_NUMATTRS_, numAttrs, NULL_);
}

extern (D) auto CDFgetNumgAttributes(T0, T1)(auto ref T0 id, auto ref T1 numgAttrs)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_NUMgATTRS_, numgAttrs, NULL_);
}

extern (D) auto CDFgetNumVars(T0, T1, T2)(auto ref T0 id, auto ref T1 zVar, auto ref T2 numVars)
{
    return CDFlib(SELECT_, CDF_, id, GET_, zVar ? CDF_NUMzVARS_ : CDF_NUMrVARS_, numVars, NULL_);
}

extern (D) auto CDFgetNumvAttributes(T0, T1)(auto ref T0 id, auto ref T1 numvAttrs)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_NUMvATTRS_, numvAttrs, NULL_);
}

extern (D) auto CDFdoc(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 version_, auto ref T2 release, auto ref T3 copyright)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_VERSION_, version_, CDF_RELEASE_, release, CDF_COPYRIGHT_, copyright, NULL_);
}

extern (D) auto CDFgetDataTypeSize(T0, T1)(auto ref T0 dataType, auto ref T1 numBytes)
{
    return CDFlib(GET_, DATATYPE_SIZE_, dataType, numBytes, NULL_);
}

extern (D) auto CDFgetLibraryCopyright(T)(auto ref T copyright)
{
    return CDFlib(GET_, LIB_COPYRIGHT_, copyright, NULL_);
}

extern (D) auto CDFgetLibraryVersion(T0, T1, T2, T3)(auto ref T0 version_, auto ref T1 release, auto ref T2 increment, auto ref T3 subincrement)
{
    return CDFlib(GET_, LIB_VERSION_, version_, LIB_RELEASE_, release, LIB_INCREMENT_, increment, LIB_subINCREMENT_, subincrement, NULL_);
}

extern (D) auto CDFgetVersion(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 version_, auto ref T2 release, auto ref T3 increment)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_VERSION_, version_, CDF_RELEASE_, release, CDF_INCREMENT_, increment, NULL_);
}

extern (D) auto CDFgetVarBlockingFactor(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 bf)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_BLOCKINGFACTOR_ : rVAR_BLOCKINGFACTOR_, bf, NULL_);
}

extern (D) auto CDFgetVarCompression(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 cType, auto ref T4 cParms, auto ref T5 cPct)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_COMPRESSION_ : rVAR_COMPRESSION_, cType, cParms, cPct, NULL_);
}

extern (D) auto CDFgetVarData(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 recNum, auto ref T4 indices, auto ref T5 value)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, zVar ? zVAR_RECNUMBER_ : rVARs_RECNUMBER_, recNum, zVar ? zVAR_DIMINDICES_ : rVARs_DIMINDICES_, indices, GET_, zVar ? zVAR_DATA_ : rVAR_DATA_, value, NULL_);
}

extern (D) auto CDFgetVarDataType(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 dataType)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_DATATYPE_ : rVAR_DATATYPE_, dataType, NULL_);
}

extern (D) auto CDFgetVarDimVariances(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 dimVarys)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_DIMVARYS_ : rVAR_DIMVARYS_, dimVarys, NULL_);
}

extern (D) auto CDFgetVarMaxAllocRecNum(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 maxAllocRec)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_MAXallocREC_ : rVAR_MAXallocREC_, maxAllocRec, NULL_);
}

extern (D) auto CDFgetVarMaxWrittenRecNum(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 maxRec)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_MAXREC_ : rVAR_MAXREC_, maxRec, NULL_);
}

extern (D) auto CDFgetVarAllocRecords(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 numAllocRecs)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_NUMallocRECS_ : rVAR_NUMallocRECS_, numAllocRecs, NULL_);
}

extern (D) auto CDFgetVarNumElements(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 numElements)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_NUMELEMS_ : rVAR_NUMELEMS_, numElements, NULL_);
}

extern (D) auto CDFgetVarNumRecsWritten(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 numRecs)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_NUMRECS_ : rVAR_NUMRECS_, numRecs, NULL_);
}

extern (D) auto CDFgetVarPadValue(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 padValue)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_PADVALUE_ : rVAR_PADVALUE_, padValue, NULL_);
}

extern (D) auto CDFgetVarRecVariance(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 recVary)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_RECVARY_ : rVAR_RECVARY_, recVary, NULL_);
}

extern (D) auto CDFgetVarSeqData(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 seqData)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_SEQDATA_ : rVAR_SEQDATA_, seqData, NULL_);
}

extern (D) auto CDFgetVarsRecordDatabyNumbers(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 zVar, auto ref T2 numVars, auto ref T3 varNums, auto ref T4 recNum, auto ref T5 buffer)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVARs_RECNUMBER_ : rVARs_RECNUMBER_, recNum, GET_, zVar ? zVARs_RECDATA_ : rVARs_RECDATA_, numVars, varNums, buffer, NULL_);
}

extern (D) auto CDFgetVarSparseRecords(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 sparseRecs)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_SPARSERECORDS_ : rVAR_SPARSERECORDS_, sparseRecs, NULL_);
}

extern (D) auto CDFgetrVarsDimSizes(T0, T1)(auto ref T0 id, auto ref T1 dimSizes)
{
    return CDFlib(SELECT_, CDF_, id, GET_, rVARs_DIMSIZES_, dimSizes, NULL_);
}

extern (D) auto CDFgetzVarDimSizes(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 dimSizes)
{
    return CDFlib(SELECT_, CDF_, id, zVAR_, varNum, GET_, zVAR_DIMSIZES_, dimSizes, NULL_);
}

extern (D) auto CDFgetVarName(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 varName)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, GET_, zVar ? zVAR_NAME_ : rVAR_NAME_, varName, NULL_);
}

extern (D) auto CDFgetzVarNumDims(T0, T1, T2)(auto ref T0 id, auto ref T1 varNum, auto ref T2 numDims)
{
    return CDFlib(SELECT_, CDF_, id, zVAR_, varNum, GET_, zVAR_NUMDIMS_, numDims, NULL_);
}

extern (D) auto CDFgetrVarsNumDims(T0, T1)(auto ref T0 id, auto ref T1 numDims)
{
    return CDFlib(SELECT_, CDF_, id, GET_, rVARs_NUMDIMS_, numDims, NULL_);
}

extern (D) auto CDFgetStatusText(T0, T1)(auto ref T0 status, auto ref T1 text)
{
    return CDFlib(SELECT_, CDF_STATUS_, status, GET_, STATUS_TEXT_, text, NULL_);
}

extern (D) auto CDFhyperGetVarData(T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varN, auto ref T3 recS, auto ref T4 recC, auto ref T5 recI, auto ref T6 indices, auto ref T7 counts, auto ref T8 intervals, auto ref T9 buff)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varN, zVar ? zVAR_RECNUMBER_ : rVARs_RECNUMBER_, recS, zVar ? zVAR_RECCOUNT_ : rVARs_RECCOUNT_, recC, zVar ? zVAR_RECINTERVAL_ : rVARs_RECINTERVAL_, recI, zVar ? zVAR_DIMINDICES_ : rVARs_DIMINDICES_, indices, zVar ? zVAR_DIMCOUNTS_ : rVARs_DIMCOUNTS_, counts, zVar ? zVAR_DIMINTERVALS_ : rVARs_DIMINTERVALS_, intervals, GET_, zVar ? zVAR_HYPERDATA_ : rVAR_HYPERDATA_, buff, NULL_);
}

extern (D) auto CDFgetMaxWrittenRecNums(T0, T1, T2)(auto ref T0 id, auto ref T1 maxRecrVars, auto ref T2 maxReczVars)
{
    return CDFlib(SELECT_, CDF_, id, GET_, rVARs_MAXREC_, maxRecrVars, zVARs_MAXREC_, maxReczVars, NULL_);
}

extern (D) auto CDFgetVarsMaxWrittenRecNum(T0, T1, T2)(auto ref T0 id, auto ref T1 zVar, auto ref T2 maxRecVar)
{
    return CDFlib(SELECT_, CDF_, id, GET_, zVar ? zVARs_MAXREC_ : rVARs_MAXREC_, maxRecVar, NULL_);
}

extern (D) auto CDFinquireVar(T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varN, auto ref T3 varName, auto ref T4 dataType, auto ref T5 numElements, auto ref T6 numDims, auto ref T7 dimSizes, auto ref T8 recVary, auto ref T9 dimVarys)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varN, GET_, zVar ? zVAR_NAME_ : rVAR_NAME_, varName, zVar ? zVAR_DATATYPE_ : rVAR_DATATYPE_, dataType, zVar ? zVAR_NUMELEMS_ : rVAR_NUMELEMS_, numElements, zVar ? zVAR_NUMDIMS_ : rVARs_NUMDIMS_, numDims, zVar ? zVAR_DIMSIZES_ : rVARs_DIMSIZES_, dimSizes, zVar ? zVAR_RECVARY_ : rVAR_RECVARY_, recVary, zVar ? zVAR_DIMVARYS_ : rVAR_DIMVARYS_, dimVarys, NULL_);
}

extern (D) auto CDFvarInquire(T0, T1, T2, T3, T4, T5, T6)(auto ref T0 id, auto ref T1 varN, auto ref T2 varName, auto ref T3 dataType, auto ref T4 numElements, auto ref T5 recVary, auto ref T6 dimVarys)
{
    return CDFlib(SELECT_, CDF_, id, rVAR_, varN, GET_, rVAR_NAME_, varName, rVAR_DATATYPE_, dataType, rVAR_NUMELEMS_, numElements, rVAR_RECVARY_, recVary, rVAR_DIMVARYS_, dimVarys, NULL_);
}

extern (D) auto CDFinquire(T0, T1, T2, T3, T4, T5, T6, T7)(auto ref T0 id, auto ref T1 numDims, auto ref T2 dimSizes, auto ref T3 encoding, auto ref T4 majority, auto ref T5 maxRec, auto ref T6 nVars, auto ref T7 nAttrs)
{
    return CDFlib(SELECT_, CDF_, id, GET_, rVARs_NUMDIMS_, numDims, rVARs_DIMSIZES_, dimSizes, CDF_ENCODING_, encoding, CDF_MAJORITY_, majority, rVARs_MAXREC_, maxRec, CDF_NUMrVARS_, nVars, CDF_NUMATTRS_, nAttrs, NULL_);
}

extern (D) auto CDFinquireCDF(T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)(auto ref T0 id, auto ref T1 numDims, auto ref T2 dimSizes, auto ref T3 encoding, auto ref T4 majority, auto ref T5 maxrRec, auto ref T6 nrVars, auto ref T7 maxzRec, auto ref T8 nzVars, auto ref T9 nAttrs)
{
    return CDFlib(SELECT_, CDF_, id, GET_, rVARs_NUMDIMS_, numDims, rVARs_DIMSIZES_, dimSizes, CDF_ENCODING_, encoding, CDF_MAJORITY_, majority, rVARs_MAXREC_, maxrRec, CDF_NUMrVARS_, nrVars, zVARs_MAXREC_, maxzRec, CDF_NUMzVARS_, nzVars, CDF_NUMATTRS_, nAttrs, NULL_);
}

extern (D) auto CDFgetChecksum(T0, T1)(auto ref T0 id, auto ref T1 checksum)
{
    return CDFlib(SELECT_, CDF_, id, GET_, CDF_CHECKSUM_, checksum, NULL_);
}

/*
 * OPEN_ *
 *       */

extern (D) auto CDFopen(T0, T1)(auto ref T0 CDFname, auto ref T1 id)
{
    return CDFlib(OPEN_, CDF_, CDFname, id, NULL_);
}

/*
 * PUT_ *
 *      */

extern (D) auto CDFsetAttrScope(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 attrScope)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, PUT_, ATTR_SCOPE_, attrScope, NULL_);
}

extern (D) auto CDFsetCompression(T0, T1, T2)(auto ref T0 id, auto ref T1 cType, auto ref T2 cParms)
{
    return CDFlib(SELECT_, CDF_, id, PUT_, CDF_COMPRESSION_, cType, cParms, NULL_);
}

extern (D) auto CDFsetEncoding(T0, T1)(auto ref T0 id, auto ref T1 encoding)
{
    return CDFlib(SELECT_, CDF_, id, PUT_, CDF_ENCODING_, encoding, NULL_);
}

extern (D) auto CDFsetFormat(T0, T1)(auto ref T0 id, auto ref T1 format)
{
    return CDFlib(SELECT_, CDF_, id, PUT_, CDF_FORMAT_, format, NULL_);
}

extern (D) auto CDFsetLeapSecondLastUpdated(T0, T1)(auto ref T0 id, auto ref T1 lastUpdated)
{
    return CDFlib(SELECT_, CDF_, id, PUT_, CDF_LEAPSECONDLASTUPDATED_, lastUpdated, NULL_);
}

extern (D) auto CDFsetMajority(T0, T1)(auto ref T0 id, auto ref T1 majority)
{
    return CDFlib(SELECT_, CDF_, id, PUT_, CDF_MAJORITY_, majority, NULL_);
}

extern (D) auto CDFrenameAttr(T0, T1, T2)(auto ref T0 id, auto ref T1 attrNum, auto ref T2 attrName)
{
    return CDFlib(SELECT_, CDF_, id, ATTR_, attrNum, PUT_, ATTR_NAME_, attrName, NULL_);
}

extern (D) auto CDFrenameVar(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 varName)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_NAME_ : rVAR_NAME_, varName, NULL_);
}

extern (D) auto CDFsetVarAllocRecords(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 allocRecs)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_ALLOCATERECS_ : rVAR_ALLOCATERECS_, allocRecs, NULL_);
}

extern (D) auto CDFsetVarAllocBlockRecords(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 firstRec, auto ref T4 lastRec)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_ALLOCATEBLOCK_ : rVAR_ALLOCATEBLOCK_, firstRec, lastRec, NULL_);
}

extern (D) auto CDFsetVarBlockingFactor(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 bf)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_BLOCKINGFACTOR_ : rVAR_BLOCKINGFACTOR_, bf, NULL_);
}

extern (D) auto CDFsetVarCompression(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 cType, auto ref T4 cParms)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_COMPRESSION_ : rVAR_COMPRESSION_, cType, cParms, NULL_);
}

extern (D) auto CDFsetVarDataSpec(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 dataType, auto ref T4 numElems)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_DATASPEC_ : rVAR_DATASPEC_, dataType, numElems, NULL_);
}

extern (D) auto CDFsetVarDimVariances(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 dimVarys)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_DIMVARYS_ : rVAR_DIMVARYS_, dimVarys, NULL_);
}

extern (D) auto CDFsetVarInitialRecs(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 numRecs)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_INITIALRECS_ : rVAR_INITIALRECS_, numRecs, NULL_);
}

extern (D) auto CDFsetVarPadValue(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 padValue)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_PADVALUE_ : rVAR_PADVALUE_, padValue, NULL_);
}

extern (D) auto CDFsetVarRecVariance(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 recVary)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_RECVARY_ : rVAR_RECVARY_, recVary, NULL_);
}

extern (D) auto CDFputVarSeqData(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 seqData)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_SEQDATA_ : rVAR_SEQDATA_, seqData, NULL_);
}

extern (D) auto CDFsetVarSparseRecords(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 sparseRecs)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, PUT_, zVar ? zVAR_SPARSERECORDS_ : rVAR_SPARSERECORDS_, sparseRecs, NULL_);
}

extern (D) auto CDFputVarData(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 recNum, auto ref T4 indices, auto ref T5 value)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, zVar ? zVAR_RECNUMBER_ : rVARs_RECNUMBER_, recNum, zVar ? zVAR_DIMINDICES_ : rVARs_DIMINDICES_, indices, PUT_, zVar ? zVAR_DATA_ : rVAR_DATA_, value, NULL_);
}

extern (D) auto CDFputVarsRecordDatabyNumbers(T0, T1, T2, T3, T4, T5)(auto ref T0 id, auto ref T1 zVar, auto ref T2 numVars, auto ref T3 varNums, auto ref T4 recNum, auto ref T5 buffer)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVARs_RECNUMBER_ : rVARs_RECNUMBER_, recNum, PUT_, zVar ? zVARs_RECDATA_ : rVARs_RECDATA_, numVars, varNums, buffer, NULL_);
}

extern (D) auto CDFhyperPutVarData(T0, T1, T2, T3, T4, T5, T6, T7, T8, T9)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varN, auto ref T3 recS, auto ref T4 recC, auto ref T5 recI, auto ref T6 indices, auto ref T7 counts, auto ref T8 intervals, auto ref T9 buff)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varN, zVar ? zVAR_RECNUMBER_ : rVARs_RECNUMBER_, recS, zVar ? zVAR_RECCOUNT_ : rVARs_RECCOUNT_, recC, zVar ? zVAR_RECINTERVAL_ : rVARs_RECINTERVAL_, recI, zVar ? zVAR_DIMINDICES_ : rVARs_DIMINDICES_, indices, zVar ? zVAR_DIMCOUNTS_ : rVARs_DIMCOUNTS_, counts, zVar ? zVAR_DIMINTERVALS_ : rVARs_DIMINTERVALS_, intervals, PUT_, zVar ? zVAR_HYPERDATA_ : rVAR_HYPERDATA_, buff, NULL_);
}

extern (D) auto CDFsetChecksum(T0, T1)(auto ref T0 id, auto ref T1 checksum)
{
    return CDFlib(SELECT_, CDF_, id, PUT_, CDF_CHECKSUM_, checksum, NULL_);
}

/*
 * SELECT_ *
 *         */

extern (D) auto CDFselect(T)(auto ref T id)
{
    return CDFlib(SELECT_, CDF_, id, NULL_);
}

extern (D) auto CDFsetDecoding(T0, T1)(auto ref T0 id, auto ref T1 decoding)
{
    return CDFlib(SELECT_, CDF_, id, CDF_DECODING_, decoding, NULL_);
}

extern (D) auto CDFsetCacheSize(T0, T1)(auto ref T0 id, auto ref T1 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, CDF_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFsetVarCacheSize(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, zVar ? zVAR_CACHESIZE_ : rVAR_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFsetVarsCacheSize(T0, T1, T2)(auto ref T0 id, auto ref T1 zVar, auto ref T2 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVARs_CACHESIZE_ : rVARs_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFsetVarSeqPos(T0, T1, T2, T3, T4)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 recNum, auto ref T4 indices)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, zVar ? zVAR_SEQPOS_ : rVAR_SEQPOS_, recNum, indices, NULL_);
}

extern (D) auto CDFsetNegtoPosfp0Mode(T0, T1)(auto ref T0 id, auto ref T1 negtoPosfp0)
{
    return CDFlib(SELECT_, CDF_, id, CDF_NEGtoPOSfp0_MODE_, negtoPosfp0, NULL_);
}

extern (D) auto CDFsetReadOnlyMode(T0, T1)(auto ref T0 id, auto ref T1 readOnlyMode)
{
    return CDFlib(SELECT_, CDF_, id, CDF_READONLY_MODE_, readOnlyMode, NULL_);
}

extern (D) auto CDFsetVarReservePercent(T0, T1, T2, T3)(auto ref T0 id, auto ref T1 zVar, auto ref T2 varNum, auto ref T3 percent)
{
    return CDFlib(SELECT_, CDF_, id, zVar ? zVAR_ : rVAR_, varNum, zVar ? zVAR_RESERVEPERCENT_ : rVAR_RESERVEPERCENT_, percent, NULL_);
}

extern (D) auto CDFsetCompressionCacheSize(T0, T1)(auto ref T0 id, auto ref T1 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, COMPRESS_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFsetStageCacheSize(T0, T1)(auto ref T0 id, auto ref T1 numBuffers)
{
    return CDFlib(SELECT_, CDF_, id, STAGE_CACHESIZE_, numBuffers, NULL_);
}

extern (D) auto CDFsetzMode(T0, T1)(auto ref T0 id, auto ref T1 zMode)
{
    return CDFlib(SELECT_, CDF_, id, CDF_zMODE_, zMode, NULL_);
}

/******************************************************************************
* TT2000 macros define'd
******************************************************************************/
alias CDF_TT2000_from_UTC_string = parseTT2000;   // dstep output changed
alias CDF_TT2000_to_UTC_string = encodeTT2000;    // dstep output changed
alias CDF_TT2000_from_UTC_parts = computeTT2000;  // dstep output changed
alias CDF_TT2000_to_UTC_parts = breakdownTT2000;  // dstep output changed

alias TT2000breakdown = breakdownTT2000;  // dstep output changed

CDFstatus CDFlib (c_long op1, ...);

//CDFstatus CDFcreateCDF (char* name, CDFid* id);
CDFstatus CDFcreateCDF (const char* name, CDFid* id);  // dstep output changed, upstream notified

CDFstatus CDFattrInquire (CDFid id, c_long attrNum, char* attrName, c_long* attrScope, c_long* maxgrEntry);
CDFstatus CDFinquireAttr (CDFid id, c_long attrNum, char* attrName, c_long* attrScope, c_long* maxgEntry, c_long* maxrEntry, c_long* maxzEntry);
CDFstatus CDFinquireAttrEntry (CDFid id, int grzEntry, c_long attrNum, c_long entryNum, c_long* dataType, c_long* numElems);
CDFstatus CDFinquireAttrInfo (CDFid id, int zEntry, c_long attrNum, char* attrName, c_long* attrScope, c_long* maxEntry);
CDFstatus CDFputAttrEntry (CDFid id, int grzEntry, c_long attrNum, c_long entryNum, c_long dataType, c_long numElems, void* value);
CDFstatus CDFgetAttrEntry (CDFid id, int grzEntry, c_long attrNum, c_long entryNum, void* value);
CDFstatus CDFgetAttrEntryNumStrings (CDFid id, int rzEntry, c_long attrNum, c_long entryNum, c_long* numStrings);
CDFstatus CDFgetAttrEntryStrings (CDFid id, int rzEntry, c_long attrNum, c_long entryNum, c_long* numStrings, char*** strings);
CDFstatus CDFputAttrEntryStrings (CDFid id, int rzEntry, c_long attrNum, c_long entryNum, c_long numStrings, char** strings);
void CDFdataFree (CDFdata value);
CDFstatus CDFreadgAttrEntry (CDFid id, c_long attrNum, c_long entryNum, c_long* dataType, c_long* numElms, CDFdata* value);
CDFstatus CDFreadzAttrEntry (CDFid id, c_long attrNum, c_long entryNum, c_long* dataType, c_long* numElms, CDFdata* value);
CDFstatus CDFdeleteAttrEntry (CDFid id, int grzEntry, c_long attrNum, c_long entryNum);
CDFstatus CDFsetAttrEntryDataSpec (CDFid id, int grzEntry, c_long attrNum, c_long entryNum, c_long dataType, c_long numElems);
c_long CDFgetAttrNum (CDFid id, char* attrName);
c_long CDFgetVarNum (CDFid id, char* varName);
CDFstatus CDFgetNumAttrEntries (CDFid id, int grzEntry, c_long attrNum, c_long* numEntries);
CDFstatus CDFgetAttrMaxEntry (CDFid id, int grzEntry, c_long attrNum, c_long* maxEntry);
CDFstatus CDFgetAttrEntryDataType (CDFid id, int grzEntry, c_long attrNum, c_long entryNum, c_long* dataType);
CDFstatus CDFgetAttrEntryNumElements (CDFid id, int grzEntry, c_long attrNum, c_long entryNum, c_long* numElements);
CDFstatus CDFgetVarRecordData (CDFid id, int zVar, c_long varNum, c_long recNum, void* buffer);
CDFstatus CDFputVarRecordData (CDFid id, int zVar, c_long varNum, c_long recNum, void* buffer);
CDFstatus CDFgetVarsRecordDatabyNames (CDFid id, int zVar, c_long numVars, char** varNames, c_long recNum, void** buffer);
CDFstatus CDFputVarsRecordDatabyNames (CDFid id, int zVar, c_long numVars, char** varNames, c_long recNum, void** buffer);
CDFstatus CDFgetVarAllRecordsByVarID (CDFid id, int zVar, c_long varNum, void* buffer);
CDFstatus CDFgetzVarSpec (CDFid id, c_long varNum, c_long* dataType, c_long* numElems, c_long* numDims, c_long* dimSizes, c_long* recVary, c_long* dimsVary);
CDFstatus CDFreadzVarPadValue (CDFid id, c_long varNum, c_long* dataType, c_long* numElms, CDFdata* buffer);
CDFstatus CDFreadzVarAllByVarID (CDFid id, c_long varNum, c_long* numRecs, c_long* dataType, c_long* numElems, c_long* numDims, c_long* dimSizes, c_long* recVary, c_long* dimsVary, CDFdata* buffer);
CDFstatus CDFreadzVarDataByVarID (CDFid id, c_long varNum, c_long* numRecs, CDFdata* buffer);
CDFstatus CDFreadzVarRangeDataByVarID (CDFid id, c_long varNum, c_long strNum, c_long stpNum, CDFdata* buffer);
CDFstatus CDFputVarAllRecordsByVarID (CDFid id, int zVar, c_long varNum, c_long numRec, void* buffer);
CDFstatus CDFgetVarRangeRecordsByVarID (CDFid id, int zVar, c_long varNum, c_long startRec, c_long stopRec, void* buffer);
CDFstatus CDFputVarRangeRecordsByVarID (CDFid id, int zVar, c_long varNum, c_long startRec, c_long stopRec, void* buffer);
CDFstatus CDFgetVarAllRecordsByVarName (CDFid id, char* varName, void* buffer);
CDFstatus CDFreadzVarAllByVarName (CDFid id, char* varName, c_long* numRecs, c_long* dataType, c_long* numElems, c_long* numDims, c_long* dimSizes, c_long* recVary, c_long* dimsVary, CDFdata* buffer);
CDFstatus CDFreadzVarDataByVarName (CDFid id, char* varName, c_long* numRecs, CDFdata* buffer);
CDFstatus CDFreadzVarRangeDataByVarName (CDFid id, char* varName, c_long strNum, c_long stpNum, CDFdata* buffer);
CDFstatus CDFputVarAllRecordsByVarName (CDFid id, char* varName, c_long numRecs, void* buffer);
CDFstatus CDFgetVarRangeRecordsByVarName (CDFid id, char* varName, c_long startRec, c_long stopRec, void* buffer);
CDFstatus CDFputVarRangeRecordsByVarName (CDFid id, char* varName, c_long startRec, c_long stopRec, void* buffer);
CDFstatus CDFinsertVarRecordsByVarID (CDFid id, int zVar, c_long varNum, c_long startRec, c_long numRecs, void* buffer);
CDFstatus CDFinsertVarRecordsByVarName (CDFid id, char* varName, c_long startRec, c_long numRecs, void* buffer);
CDFstatus CDFdeleteRecordsForAll (CDFid id, c_long startRec, c_long endRec);
void CDFsetFileBackward (int flag);
void CDFsetFileBackwardFlag (int flag);
int CDFgetFileBackward ();
int CDFgetFileBackwardFlag ();
void CDFsetChecksumMode (c_long flag);
c_long CDFgetChecksumMode ();
int CDFgetFileBackwardEnvVar ();
void CDFsetValidate (c_long mode);
int CDFgetValidate ();
int CDFgetValidateDebug ();
void ROWtoCOL (void* iBuffer, void* oBuffer, c_long numDims, c_long* dimSizes, c_long nValueBytes);
int CDFelemSize (c_long);
void COLtoROW (void* iBuffer, void* oBuffer, c_long numDims, c_long* dimSizes, c_long nValueBytes);
int CDFstrcmpIgCase (char* string1, char* string2);
char* CDFstrstrIgCase (char* string1, char* string2);
void StringBreakIntoStrings (char* string, c_long numElms, c_long numStrs, char*** strings);

void EPOCHbreakdown (double epoch, c_long* year, c_long* month, c_long* day, c_long* hour, c_long* minute, c_long* second, c_long* msec);
double computeEPOCH (c_long year, c_long month, c_long day, c_long hour, c_long minute, c_long second, c_long msec);
double toParseEPOCH (char* inString);
double parseEPOCH (char* inString);
double parseEPOCH1 (char* inString);
double parseEPOCH2 (char* inString);
double parseEPOCH3 (char* inString);
double parseEPOCH4 (char* inString);
void toEncodeEPOCH (double epoch, int style, char* epString);
void encodeEPOCH (double epoch, ref char[25] epString);
void encodeEPOCH1 (double epoch, ref char[17] epString);
void encodeEPOCH2 (double epoch, ref char[15] epString);
void encodeEPOCH3 (double epoch, ref char[25] epString);
void encodeEPOCH4 (double epoch, ref char[24] epString);

// dstep output changed
void encodeEPOCHx (double epoch, char[EPOCHx_FORMAT_MAX] format, char[EPOCHx_STRING_MAX] encoded);

void EPOCHtoUnixTime (double* epoch, double* unitTime, int numTimes);
void UnixTimetoEPOCH (double* unitTime, double* epoch, int numTimes);
void EPOCH16breakdown (double* epoch, c_long* year, c_long* month, c_long* day, c_long* hour, c_long* minute, c_long* second, c_long* msec, c_long* usec, c_long* nsec, c_long* psec);
double computeEPOCH16 (c_long year, c_long month, c_long day, c_long hour, c_long minute, c_long second, c_long msec, c_long usec, c_long nsec, c_long psec, double* epoch);
double toParseEPOCH16 (char* inString, double* epoch);
double parseEPOCH16 (char* inString, double* epoch);
double parseEPOCH16_1 (char* inStringch, double* epoch);
double parseEPOCH16_2 (char* inStringch, double* epoch);
double parseEPOCH16_3 (char* inStringch, double* epoch);
double parseEPOCH16_4 (char* inStringch, double* epoch);
void toEncodeEPOCH16 (double* epoch, int style, char* epString);
void encodeEPOCH16 (double* epoch, ref char[37] epString);
void encodeEPOCH16_1 (double* epoch, ref char[25] epString);
void encodeEPOCH16_2 (double* epoch, ref char[15] epString);
void encodeEPOCH16_3 (double* epoch, ref char[37] epString);
void encodeEPOCH16_4 (double* epoch, ref char[33] epString);

// dstep output changed
void encodeEPOCH16_x (double* epoch, char[EPOCHx_FORMAT_MAX] format, char[EPOCHx_STRING_MAX] encoded);

void EPOCH16toUnixTime (double* epoch, double* unixTime, int numTimes);
void UnixTimetoEPOCH16 (double* unixTime, double* epoch, int numTimes);
/******************************************************************************
* A new set of functions to handle CDF_TIME_TT2000 time type.
******************************************************************************/
void breakdownTT2000 (long tt2000, double* year, double* month, double* day, ...);
long computeTT2000 (double year, double month, double day, ...);
double CDF_TT2000_to_UTC_EPOCH (long time);
long CDF_TT2000_from_UTC_EPOCH (double epoch);
double CDF_TT2000_to_UTC_EPOCH16 (long time, double* epoch16);
long CDF_TT2000_from_UTC_EPOCH16 (double* epoch16);
void toEncodeTT2000 (long time, int style, char* string);
void encodeTT2000 (long time, char* string, ...);
long toParseTT2000 (char* string);
long parseTT2000 (char* string);
long computeTT2000withBasedLeapDay (c_long yy, c_long mm, c_long dd, c_long hh, c_long mn, c_long ss, c_long ms, c_long us, c_long ns, int yymmdd);
void breakdownTT2000withBasedLeapDay (long tt2000, int yymmdd, c_long* yy, c_long* mm, c_long* dd, c_long* hh, c_long* mn, c_long* ss, c_long* ms, c_long* us, c_long* ns);
long parseTT2000withBasedLeapDay (char* tt2000, int yymmdd);
void encodeTT2000withBasedLeapDay (long tt2000, int yymmdd, char* string);
void TT2000toUnixTime (long* epoch, double* unixTime, int numTimes);
void UnixTimetoTT2000 (double* unixTime, long* epoch, int numTimes);
void CDFClearLeapSecondsTable ();
void CDFfillLeapSecondsTable (double** table);
int CDFgetRowsinLeapSecondsTable ();

void CDFgetLastDateinLeapSecondsTable (c_long* year, c_long* month, c_long* day);

char* CDFgetLeapSecondsTableEnvVar ();
int CDFgetLeapSecondsTableStatus ();

void CDF_Free_String (c_long numStrings, char** strings);
c_long FindNumberOfItems (char* string_, c_long numElems, char* delimiter);

/******************************************************************************
* Synonyms for compatibility with older releases.
******************************************************************************/

enum CDF_DOCUMENT_LEN = CDF_COPYRIGHT_LEN;
enum CDF_ERRTEXT_LEN = CDF_STATUSTEXT_LEN;
enum CDF_NUMDIMS_ = rVARs_NUMDIMS_;
enum CDF_DIMSIZES_ = rVARs_DIMSIZES_;
enum CDF_MAXREC_ = rVARs_MAXREC_;
enum CDF_RECNUMBER_ = rVARs_RECNUMBER_;
enum CDF_RECCOUNT_ = rVARs_RECCOUNT_;
enum CDF_RECINTERVAL_ = rVARs_RECINTERVAL_;
enum CDF_DIMINDICES_ = rVARs_DIMINDICES_;
enum CDF_DIMCOUNTS_ = rVARs_DIMCOUNTS_;
enum CDF_DIMINTERVALS_ = rVARs_DIMINTERVALS_;
enum CDF_NUMVARS_ = CDF_NUMrVARS_;
enum VAR_ = rVAR_;
enum VAR_NAME_ = rVAR_NAME_;
enum VAR_DATATYPE_ = rVAR_DATATYPE_;
enum VAR_NUMELEMS_ = rVAR_NUMELEMS_;
enum VAR_RECVARY_ = rVAR_RECVARY_;
enum VAR_DIMVARYS_ = rVAR_DIMVARYS_;
enum VAR_NUMBER_ = rVAR_NUMBER_;
enum VAR_DATA_ = rVAR_DATA_;
enum VAR_HYPERDATA_ = rVAR_HYPERDATA_;
enum VAR_SEQDATA_ = rVAR_SEQDATA_;
enum VAR_SEQPOS_ = rVAR_SEQPOS_;
enum VAR_MAXREC_ = rVAR_MAXREC_;
enum VAR_DATASPEC_ = rVAR_DATASPEC_;
enum VAR_FILLVALUE_ = rVAR_PADVALUE_;
enum VAR_INITIALRECS_ = rVAR_INITIALRECS_;
enum VAR_EXTENDRECS_ = rVAR_BLOCKINGFACTOR_;
enum ATTR_MAXENTRY_ = ATTR_MAXrENTRY_;
enum ATTR_NUMENTRIES_ = ATTR_NUMrENTRIES_;
enum ENTRY_ = rENTRY_;
enum ENTRY_DATATYPE_ = rENTRY_DATATYPE_;
enum ENTRY_NUMELEMS_ = rENTRY_NUMELEMS_;
enum ENTRY_DATA_ = rENTRY_DATA_;
enum MIPSEL_ENCODING = DECSTATION_ENCODING;
enum MIPSEB_ENCODING = SGi_ENCODING;
enum rVAR_EXISTANCE_ = rVAR_EXISTENCE_;
enum zVAR_EXISTANCE_ = zVAR_EXISTENCE_;
enum ATTR_EXISTANCE_ = ATTR_EXISTENCE_;
enum gENTRY_EXISTANCE_ = gENTRY_EXISTENCE_;
enum rENTRY_EXISTANCE_ = rENTRY_EXISTENCE_;
enum zENTRY_EXISTANCE_ = zENTRY_EXISTENCE_;
enum GLOBAL_SCOPE_ASSUMED = GLOBAL_SCOPE;
enum VARIABLE_SCOPE_ASSUMED = VARIABLE_SCOPE;
enum BAD_EXTEND_RECS = BAD_BLOCKING_FACTOR;
enum rVAR_EXTENDRECS_ = rVAR_BLOCKINGFACTOR_;
enum zVAR_EXTENDRECS_ = zVAR_BLOCKINGFACTOR_;
enum COL_MAJOR = COLUMN_MAJOR;
enum NONE_CHECKSUM = NO_CHECKSUM;

alias StrlaststrIgCase = StrLaststrIgCase;  // dstep output changed
alias Strlaststr = StrLaststr;              // dstep output changed

/*****************************************************************************/

