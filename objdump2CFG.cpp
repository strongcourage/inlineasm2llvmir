#include <string>
#include <iostream>
#include <fstream>
#include <map>
#include <algorithm>    // std::remove_if

using namespace std;

static const string keywordsInsts[] =
{
    "push", "pop",
    "mov", "movl", "lea",
    "add", "sub", "mul",
    "cmpl", "jle", "jmpq",
    "retq", "ret", "leave"
};

struct InfoInst {
    string keyInst;
    string addressInst;
    string opcodesInst;
    string offsetInst;
};

static void objdump2CFG(string fileName) {
    ifstream ifs(fileName);
    string newFileName = "new_" + fileName;
    ofstream ofs(newFileName);
    string line;
    int keywordsSize = sizeof(keywordsInsts)/sizeof(string);

    // map<string, string> symbols; // <address, opcodes>

    // open and read objdump input file
    if (ifs.is_open()) {
        while(getline(ifs, line)) {
            // cout << line << endl;
            string::size_type pos_keyword = string::npos;
            string::size_type pos_colon = string::npos;
            string::size_type pos_not_colon_opcodes = string::npos;

            for (int i=0; i<line.size(); i++) {
                if (line.at(i) == ':') {
                    cout << "pos_colon: " << i << endl;
                    pos_colon = i;
                    string address = line.substr(0, pos_colon);

                    // erase spaces of address
                    string::iterator end_pos_address = remove(address.begin(), address.end(), ' ');
                    address.erase(end_pos_address, address.end());
                    // cout << "address:" << address << endl;

                }
            }

            for (int i=0; i<keywordsSize; i++) {
                pos_keyword = line.find(keywordsInsts[i]);
                if (pos_keyword != string::npos && pos_colon != string::npos) {
                    string extract_line = "ins" + line;
                    extract_line = line.substr(0, pos_keyword-1); // line.resize(pos_keyword);
                    ofs << "extract_line: " << extract_line << endl;

                    string opcodes = extract_line.substr(pos_colon+1, pos_keyword);
                    // find the first position of opcodes that is not a space
                    for (int j=0; j<opcodes.size(); j++) {
                        if (line.at(j) != ' ') {
                            pos_not_colon_opcodes = j;
                            cout << "pos_not_colon_opcodes: " << pos_not_colon_opcodes << endl;
                            break;
                        }
                    }
                    if (pos_not_colon_opcodes != string::npos) {
                        opcodes = opcodes.substr(pos_not_colon_opcodes-1, opcodes.size());
                        cout << "opcodes: " << opcodes << endl;
                    }
                }
            }
        }

        ifs.close();
    } else {
        cout << "Unable to open objdump input file"; 
        exit(-1);
    }   
}

int main(int argc, char **argv) {
    string fileName(argv[1]);
    objdump2CFG(fileName);
    return 0;
}

