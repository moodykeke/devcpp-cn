#include "LangCompare.h"

LangCompare::LangCompare(LangFile& referencein,
                         LangFile& comparein) : reference(referencein),compare(comparein)  {
	Compare();
}

LangCompare::~LangCompare() {

}

void LangCompare::Compare() {
	// For all IDs in reference, check if they exist in compare
	Log("\r\nThe Following ID existed in reference but not in compared language:\r\n");
	for(unsigned int i = 0; i < reference.contents.size(); i++) {
		LangItem* item = &reference.contents[i];
		if(compare.FindID(item->ID) == NULL) {
			Log("%5d=%s\r\n", item->ID, item->text.c_str());
			//Log("WARNING: Cannot find reference ID %5d in other language\r\n", item->ID);
		}
	}

	// For all IDs in compare, check if they exist in reference
	Log("\r\nThe Following ID existed in compared but not in reference language:\r\n");
	for(unsigned int i = 0; i < compare.contents.size(); i++) {
		LangItem* item = &compare.contents[i];
		if(reference.FindID(item->ID) == NULL) {
			Log("%5d=%s\r\n", item->ID, item->text.c_str());
			//Log("WARNING: Cannot find comparison ID %5d in reference language\r\n", item->ID);
		}
	}

	// For all found items, compare formatting options
	Log("\r\nFormat specifier comparison result:\r\n");
	for(unsigned int i = 0; i < reference.contents.size(); i++) {
		LangItem* item = &reference.contents[i];
		LangItem* sameitem = compare.FindID(item->ID);
		if(sameitem != NULL and sameitem->formatspec != item->formatspec) {
			Log("ERROR: Format specifier mismatch at ID %5d: %s vs. %s\r\n",
			    item->ID, item->formatspec.c_str(), sameitem->formatspec.c_str());
		}
	}
	
	Log("\r\nComparison finished.\r\n");
}
