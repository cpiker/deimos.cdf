/******************************************************************************
*
*  NSSDC/CDF           Create an example CDF using the New Standard Interface
*                      that was introduced in CDF 3.1.  
*
*  History:
*
*   V1.0  10-Jan-2006, D. Han              Original version
*   V1.1  2021-03-23, C. Piker             D adaptation
*
******************************************************************************/

import std.stdio;

import cdf;


// MAIN 
int main () {

	CDFid id;            /* CDF identifier. */
	CDFstatus status;    /* CDF completion status. */

	string[] title = ["CDF title", "Author: CDF"];
	short[181] lat;
	int   time, i; 
	int*  image;
	long  TimeVarNum, LatVarNum, ImageVarNum, attrNum, recNum, titleAttrNum;

	long[2] dimIndices, dimCounts, dimInterval, dimSizes, dimVarys;

	long cType;                     /* Compression type */
	long[CDF_MAX_PARMS] cParms;     /* Compression parameters */

	assert(short.sizeof == CDF_INT2);	/* Test if short matches with CDF_INT2 */
	assert(int.sizeof == CDF_INT4);	/* Test if int matches with CDF_INT4 */

	//Create the CDF.
	status = CDFcreateCDF ("example1".ptr, &id);
	if (status != CDF_OK) StatusHandler (status);

	//Create zVariables.
	status = CDFcreatezVar (id, 
		"Time".ptr,    /* Variable name - case sensitive */
		CDF_INT4,  /* Data type */
		1L,        /* Number of elements */
		0L,        /* Dimentionality     */
		null,      /* Dummy dimension sizes since dim = 0 */
		VARY,      /* Record variance */
		null,      /* Dimension variance */
		&TimeVarNum
	);
	if (status != CDF_OK) StatusHandler (status);

	dimSizes[0] = 181;
	dimVarys[0] = VARY;
	dimVarys[1] = VARY;
	status = CDFcreatezVar (id, "Latitude".ptr, CDF_INT2, 1L, 1L, dimSizes.ptr,
	                         VARY, dimVarys.ptr, &LatVarNum);
	if (status != CDF_OK) StatusHandler (status);

	dimSizes[0] = 10;
	dimSizes[1] = 20;
	dimVarys[0] = VARY;
	dimVarys[1] = VARY;
	status = CDFcreatezVar (id, "Image".ptr, CDF_INT4, 1L, 2L, dimSizes.ptr,
   	                      VARY, dimVarys.ptr, &ImageVarNum);
	if (status != CDF_OK) StatusHandler (status);

	// Define compression for the 'Image' variable. 
	cType = GZIP_COMPRESSION;
	cParms[0] = 5;              /* GZIP compression level */
	status = CDFsetzVarCompression (id, ImageVarNum, cType, cParms);
	if (status != CDF_OK) StatusHandler (status);

	// Create global and variable attributes.

	status = CDFcreateAttr (id, "TITLE".ptr, GLOBAL_SCOPE, &titleAttrNum);
	if (status != CDF_OK) StatusHandler (status);

	status = CDFcreateAttr (id, "FIELDNAM".ptr, VARIABLE_SCOPE, &attrNum);
	if (status != CDF_OK) StatusHandler (status);

	status = CDFcreateAttr (id, "UNITS".ptr, VARIABLE_SCOPE, &attrNum);
	if (status != CDF_OK) StatusHandler (status);

	// Write TITLE gAttribute gEntry.
	status = CDFputAttrgEntry (id, titleAttrNum, 
	                           0L,        /* Attribute entry number */
	                           CDF_CHAR, strlen(title[0]), title[0]); 
	if (status != CDF_OK) StatusHandler (status);

	status = CDFputAttrgEntry (id, titleAttrNum, 
                           1L,        /* Attribute entry number */
                           CDF_CHAR, strlen(title[1]), title[1]); 
	if (status != CDF_OK) StatusHandler (status);

	//Write vAttribute zEntries for 'Time' zVariable.

	status = CDFputAttrzEntry (id, CDFgetAttrNum(id,"FIELDNAM".ptr), 
                           CDFvarNum(id,"Time".ptr), CDF_CHAR, 19L,
                           "Time of observation".ptr);
	if (status != CDF_OK) StatusHandler (status);

	status = CDFputAttrzEntry (id, CDFgetAttrNum(id,"UNITS".ptr), 
                           CDFvarNum(id,"Time".ptr), CDF_CHAR, 11L,
                           "Hour/Minute".ptr);

	// Write data for 'Time' zVariable.
	recNum = 0L;
	time = 23;
	status = CDFputzVarRecordData (id, TimeVarNum, recNum, &time);
	if (status != CDF_OK) StatusHandler (status);
	recNum = 1L;
	time = 24;
	status = CDFputzVarRecordData (id, TimeVarNum, recNum, &time);
	if (status != CDF_OK) StatusHandler (status);
	
	
	// Write data for 'Latitude' zVariable.
	dimIndices[0] = 0;
	dimCounts[0] = 181;
	dimInterval[0] = 1;
	for (i=-90; i <= 90; i++)
	   lat[i+90] = i;

	status = CDFhyperPutzVarData (id, LatVarNum,
		0L,           /* record start */
		1L,           /* # of records to write */
		1L,           /* record interval */
		dimIndices,   /* dimension dimIndices */
		dimCounts,    /* dimension counts */
		dimInterval,  /* dimension interval */
		lat
	);
                              
	if (status != CDF_OK) StatusHandler (status);


	// Write data for 'Image' zVariable.
	dimIndices[0] = 0;
	dimIndices[1] = 0;
	dimCounts[0] = 10; 
	dimCounts[1] = 20;
	dimInterval[0] = 1;
	dimInterval[1] = 1;

	image = cast(int *) malloc( int.sizeof * 600 );
	for (i=0; i < 600; i++)     /* Load 3 records of data */
	   *(image+i) = i;

	status = CDFhyperPutzVarData(id, ImageVarNum,
		0L,           /* record start */
		3L,           /* # of records to write */
		1L,           /* record interval */
		dimIndices,   /* dimension dimIndices */
		dimCounts,    /* dimension counts */
		dimInterval,  /* dimension interval */
		image
	);

	if (status != CDF_OK) StatusHandler (status);


	// Close CDF 
	status = CDFcloseCDF (id);	
	if (status != CDF_OK)  StatusHandler (status);
	
	return 0;
}

// Status handler ////////////////////////////////////////////////////////////

void StatusHandler (CDFstatus status)
{
	char[CDF_ERRTEXT_LEN+1] message;

	if (status < CDF_WARN) {
		writeln ("An error has occurred, halting...");
		CDFgetStatusText (status, message);
		printf ("%s\n", message);
		exit(1);
	}
	else{
		if (status < CDF_OK) {
			writeln ("Warning, function may not have completed as expected...");
			CDFgetStatusText (status, message);
			writeln (message);
		}
  		else{
			if (status > CDF_OK) {
				writeln ("Function completed successfully, but be advised that...");
				CDFgetStatusText (status, message);
				writeln (message);
			}
		}
	}
}
