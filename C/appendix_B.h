/* Manually reformated function signatures from Appendix B of the CDF C
   Reference Manual, version 3.8.  These were used to generate type-safe
	functions with const specifiers.
*/

CDFstatus CDFattrCreate (
	CDFid id, /* in */
	const char *attrName, /* in */
	long attrScope, /* in */
	long *attrNum /* out */
)
CDFstatus CDFattrEntryInquire (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType, /* out */
	long *numElements /* out */
)
CDFstatus CDFattrGet (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	void *value /* out */
)
CDFstatus CDFattrInquire (
	CDFid id, /* in */
	long attrNum, /* in */
	char *attrName, /* out */
	long *attrScope, /* out */
	long *maxEntry /* out */
)
long CDFattrNum (id, attrName)
	CDFid id, /* in */
	const char *attrName /* in */
)
CDFstatus CDFattrPut (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long dataType, /* in */
	long numElements, /* in */
	const void *value /* in */
)
CDFstatus CDFattrRename (
	CDFid id, /* in */
	long attrNum, /* in */
	const char *attrName /* in */
)
CDFstatus CDFclose (
	CDFid id /* in */
)
CDFstatus CDFcreate (
	const char *CDFname, /* in */
	long numDims, /* in */
	long dimSizes[], /* in */
	long encoding, /* in */
	long majority, /* in */
	CDFid *id /* out */
)
CDFstatus CDFdelete (
	CDFid id /* in */
)
CDFstatus CDFdoc (
	CDFid id, /* in */
	long *version, /* out */
	long *release, /* out */
	char text[CDF_DOCUMENT_LEN+1] /* out */
)
CDFstatus CDFerror (
	CDFstatus status, /* in */
	char message[CDF_STATUSTEXT_LEN+1] /* out */
)
CDFstatus CDFgetrVarsRecordData (
	CDFid id, /* in */
	long numVars, /* in */
	const char *varNames[], /* in */
	long varRecNum, /* in */
	void *buffer[] /* out */
)
CDFstatus CDFgetzVarsRecordData (
	CDFid id, /* in */
	long numVars, /* in */
	char *varNames[], /* in */
	long varRecNum, /* in */
	void *buffer[] /* out */
)
CDFstatus CDFinquire (
	CDFid id, /* in */
	long *numDims, /* out */
	long dimSizes[CDF_MAX_DIMS], /* out */
	long *encoding, /* out */
	long *majority, /* out */
	long *maxRec, /* out */
	long *numVars, /* out */
	long *numAttrs /* out */
)
CDFstatus CDFopen (
	const char *CDFname, /* in */
	CDFid *id /* out */
)
CDFstatus CDFputrVarsRecordData (
	CDFid id, /* in */
	long numVars, /* in */
	const char *varNames[], /* in */
	long varRecNum, /* in */
	const void *buffer /* in */
)
CDFstatus CDFputzVarsRecordData (
	CDFid id, /* in */
	long numVars, /* in */
	const char *varNames[], /* in */
	long varRecNum, /* in */
	const void *buffer[] /* in */
)
CDFstatus CDFvarClose (
	CDFid id, /* in */
	long varNum /* in */
)
CDFstatus CDFvarCreate (
	CDFid id, /* in */
	const char *varName, /* in */
	long dataType, /* in */
	long numElements, /* in */
	long recVariance, /* in */
	long dimVariances[], /* in */
	long *varNum /* out */
)
CDFstatus CDFvarGet (
	CDFid id, /* in */
	long varNum, /* in */
	long recNum, /* in */
	long indices[], /* in */
	void *value /* out */
)
CDFstatus CDFvarHyperGet (
	CDFid id, /* in */
	long varNum, /* in */
	long recStart, /* in */
	long recCount, /* in */
	long recInterval, /* in */
	long indices[], /* in */
	long counts[], /* in */
	long intervals[], /* in */
	void *buffer /* out */
)
CDFstatus CDFvarHyperPut (
	CDFid id, /* in */
	long varNum, /* in */
	long recStart, /* in */
	long recCount, /* in */
	long recInterval, /* in */
	long indices[], /* in */
	long counts[], /* in */
	long intervals[], /* in */
	const void *buffer /* in */
)
CDFstatus CDFvarInquire (
	CDFid id, /* in */
	long varNum, /* in */
	char *varName, /* out */
	long *dataType, /* out */
	long *numElements, /* out */
	long *recVariance, /* out */
	long dimVariances[CDF_MAX_DIMS] /* out */
)
long CDFvarNum (id, varName)
	CDFid id, /* in */
	const char *varName /* in */
)
CDFstatus CDFvarPut (
	CDFid id, /* in */
	long varNum, /* in */
	long recNum, /* in */
	long indices[], /* in */
	const void *value /* in */
)
CDFstatus CDFvarRename (
	CDFid id, /* in */
	long varNum, /* in */
	const char *varName /* in */
)

CDFstatus CDFcloseCDF (
	CDFid id /* in */
)
CDFstatus CDFclosezVar (
	CDFid id, /* in */
	long varNum /* in */
)
CDFstatus CDFconfirmAttrExistence (
	CDFid id, /* in */
	char *attrName /* in */
)
CDFstatus CDFconfirmgEntryExistence (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum /* in */
)
CDFstatus CDFconfirmrEntryExistence (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum /* in */
)
CDFstatus CDFconfirmzEntryExistence (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum /* in */
)
CDFstatus CDFconfirmzVarExistence (
	CDFid id, /* in */
	long varNum /* in */
)
CDFstatus CDFconfirmzVarPadValueExistence (
	CDFid id, /* in */
	long varNum /* in */
)
CDFstatus CDFcreateAttr (
	CDFid id, /* in */
	const char *attrName, /* in */
	long attrScope, /* in */
	long *attrNum /* out */
)
CDFstatus CDFcreateCDF (
	char *CDFname, /* in */
	CDFid *id /* out */
)
CDFstatus CDFcreatezVar (
	CDFid id, /* in */
	char *varName, /* in */
	long dataType, /* in */
	long numElements, /* in */
	long numDims, /* in */
	const long* dimSizes, /* in */
	long recVary, /* in */
	const long* dimVarys, /* in */
	long *varNum /* out */
)
CDFstatus CDFdeleteCDF (
	CDFid id /* in */
)
CDFstatus CDFdeleteAttr (
	CDFid id, /* in */
	long attrNum /* in */
)
CDFstatus CDFdeleteAttrgEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum /* in */
)
CDFstatus CDFdeleteAttrrEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum /* in */
)
CDFstatus CDFdeleteAttrzEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum /* in */
)
CDFstatus CDFdeletezVar (
	CDFid id, /* in */
	long varNum /* in */
)
CDFstatus CDFdeletezVarRecords (
	CDFid id, /* in */
	long varNum, /* in */
	long startRec, /* in */
	long endRec /* in */
)
CDFstatus CDFdeletezVarRecordsRenumber (
	CDFid id, /* in */
	long varNum, /* in */
	long startRec, /* in */
	long endRec /* in */
)
CDFstatus CDFgetAttrgEntryDataType (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType /* out */
)
CDFstatus CDFgetAttrgEntryNumElements (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *numElems /* out */
)

CDFstatus CDFgetAttrgEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	void *value /* out */
)
CDFstatus CDFgetAttrrEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	void *value /* out */
)
CDFstatus CDFgetAttrMaxgEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long *entryNum /* out */
)
CDFstatus CDFgetAttrMaxrEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long *entryNum /* out */
)
CDFstatus CDFgetAttrMaxzEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long *entryNum /* out */
)
CDFstatus CDFgetAttrName (
	CDFid id, /* in */
	long attrNum, /* in */
	char *attrName /* out */
)
long CDFgetAttrNum (
	CDFid id, /* in */
	const char *attrName /* in */
)
CDFstatus CDFgetAttrrEntryDataType (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType /* out */
)
CDFstatus CDFgetAttrrEntryNumElements (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *numElems /* out */
)
CDFstatus CDFgetAttrScope (
	CDFid id, /* in */
	long attrNum, /* in */
	long *attrScope /* out */
)
CDFstatus CDFgetAttrzEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	void *value /* out */
)
CDFstatus CDFgetAttrzEntryDataType (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType /* out */
)
CDFstatus CDFgetAttrzEntryNumElements (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *numElems /* out */
)
CDFstatus CDFgetCacheSize (
	CDFid id, /* in */
	long *numBuffers /* out */
)
CDFstatus CDFgetChecksum (
	CDFid id, /* in */
	long *checksum /* out */
)
CDFstatus CDFgetCompression (
	CDFid id, /* in */
	long *compressionType, /* out */
	long *compressionParms, /* out */
	long *compressionPercent /* out */
)
CDFstatus CDFgetCompressionCacheSize (
	CDFid id, /* in */
	long *numBuffers /* out */
)
CDFstatus CDFgetCompressionInfo (
	const char *cdfName, /* in */
	long *compressionType, /* out */
	long *compressionParms, /* out */
	OFF_T *compressionSize, /* out */
	OFF_T *uncompressionSize /* out */
)
CDFstatus CDFgetCopyright (
	CDFid id, /* in */
	char *Copyright /* out */
)
CDFstatus CDFgetDataTypeSize (
	long dataType, /* in */
	long *numBytes /* out */
)
CDFstatus CDFgetDecoding (
	CDFid id, /* in */
	long *decoding /* out */
)
CDFstatus CDFgetEncoding (
	CDFid id, /* in */
	long *encoding /* out */
)
int CDFgetFileBackward (
)
CDFstatus CDFgetFormat (
	CDFid id, /* in */
	long *format /* out */
)
CDFstatus CDFgetLibraryCopyright (
	char *Copyright /* out */
)
CDFstatus CDFgetLibraryVersion (
	long *version, /* out */
	long *release, /* out */
	long *increment, /* out */
	char *subIncrement /* out */
)
CDFstatus CDFgetLeapSecondLastUpdated (
	CDFid id, /* in */
	long *lastUpdated /* out */
)
CDFstatus CDFgetMajority (
	CDFid id, /* in */
	long *majority /* out */
)
CDFstatus CDFgetMaxWrittenRecNums (
	CDFid id, /* in */
	long *maxRecrVars, /* out */
	long *maxReczVars /* out */
)
CDFstatus CDFgetName (
	CDFid id, /* in */
	char *name /* out */
)
CDFstatus CDFgetNegtoPosfp0Mode (
	CDFid id, /* in */
	long *negtoPosfp0 /* out */
)
CDFstatus CDFgetNumAttrgEntries (
	CDFid id, /* in */
	long atrNum, /* in */
	long *entries /* out */
)
CDFstatus CDFgetNumAttributes (
	CDFid id, /* in */
	long *numAttrs /* out */
)
CDFstatus CDFgetNumAttrrEntries (
	CDFid id, /* in */
	long atrNum, /* in */
	long *entries /* out */
)
CDFstatus CDFgetNumAttrzEntries (
	CDFid id, /* in */
	long atrNum, /* in */
	long *entries /* out */
)
CDFstatus CDFgetNumgAttributes (
	CDFid id, /* in */
	long *numAttrs /* out */
)
CDFstatus CDFgetNumvAttributes (
	CDFid id, /* in */
	long *numAttrs /* out */
)
CDFstatus CDFgetNumrVars (
	CDFid id, /* in */
	long *numrVars /* out */
)
CDFstatus CDFgetNumzVars (
	CDFid id, /* in */
	long *numzVars /* out */
)
CDFstatus CDFgetReadOnlyMode (
	CDFid id, /* in */
	long *mode /* out */
)
CDFstatus CDFgetStageCacheSize (
	CDFid id, /* in */
	long *numBuffers /* out */
)
CDFstatus CDFgetStatusText (
CDFstatus status, /* in */
	char *text /* out */
)
CDFstatus CDFgetVarAllRecordsByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	void *buffer /* out */
)
long CDFgetVarNum (
	CDFid id, /* in */
	const char *varName /* in */
)
int CDFgetValidate ()

CDFstatus CDFgetVarAllRecordsByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	void *buffer /* out */
)
CDFstatus CDFgetVarRangeRecordsByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	long startRec, /* in */
	long stopRec, /* in */
	void *buffer /* out */
)
CDFstatus CDFgetVersion (
	CDFid id, /* in */
	long *version, /* out */
	long *release, /* out */
	long *increment /* out */
)
CDFstatus CDFgetzMode (
	CDFid id, /* in */
	long *zMode /* out */
)
CDFstatus CDFgetzVarAllocRecords (
	CDFid id, /* in */
	long varNum, /* in */
	long *allocRecs /* out */
)
CDFstatus CDFgetzVarAllRecordsByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	void *buffer /* out */
)
CDFstatus CDFgetzVarBlockingFactor (
	CDFid id, /* in */
	long varNum, /* in */
	long *bf /* out */
)
CDFstatus CDFgetzVarCacheSize (
	CDFid id, /* in */
	long varNum, /* in */
	long *numBuffers /* out */
)
CDFstatus CDFgetzVarCompression (
	CDFid id, /* in */
	long varNum, /* in */
	long *cType, /* out */
	long *cParms, /* out */
	long *cPercent /* out */
)
CDFstatus CDFgetzVarData (
	CDFid id, /* in */
	long varNum, /* in */
	long recNum, /* in */
	const long *indices, /* in */
	void *value /* out */
)
CDFstatus CDFgetzVarDataType (
	CDFid id, /* in */
	long varNum, /* in */
	long *dataType /* out */
)
CDFstatus CDFgetzVarDimSizes (
	CDFid id, /* in */
	long varNum, /* in */
	long *dimSizes /* out */
)
CDFstatus CDFgetzVarDimVariances (
	CDFid id, /* in */
	long varNum, /* in */
	long *dimVarys /* out */
)
CDFstatus CDFgetzVarMaxAllocRecNum (
	CDFid id, /* in */
	long varNum, /* in */
	long *maxRec /* out */
)
CDFstatus CDFgetzVarMaxWrittenRecNum (
	CDFid id, /* in */
	long varNum, /* in */
	long *maxRec /* out */
)
CDFstatus CDFgetzVarName (
	CDFid id, /* in */
	long varNum, /* in */
	char *varName /* out */
)
CDFstatus CDFgetzVarNumDims (
	CDFid id, /* in */
	long varNum, /* in */
	long *numDims /* out */
)
CDFstatus CDFgetzVarNumElements (
	CDFid id, /* in */
	long varNum, /* in */
	long *numElems /* out */
)
CDFstatus CDFgetzVarNumRecsWritten (
	CDFid id, /* in */
	long varNum, /* in */
	long *numRecs /* out */
)
CDFstatus CDFgetzVarPadValue (
	CDFid id, /* in */
	long varNum, /* in */
	void *padValue /* out */
)
CDFstatus CDFgetzVarRangeRecordsByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	long startRec, /* in */
	long stopRec, /* in */
	void *buffer /* out */
)
CDFstatus CDFgetzVarRecordData (
	CDFid id, /* in */
	long varNum, /* in */
	long recNum, /* in */
	void *buffer /* out */
)
CDFstatus CDFgetzVarRecVariance (
	CDFid id, /* in */
	long varNum, /* in */
	long *recVary /* out */
)
CDFstatus CDFgetzVarReservePercent (
	CDFid id, /* in */
	long varNum, /* in */
	long *percent /* out */
)
CDFstatus CDFgetzVarSeqData (
	CDFid id, /* in */
	long varNum, /* in */
	void *value /* out */
)
CDFstatus CDFgetzVarSeqPos (
	CDFid id, /* in */
	long varNum, /* in */
	long *recNum, /* out */
	long *indices /* out */
)
CDFstatus CDFgetzVarsMaxWrittenRecNum (
	CDFid id, /* in */
	long *recNum /* out */
)
CDFstatus CDFgetzVarSparseRecords (
	CDFid id, /* in */
	long varNum, /* in */
	long *sRecords /* out */
)
CDFstatus CDFgetzVarSpec (
	CDFid id, /* in */
	long varNum, /* in */
	long *dataType, /* out */
	long *numElems, /* out */
	long *numDims, /* out */
	long *dimSizes, /* out */
	long *recVary, /* out */
	long *dimVarys /* out */
)
CDFstatus CDFgetzVarsRecordDatabyNumbers (
	CDFid id, /* in */
	long numVars, /* in */
	const long *varNums, /* in */
	long varRecNum, /* in */
	void *buffer /* out */
)
CDFstatus CDFhyperGetzVarData (
	CDFid id, /* in */
	long varNum, /* in */
	long recNum, /* in */
	long recCount, /* in */
	long recInterval, /* in */
	const long *indices, /* in */
	const long *counts, /* in */
	long intervals[], /* in */
	void *buffer /* out */
)
CDFstatus CDFhyperPutzVarData (
	CDFid id, /* in */
	long varNum, /* in */
	long recNum, /* in */
	long recCount, /* in */
	long recInterval, /* in */
	long indices[], /* in */
	long counts[], /* in */
	long intervals[], /* in */
	const void *buffer /* in */
)
CDFstatus CDFinquireAttr (
	CDFid id, /* in */
	long attrNum, /* in */
	char *attrName, /* out */
	long *attrScope, /* out */
	long *maxgEntry, /* out */
	long *maxrEntry, /* out */
	long *maxzEntry /* out */
)
CDFstatus CDFinquireAttrgEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType, /* out */
	long *numElems /* out */
)
CDFstatus CDFinquireAttrrEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType, /* out */
	long *numElems /* out */
)
CDFstatus CDFinquireAttrzEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType, /* out */
	long *numElems /* out */
)
CDFstatus CDFinquireCDF (
	CDFid id, /* in */
	long *numDims, /* out */
	long dimSizes[CDF_MAX_DIMS], /* out */
	long *encoding, /* out */
	long *majority, /* out */
	long *maxrRec, /* out */
	long *numrVars, /* out */
	long *maxzRec, /* out */
	long *numzVars, /* out */
	long *numAttrs /* out */
)
CDFstatus CDFinquirezVar (
	CDFid id, /* in */
	long varNum, /* in */
	char *varName, /* out */
	long *dataType, /* out */
	long *numElems, /* out */
	long *numDims, /* out */
	long dimSizes[], /* out */
	long *recVary, /* out */
	long dimVarys[] /* out */
)
CDFstatus CDFinsertVarAllRecordsByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	long startRec, /* in */
	long numRecs, /* in */
	const void *buffer /* in */
)
CDFstatus CDFinsertrVarAllRecordsByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	long startRec, /* in */
	long numRecs, /* in */
	const void *buffer /* in */
)
CDFstatus CDFinsertzVarAllRecordsByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	long startRec, /* in */
	long numRecs, /* in */
	const void *buffer /* in */
)
CDFstatus CDFputAttrgEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long dataType, /* in */
	long numElems, /* in */
	const void *value /* in */
)
CDFstatus CDFopenCDF (
	const char *CDFname, /* in */
	CDFid *id /* out */
)
CDFstatus CDFputAttrrEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long dataType, /* in */
	long numElems, /* in */
	const void *value /* in */
)
CDFstatus CDFputAttrzEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long dataType, /* in */
	long numElems, /* in */
	const void *value /* in */
)
CDFstatus CDFputVarAllRecordsByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	const void *buffer /* in */
)
CDFstatus CDFputVarRangeRecordsByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	long startRec, /* in */
	long stopRec, /* in */
	const void *buffer /* in */
)
CDFstatus CDFputzVarAllRecordsByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	const void *buffer /* in */
)
CDFstatus CDFputzVarData (
	CDFid id, /* in */
	long varNum, /* in */
	long recNUm, /* in */
	long indices[], /* in */
	const void *value /* in */
)
CDFstatus CDFputzVarRangeRecordsByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	long startRec, /* in */
	long stopRec, /* in */
	const void *buffer /* in */
)
CDFstatus CDFputzVarRecordData (
	CDFid id, /* in */
	long varNum, /* in */
	long recNUm, /* in */
	const void *values /* in */
)
CDFstatus CDFputzVarSeqData (
	CDFid id, /* in */
	long varNum, /* in */
	const void *value /* in */
)
CDFstatus CDFputzVarsRecordDatabyNumbers (
	CDFid id, /* in */
	long numVars, /* in */
	long varNums[], /* in */
	long varRecNum, /* in */
	const void *buffer /* in */
)
CDFstatus CDFrenameAttr (
	CDFid id, /* in */
	long attrNum, /* in */
	const char *attrName /* in */
)
CDFstatus CDFrenamezVar (
	CDFid id, /* in */
	long varNum, /* in */
	const char *varName /* in */
)
CDFstatus CDFsetAttrgEntryDataSpec (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long dataType /* in */
)
CDFstatus CDFsetAttrrEntryDataSpec (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long dataType /* in */
)
CDFstatus CDFsetAttrScope (
	CDFid id, /* in */
	long attrNum, /* in */
	long attrScope /* in */
)
CDFstatus CDFsetAttrzEntryDataSpec (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long dataType /* in */
)
CDFstatus CDFsetCacheSize (
	CDFid id, /* in */
	long numBuffers /* in */
)
CDFstatus CDFsetChecksum (
	CDFid id, /* in */
	long checksum /* in */
)
CDFstatus CDFsetCompression (
	CDFid id, /* in */
	long compressionType, /* in */
	long compressionParms[] /* in */
)
CDFstatus CDFsetCompressionCacheSize (
	CDFid id, /* in */
	long numBuffers /* in */
)
CDFstatus CDFsetDecoding (
	CDFid id, /* in */
	long decoding /* in */
)
CDFstatus CDFsetEncoding (
	CDFid id, /* in */
	long encoding /* in */
)
void CDFsetFileBackward (
	long mode /* in */
)
CDFstatus CDFsetFormat (
	CDFid id, /* in */
	long format /* in */
)
CDFstatus CDFsetLeapSecondLastUpdated (
	CDFid id, /* in */
	long lastUpdated /* in */
)
CDFstatus CDFsetMajority (
	CDFid id, /* in */
	long majority /* in */
)
CDFstatus CDFsetNegtoPosfp0Mode (
	CDFid id, /* in */
	long negtoPosfp0 /* in */
)
CDFstatus CDFsetReadOnlyMode (
	CDFid id, /* in */
	long readOnly /* in */
)
CDFstatus CDFsetStageCacheSize (
	CDFid id, /* in */
	long numBuffers /* in */
)
void CDFsetValidate (
	long mode /* in */
)
CDFstatus CDFsetzMode (
	CDFid id, /* in */
	long zMode /* in */
)
CDFstatus CDFsetzVarAllocBlockRecords (
	CDFid id, /* in */
	long varNum, /* in */
	long firstRec, /* in */
	long lastRec /* in */
)
CDFstatus CDFsetzVarAllocRecords (
	CDFid id, /* in */
	long varNum, /* in */
	long numRecs /* in */
)
CDFstatus CDFsetzVarBlockingFactor (
	CDFid id, /* in */
	long varNum, /* in */
	long bf /* in */
)
CDFstatus CDFsetzVarCacheSize (
	CDFid id, /* in */
	long varNum, /* in */
	long numBuffers /* in */
)
CDFstatus CDFsetzVarCompression (
	CDFid id, /* in */
	long varNum, /* in */
	long compressionType, /* in */
	long compressionParms[] /* in */
)
CDFstatus CDFsetzVarDataSpec (
	CDFid id, /* in */
	long varNum, /* in */
	long dataType /* in */
)
CDFstatus CDFsetzVarDimVariances (
	CDFid id, /* in */
	long varNum, /* in */
	long dimVarys[] /* in */
)
CDFstatus CDFsetzVarInitialRecs (
	CDFid id, /* in */
	long varNum, /* in */
	long initialRecs /* in */
)
CDFstatus CDFsetzVarPadValue (
	CDFid id, /* in */
	long varNum, /* in */
	const void *padValue /* in */
)
CDFstatus CDFsetzVarRecVariance (
	CDFid id, /* in */
	long varNum, /* in */
	long recVary /* in */
)
CDFstatus CDFsetzVarReservePercent (
	CDFid id, /* in */
	long varNum, /* in */
	long reservePercent /* in */
)
CDFstatus CDFsetzVarsCacheSize (
	CDFid id, /* in */
	long numBuffers /* in */
)
CDFstatus CDFsetzVarSeqPos (
	CDFid id, /* in */
	long varNum, /* in */
	long recNum, /* in */
	long indices[] /* in */
)
CDFstatus CDFsetzVarSparseRecords (
	CDFid id, /* in */
	long varNum, /* in */
	long sRecords /* in */
)
CDFstatus CDFreadgAttrEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType, /* out */
	long *numElems, /* out */
	CDFdata *data /* out */
)
CDFstatus CDFreadzAttrEntry (
	CDFid id, /* in */
	long attrNum, /* in */
	long entryNum, /* in */
	long *dataType, /* out */
	long *numElems, /* out */
	CDFdata *data /* out */
)
CDFstatus CDFreadzVarPadValue (
	CDFid id, /* in */
	long varNum, /* in */
	long *dataType, /* out */
	long *numElems, /* out */
	CDFdata *data /* out */
)
CDFstatus CDFreadzVarAllByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	long *numRecs, /* out */
	long *dataType, /* out */
	long *numElems, /* out */
	long *numDims, /* out */
	long dimSizes[], /* out */
	long *recVary, /* out */
	long dimVarys[], /* out */
	CDFdata *data /* out */
)
CDFstatus CDFreadzVarDataByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	long *numRecs, /* out */
	CDFdata *data /* out */
)
CDFstatus CDFreadzVarRangeDataByVarID (
	CDFid id, /* in */
	long varNum, /* in */
	long startRec, /* in */
	long stopRec, /* in */
	CDFdata *data /* out */
)
CDFstatus CDFreadzVarAllByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	long *numRecs, /* out */
	long *dataType, /* out */
	long *numElems, /* out */
	long *numDims, /* out */
	long dimSizes[], /* out */
	long *recVary, /* out */
	long dimVarys[], /* out */
	CDFdata *data /* out */
)
CDFstatus CDFreadzVarDataByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	long *numRecs, /* out */
	CDFdata *data /* out */
)
CDFstatus CDFreadzVarRangeDataByVarName (
	CDFid id, /* in */
	const char *varName, /* in */
	long startRec, /* in */
	long stopRec, /* in */
	CDFdata *data /* out */
)
CDF_Free_String (
	long numStrings, /* in */
	const char **strings /* in */
)
double computeEPOCH (
	long year, /* in */
	long month, /* in */
	long day, /* in */
	long hour, /* in */
	long minute, /* in */
	long second, /* in */
	long msec /* in */
)
void EPOCHbreakdown (
	double epoch, /* in */
	long *year, /* out */
	long *month, /* out */
	long *day, /* out */
	long *hour, /* out */
	long *minute, /* out */
	long *second, /* out */
	long *msec /* out */
)
void toEncodeEPOCH (
	double epoch, /* in */
	int style, /* in */
	char epString[EPOCH_STRING_LEN+1] /* out */
)
void encodeEPOCH (
	double epoch, /* in */
	char epString[EPOCH_STRING_LEN+1] /* out */
)
void encodeEPOCH1 (
	double epoch, /* in */
	char epString[EPOCH1_STRING_LEN+1] /* out */
)
void encodeEPOCH2 (
	double epoch, /* in */
	char epString[EPOCH2_STRING_LEN+1] /* out */
)
void encodeEPOCH3 (
	double epoch, /* in */
	char epString[EPOCH3_STRING_LEN+1] /* out */
)
void encodeEPOCH4 (
	double epoch, /* in */
	char epString[EPOCH4_STRING_LEN+1] /* out */
)
void encodeEPOCHx (
	double epoch, /* in */
	char format[EPOCHx_FORMAT_MAX+1], /* in */
	char epString[EPOCHx_STRING_MAX+1] /* out */
)
double parseEPOCH (epString)
	char epString[EPOCH_STRING_LEN+1] /* in */
)
double toParseEPOCH (
	char epString[EPOCH_STRING_LEN+1] /* in */
)
double parseEPOCH1 (
	char epString[EPOCH1_STRING_LEN+1] /* in */
)
double parseEPOCH2 (
	char epString[EPOCH2_STRING_LEN+1] /* in */
)
double parseEPOCH3 (
	char epString[EPOCH3_STRING_LEN+1] /* in */
)
double parseEPOCH4 (
	char epString[EPOCH4_STRING_LEN+1] /* in */
)
double computeEPOCH16 (
	long year, /* in */
	long month, /* in */
	long day, /* in */
	long hour, /* in */
	long minute, /* in */
	long second, /* in */
	long msec, /* in */
	long microsec, /* in */
	long nanosec, /* in */
	long picosec, /* in */
	double epoch[2] /* out */
)
void EPOCH16breakdown (
	double epoch[2], /* in */
	long *year, /* out */
	long *month, /* out */
	long *day, /* out */
	long *hour, /* out */
	long *minute, /* out */
	long *second, /* out */
	long *msec, /* out */
	long *microsec, /* out */
	long *nanosec, /* out */
	long *picosec /* out */
)
void toEncodeEPOCH16 (
	double epoch[2], /* in */
	int style, /* in */
	char epString[EPOCH16_STRING_LEN +1] /* out */
)
void encodeEPOCH16 (
	double epoch[2], /* in */
	char epString[EPOCH16_STRING_LEN +1] /* out */
)
void encodeEPOCH16_1 (
	double epoch[2], /* in */
	char epString[EPOCH16_1_STRING_LEN+1] /* out */
)
void encodeEPOCH16_2 (
	double epoch[2], /* in */
	char epString[EPOCH16_2_STRING_LEN+1] /* out */
)
void encodeEPOCH16_3 (
	double epoch[2], /* in */
	char epString[EPOCH16_3_STRING_LEN+1] /* out */
)
void encodeEPOCH16_4 (
	double epoch[2], /* in */
	char epString[EPOCH16_4_STRING_LEN+1] /* out */
)
void encodeEPOCH16_x (
	double epoch[2], /* in */
	char format[EPOCHx_FORMAT_MAX+1], /* in */
	char epString[EPOCHx_STRING_MAX+1] /* out */
)
double toParseEPOCH16 (
	char epString[EPOCH16__STRING_LEN+1], /* in */
	double epoch[2] /* out */
)
double parseEPOCH16 (
	char epString[EPOCH16__STRING_LEN+1], /* in */
	double epoch[2] /* out */
)
double parseEPOCH16_1 (
	char epString[EPOCH16_1_STRING_LEN+1], /* in */
	double epoch[2] /* out */
)
double parseEPOCH16_2 (
	char epString[EPOCH16_2_STRING_LEN+1], /* in */
	double epoch[2] /* out */
)
double parseEPOCH16_3 (
	char epString[EPOCH16_3_STRING_LEN+1], /* in */
	double epoch[2] /* out */
)
double parseEPOCH16_4 (
	char epString[EPOCH16_4_STRING_LEN+1], /* in */
	double epoch[2] /* out */
)
void EPOCHtoUnixTime (
	const double *epoch, /* in */
	double *unixTime, /* out */
	int numTimes /* in */
)
void EPOCH16toUnixTime (
	const double *epoch, /* in */
	double *unixTime, /* out */
	int numTimes /* in */
)
void UnixTimetoEPOCH (
	const double *unixTime, /* in */
	double *epoch, /* out */
	int numTimes /* in */
)
void UnixTimetoEPOCH16 (
	const double *unixTime, /* in */
	double *epoch, /* out */
	int numTimes /* in */
)

long long computeTT2000 (
	double year, /* in */
	double month, /* in */
	double day, /* in */
	...
	TT2000END /* in */
)
long long computeTT2000 (
	double year, /* in */
	double month, /* in */
	double day, /* in */
	double hour, /* in */
	double minute, /* in */
	double second, /* in */
	double msec, /* in */
	double usec, /* in */
	double nsec /* in */
)
void breakdownTT2000 (
	long long tt2000, /* in */
	double *year, /* out */
	double *month, /* out */
	double *day, /* out */
	...
	TT2000NULL /* in */
)
void breakdownTT2000 (
	long long tt2000, /* in */
	double *year, /* out */
	double *month, /* out */
	double *day, /* out */
	double *hour, /* out */
	double *minute, /* out */
	double *second, /* out */
	double *msec, /* out */
	double *usec, /* out */
	double *nsec /* out */
)
void toEncodeTT2000 (
	long long tt2000, /* in */
	int style, /* in */
	char *epString /* out */
)
void encodeTT2000 (
	long long tt2000, /* in */
	char *epString /* out */
)
void encodeTT2000 (
	long long tt2000, /* in */
	char *epString, /* out */
	int form /* in */
)
long long toParseTT2000 (
	const char *epString /* in */
)
long long parseTT2000 (
	const char *epString /* in */
)
long CDF_TT2000_from_UTC_EPOCH (
	double epoch /* in */
)
long CDF_TT2000_from_UTC_EPOCH16 (
	const double *epoch16 /* in */
)
double CDF_TT2000_to_UTC_EPOCH (
	long long tt2000  /* in */
)
double CDF_TT2000_to_UTC_EPOCH16 (
	long long tt2000, /* in */
	double *epoch16 ** /** * out */
)
void TT2000toUnixTime (
	const const long long *tt2000, /* in */
	double *epoch16 **, /** * out */
	int numTimes /* in */
)
void UnixTimetoTT2000 (
	double *unixTime **, /** * in */
	long long *tt2000, /* out */
	int numTimes /* in */
)
