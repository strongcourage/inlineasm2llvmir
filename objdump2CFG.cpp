#include <string>
#include <iostream>
#include <fstream>
#include <map>
#include <algorithm>    // std::remove_if
#include <functional> 
#include <cctype>
#include <locale>
#include <map>
#include <vector>

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
    pair <string, string> offsetInst; //<next_function, offset_in_hex>
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

// find position of first occurrence of special character
static inline int first_position(string str, const char c) {
    int pos = -1;
    for (int i=0; i<str.size(); i++) {
        if (str.at(i) == c) {
            pos = i;
            break;
        }
    }
    return pos;
}


static void objdump2CFG(string fileName) {
    ifstream ifs(fileName);
    string newFileName = "new_" + fileName;
    ofstream ofs(newFileName);
    string line;
    int keywordsSize = sizeof(keywordsInsts)/sizeof(string);

    map<string, vector<InfoInst> > mapFuncInst; // <function_name, list_of_instructions_of_function>
    vector<InfoInst> vectorInst;

    // open and read objdump input file
    if (ifs.is_open()) {
        while(getline(ifs, line)) {
            string::size_type pos_keyword = string::npos;
            string keyword, address, opcodes, next_func, att_insts, offset;
            string insert_line;

            int pos_colon = first_position(line, ':');
            if (pos_colon >= 0) {
                // cout << "pos_colon: " << pos_colon << endl;
                address = trim(line.substr(0, pos_colon));
            }

            for (int i=0; i<keywordsSize; i++) {
                pos_keyword = line.find(keywordsInsts[i]);
                // cout << "pos_keyword: " << pos_keyword << endl;
                keyword = keywordsInsts[i];
                
                
                if (pos_keyword != string::npos && pos_colon != string::npos) {
                    insert_line = "ins " + trim(line.substr(0, pos_keyword-1)); // line.resize(pos_keyword);
                    ofs << insert_line << endl;

                    opcodes = trim(insert_line.substr(pos_colon+3, pos_keyword-pos_colon-3));
                    // cout << "opcodes: " << opcodes << endl;
                    att_insts = trim(line.substr(pos_keyword+keyword.size()+1, line.size()).c_str());

                    // update struct InfoInst of each instruction
                    InfoInst current_inst = { keyword, address, opcodes, make_pair("", "")}; 
                    vectorInst.push_back(current_inst);

                    // unconditional branch, for example: jle    28 <main+0x28>; jmpq   33 <main+0x33>
                    if (keyword == "jmpq" || keyword == "jle") {
                        int pos_1 = first_position(att_insts, '<');
                        int pos_2 = first_position(att_insts, '+');
                        int pos_3 = first_position(att_insts, '>');
                        if (pos_1 >= 0 && pos_2 >= 0) {
                            next_func = att_insts.substr(pos_1+1, pos_2-pos_1-1);
                            current_inst.offsetInst.first = next_func;
                            // cout << "next_func: " << next_func << endl;
                            string offset = att_insts.substr(pos_2+3, pos_3-pos_2-3);
                            current_inst.offsetInst.second = offset;
                            // cout << "offset: " << offset << endl;

                            // insert a true branch at the end of this instruction
                            string trueBr = " trueBr=" + offset;
                            insert_line += trueBr;
                        }
                    }

                    // conditional branch


                    // print infos of the current instruction                    
                    cout << "instruction: ";
                    cout << current_inst.keyInst << " / " << current_inst.addressInst << " / " << current_inst.opcodesInst 
                         << " / " <<  current_inst.offsetInst.first << " / " << current_inst.offsetInst.second << endl;
                }
            }

            // write this line to the new objdump file
            ofs << insert_line << endl;
        }
        // TODO: only consider main function. Need to find all existed functions
        mapFuncInst.insert(make_pair("main", vectorInst)); 

        // print all instructions which belongs to a function
        for (map<string, vector<InfoInst>>::iterator map_it=mapFuncInst.begin(); map_it!=mapFuncInst.end(); ++map_it) {
            cout << map_it->first << endl;
            for (vector<InfoInst>::iterator vec_it=map_it->second.begin(); vec_it!=map_it->second.end(); ++vec_it) {
                cout << "instruction: "; 
                cout << vec_it->keyInst << " / " << vec_it->addressInst << " / " << vec_it->opcodesInst 
                     << " / " <<  vec_it->offsetInst.first << " / " << vec_it->offsetInst.second << endl;
            }
        }

        // close file
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

