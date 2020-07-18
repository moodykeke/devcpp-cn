/*********************************************************************
Synchonize Dev-C++ Language Files
Open "English.lng" as reference file, then open other language file.
Compare the items (which contains ID and some text) in both file. 
Append the items which exist only in reference file to the compared file.

BTW: If you translated your language file, please send to my Emailbox.

Anbang LI(anbangli@foxmail.com). May, 2020.
*********************************************************************/

#include <iostream>
#include <algorithm>
#include <vector>
#include <string>
using namespace std;

char fileReference[32] = "English.lng";
char fileCompare[][32] = {
	"Bulgarian.lng",
	"Catalan.lng",
	"Chinese.lng",
	"Chinese_TC.lng",
	"Croatian.lng",
	"Czech.lng",
	"Danish.lng",
	"Dutch.lng",
	"Estonian.lng",
	"French.lng",
	"Galego.lng",
	"German.lng",
	"Greek.lng",
	"Hebrew.lng",
	"Hungarian.lng",
	"Italian.lng",
	"Japanese.lng",
	"Korean.lng",
	"Latvian.lng",
	"Norwegian.lng",
	"Polish.lng",
	"Portuguese.lng",
	"Romanian.lng",
	"Russian.lng",
	"Slovak.lng",
	"Slovenian.lng",
	"Spanish.lng",
	"SpanishCastellano.lng",
	"SpanishColombia.lng",
	"Swedish.lng",
	"Turkish.lng",
	"Ukrainian.lng"
};


////////////////////////////////////////////////////////////////////////////////
struct LangItem {
	int ID;
	string text;
	string formatspec;
};

struct LangFile {
	char filename[32];
	bool OpenFile(const char* FileName);
	LangItem* FindID(int ID);
	char language[32];
	char version[32];
	char langcode[32]; 
	vector<LangItem> contents;
};

bool LangFile::OpenFile(const char* fname) {
	FILE* file = fopen(fname, "rb");	//readonly, binary file
	if(!file) { // if file doesn't exist
		printf("ERROR: %s  %s", fname, "don't exist!");
		exit(1);	//return false;
	}
	
	//File exists, continue
	strcpy(filename, fname);
	int ID;
	char line[512];
	char text[512];
	string formatspec = "csdioxXufFeEaAgGnp";
	LangItem item;
	contents.clear();	//clear
	while(fgets(line, 512, file)) {
		if (sscanf(line, "Lang=%[^\r\n]", text) == 1) 
			strcpy(language, text);
		if (sscanf(line, "Ver=%[^\r\n]", text) == 1) 
			strcpy(version, text);
		if (sscanf(line, "Code=%[^\r\n]", text) == 1) 
			strcpy(langcode, text);

		if(sscanf(line, "%d=%[^\r\n]", &ID, text) == 2) {
			item.ID = ID;
			item.text = text;
			item.formatspec = "";

			// Find formatting specifiers
			// Loop through format options
			size_t pos = item.text.find('%',0);
			while(pos != string::npos) {
				item.formatspec += '%';
				size_t offset = pos+1;
				while(offset < item.text.length()) {
					item.formatspec += item.text[offset];

					// Stop at format specifier
					if(formatspec.find(item.text[offset]) != string::npos) {
						break;
					}
					offset++;
				}
				item.formatspec += ",";
				pos = item.text.find('%',pos+1);
			}

			// Trim last ","
			if(item.formatspec != "") {
				item.formatspec = item.formatspec.substr(0,item.formatspec.length()-1);
			}

			// Add to list
			contents.push_back(item);	//!!!
		}
	}
	fclose(file);
	printf("INFO: Found %d items in file %s\r\n", contents.size(), filename);
	printf("language, version, code: %s, %s, %s\r\n", language, version, langcode);

	return true;
}

LangItem* LangFile::FindID(int ID) {
	for(unsigned int i = 0; i < contents.size(); i++)
		if(contents[i].ID == ID)
			return &contents[i];
	return NULL;
}

////////////////////////////////////////////////////////////////////////////////
bool ItemComp(const LangItem &a, const LangItem &b){	//Compare function. Used in "sort".
    return a.ID < b.ID;
}

void LangCompare(LangFile& ref, LangFile& cmp) {
	int i, j, n;
	printf("total IDs in reference file: %d\n", ref.contents.size());
	printf("total IDs in compared file:  %d\n", cmp.contents.size());
	// For all IDs in reference, check if they exist in compare
	printf("\r\nIDs exist in reference but not in compared language:\r\n");
	for( i = 0, n = 0; i < ref.contents.size(); i++) {
		LangItem* item = &ref.contents[i];
		if(cmp.FindID(item->ID) == NULL) {
			printf("%d=%s\r\n", item->ID, item->text.c_str());
			//fprintf(file, "%d=%s\r\n", item->ID, item->text.c_str());	//append
			n++;
			
			cmp.contents.insert(cmp.contents.end(), *item); //append 
		
			//printf("WARNING: Cannot find reference ID %5d in other language\r\n", item->ID);
		}
	}
	printf("total: %d\n", n);
	
	sort(cmp.contents.begin(), cmp.contents.end(), ItemComp); //Sort
	
	//write to compared file
	FILE* file = fopen(cmp.filename, "wb");	//append, binary
	if(!file) { // if file doesn't exist
		printf("ERROR: %s  %s", cmp.filename, "don't exist!");
		return;
	}
	fprintf(file, "[lang]\r\n");
	fprintf(file, "Lang=%s\r\n", cmp.language);
	fprintf(file, "Ver=%s\r\n", cmp.version);
	fprintf(file, "Code=%s\r\n\r\n", cmp.langcode);

	for( i = 0; i < cmp.contents.size(); i++) {
		if (cmp.contents[i].ID - n > 1)
			fprintf(file, "\r\n");	//empty line
		fprintf(file, "%d=%s\r\n", cmp.contents[i].ID, cmp.contents[i].text.c_str());
		n = cmp.contents[i].ID;
	}
	
	fclose(file);	//close compared file
	printf("Now, total IDs in compared file: %d\n", cmp.contents.size());

	// For all IDs in compare, check if they exist in reference
	printf("\r\nIDs exist in compared but not in reference language:\r\n");
	for(i = 0, n = 0; i < cmp.contents.size(); i++) {
		LangItem* item = &cmp.contents[i];
		if(ref.FindID(item->ID) == NULL) {
			printf("%5d=%s\r\n", item->ID, item->text.c_str());
			n++;
			//printf("WARNING: Cannot find comparison ID %5d in reference language\r\n", item->ID);
		}
	}
	printf("total: %d\n", n);

	// For all found items, compare formatting options
	printf("\r\nFormat specifier comparison result:\r\n");
	n = 0;
	for(i = 0; i < ref.contents.size(); i++) {
		LangItem* item = &ref.contents[i];
		LangItem* sameitem = cmp.FindID(item->ID);
		if(sameitem != NULL and sameitem->formatspec != item->formatspec) {
			printf("ERROR: Format specifier mismatch at ID %5d: %s vs. %s\r\n",
			       item->ID, item->formatspec.c_str(), sameitem->formatspec.c_str());
			n++;
		}
	}
	printf("total: %d\n", n);

	printf("\r\nComparison of  %s  finished.\r\n\n\n", cmp.filename);
}


////////////////////////////////////////////////////////////////////////////////

int main(int argc, char *argv[]) {
	printf("Comparing Dev-C++ Language files: \n\n");

	// Get reference language filename
	LangFile reference;
	LangFile compare;

	reference.OpenFile(fileReference);	// Open reference language
	
	int n = sizeof(fileCompare)/sizeof(fileCompare[0]);
	for (int i = 0; i < n; i++) {
		compare.OpenFile(fileCompare[i]);	// Open compared language
		LangCompare(reference, compare);	// Compare and synchonize them
		printf("Press any key to continue");
		int ch = getchar();
	}
	printf("\nAll Comparison finished.\n\n");
}