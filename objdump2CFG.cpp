#include <string>
#include <iostream>
#include <fstream>
#include <map>
#include <algorithm>    // std::remove_if
#include <functional> 
#include <cctype>
#include <locale>

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
    pair <string, int> offsetInst;
};

// trim from start
static inline string ltrim(string str) {
    str.erase(str.begin(), find_if(str.begin(), str.end(), not1(ptr_fun<int, int>(isspace))));
    return str;
}

// trim from end
static inline string rtrim(string str) {
    str.erase(find_if(str.rbegin(), str.rend(), std::not1(ptr_fun<int, int>(isspace))).base(), str.end());
    return str;
}

// trim from both ends
static inline string trim(string str) {
    return ltrim(rtrim(str));
}

static void objdump2CFG(string fileName) {
    ifstream ifs(fileName);
    string newFileName = "new_" + fileName;
    ofstream ofs(newFileName);
    string line;
    int keywordsSize = sizeof(keywordsInsts)/sizeof(string);

    // open and read objdump input file
    if (ifs.is_open()) {
        while(getline(ifs, line)) {
            // cout << line << endl;
            string::size_type pos_keyword = string::npos;
            string::size_type pos_colon = string::npos;
            string::size_type pos_not_colon_opcodes = string::npos;
            string keyword;
            string address;
            string next_func;
            string att_insts;
            int offset = 0;

            for (int i=0; i<line.size(); i++) {
                if (line.at(i) == ':') {
                    // cout << "pos_colon: " << i << endl;
                    pos_colon = i;
                    address = trim(line.substr(0, pos_colon));
                }
            }

            for (int i=0; i<keywordsSize; i++) {
                pos_keyword = line.find(keywordsInsts[i]);
                // cout << "pos_keyword: " << pos_keyword << endl;
                // cout << "line size: " << line.size() << endl;
                keyword = keywordsInsts[i];
                
                
                if (pos_keyword != string::npos && pos_colon != string::npos) {
                    string extract_line = "ins " + trim(line.substr(0, pos_keyword-1)); // line.resize(pos_keyword);
                    cout << "extract_line: " << extract_line << endl;
                    ofs << extract_line << endl;

                    string opcodes = trim(extract_line.substr(pos_colon+1, pos_keyword));
                    cout << "opcodes: " << opcodes << endl;

                    att_insts = trim(line.substr(pos_keyword+keyword.size()+1, line.size()).c_str());
                    cout << "att_insts: " << att_insts << endl;

                    // unconditional branch
                    if (keyword == "jmpq" || keyword == "jle") {

                    }

                    // conditional branch

                    // update struct InfoInst of each instruction
                    InfoInst current_inst = { keyword, address, opcodes, make_pair("", 0)}; 
                    cout << "instruction: ";
                    cout << current_inst.keyInst << " " << current_inst.addressInst << " " << current_inst.opcodesInst 
                        << " " <<  current_inst.offsetInst.first << " " << current_inst.offsetInst.second << endl;

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

