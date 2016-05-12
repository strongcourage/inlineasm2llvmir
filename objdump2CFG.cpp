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
    "movl", "mov", "moq", "lea", "leaq",
    "add", "sub", "mul", "addq", "subq", "mulq",// arithmetic instructions
    "cmpl", "cmp", // comparison instructions
    "jmpq", "jmp",  // arithmetic instructions
    "je", "jne", "jl", "jnge", "jle", "jng", "jg", "jnle", "jge", "jnl",   // conditional branch instructions
    "callq", "call", // call instructions
    "loop", "loope", "loopz", "loopne", "loopnz", // loop instructions
    "retq", "ret", "leave", "leaveq" // ret instructions
};

struct InfoInst {
    string keyInst;
    string addressInst;
    string opcodesInst;
    pair <string, string> nextAddrInst; //<next_function, next_address_in_hex>
    string printInst;
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

static void objdump2CFG(string fileName, string root) {
    ifstream ifs(fileName);
    string newFileName = "new_" + fileName;
    ofstream ofs(newFileName);
    string line;
    int keywordsSize = sizeof(keywordsInsts)/sizeof(string);
    string root_str = "<" + root + ">";

    map<string, vector<InfoInst> > mapFuncInst; // <function_name, list_of_instructions_of_function>
    vector<InfoInst> vectorInst;
    vector<string> vectorBranches;

    // open and read objdump input file
    if (ifs.is_open()) {
        while(getline(ifs, line)) {
            string::size_type pos_keyword = string::npos;
            string keyword, address, opcodes, next_func, att_insts, offset;
            string insert_line, blk_line = "", func_line = "", first_blk;
            string func_name, func_addr, func_addr_not_zero;

            // find address of functions
            // pos_func = line.find(root_str);
            int pos_lt = first_position(line, '<');
            int pos_gt = first_position(line, '>');
            cout << line.substr(0, pos_lt-1) << endl;
            if (pos_lt == 17) { // detect a new function
                func_addr = line.substr(0, pos_lt);
                func_name = line.substr(pos_lt+1, pos_gt-pos_lt-1);
                cout << "func_name: " << func_name << endl;
                // remove all '0' of function address
                size_t pos_not_zero = func_addr.find_first_not_of("0");
                if (pos_not_zero == func_addr.size()-1)
                    func_addr_not_zero = "0";
                else
                    func_addr_not_zero = func_addr.substr(pos_not_zero, func_addr.size()-pos_not_zero);
                cout << "func_addr_not_zero: " << func_addr_not_zero << endl;
                if (func_name == root)
                    func_line = "\nfun " + func_addr_not_zero + ": entry=true\n";
                else
                    func_line = "\nfun " + func_addr_not_zero + ": entry=false\n";
                first_blk = "blk " + func_addr_not_zero + ":";
                ofs << func_line << first_blk;
            }

            int pos_colon = first_position(line, ':');
            if (pos_colon == 4) { // detect an instruction
                address = trim(line.substr(0, pos_colon));

                // if address in vectorBranches, create a new basic block
                vector<string>::iterator vec_it = find (vectorBranches.begin(), vectorBranches.end(), address);
                if (vec_it != vectorBranches.end()) {
                    blk_line = "blk " + address + ":\n";
                }
            }

            for (int i=0; i<keywordsSize; i++) {
                pos_keyword = line.find(keywordsInsts[i]);
                if (pos_keyword != string::npos && pos_colon != string::npos 
                    && line.at(pos_keyword+keywordsInsts[i].length()) == ' ') { // distinguish "mov" and "movl"
                    keyword = keywordsInsts[i];
                    insert_line = "ins " + trim(line.substr(0, pos_keyword-1)); // line.resize(pos_keyword);

                    opcodes = trim(insert_line.substr(pos_colon+3, pos_keyword-pos_colon-3));
                    att_insts = trim(line.substr(pos_keyword+keyword.size()+1, line.size()).c_str());

                    // update struct InfoInst of each instruction
                    InfoInst current_inst = { keyword, address, opcodes, make_pair("", ""), insert_line};                
                    vectorInst.push_back(current_inst);

                    // unconditional branch, for example: jmpq   33 <main+0x33>
                    // call instruction, for example: callq  47 <main+0x1d>
                    if (keyword == "jmpq" || keyword == "jmp" || keyword == "jle" || 
                            keyword == "callq" || keyword == "call") {
                        int pos_1 = first_position(att_insts, '<');
                        int pos_2 = first_position(att_insts, '+');
                        int pos_3 = first_position(att_insts, '>');
                        string next_addr, offset, trueBr;
                        if (pos_1 >= 0 && pos_2 >= 0) {
                            next_func = att_insts.substr(pos_1+1, pos_2-pos_1-1);
                            current_inst.nextAddrInst.first = next_func;
                            offset = att_insts.substr(pos_2+3, pos_3-pos_2-3);
                            next_addr = trim(att_insts.substr(0, pos_1));
                            current_inst.nextAddrInst.second = next_addr;

                            if (keyword != "callq" && keyword != "call") {
                                // insert a true branch at the end of this instruction
                                trueBr = " trueBr=" + next_addr;
                                current_inst.printInst += trueBr;
                                vectorBranches.push_back(next_addr);
                            } else {
                                current_inst.printInst += " lclCall="+next_addr;
                            }
                        }
                    }

                    // conditional branch, for example: jle    25 <main+0x25>
                    if (vectorInst.size() >= 2 && vectorInst.at(vectorInst.size()-2).keyInst == "jle") {
                        string falseBr = " falseBr=" + address;
                        vectorInst.at(vectorInst.size()-2).printInst += falseBr;
                        vectorBranches.push_back(address);
                        ofs << falseBr << "\nblk " << current_inst.addressInst << ":";
                    }

                    // TODO: consider external call

                    // for (vector<InfoInst>::iterator vec_it=vectorInst.begin(); vec_it!=vectorInst.end(); ++vec_it) {
                    //     cout << "instruction: ";
                    //     cout << vec_it->keyInst << " / " << vec_it->addressInst << " / " << vec_it->opcodesInst
                    //          << " / " <<  vec_it->nextAddrInst.first << " / " << vec_it->nextAddrInst.second << endl;
                    // }

                    // print infos of the current instruction                   
                    // cout << "instruction: ";
                    // cout << current_inst.keyInst << " / " << current_inst.addressInst << " / " << current_inst.opcodesInst
                    //      << " / " <<  current_inst.nextAddrInst.first << " / " << current_inst.nextAddrInst.second << endl;
                    // cout << "=> " << current_inst.printInst << endl;

                    // write this line to the new objdump file
                    ofs << "\n" << func_line << blk_line << current_inst.printInst;   
                }
            }
        }
        // TODO: only consider main function. Need to find all existed functions
        mapFuncInst.insert(make_pair("main", vectorInst));

        // print all instructions which belongs to a function
        for (map<string, vector<InfoInst>>::iterator map_it=mapFuncInst.begin(); map_it!=mapFuncInst.end(); ++map_it) {
            cout << "FUNCTION: " << map_it->first << endl;
            for (vector<InfoInst>::iterator vec_it=map_it->second.begin(); vec_it!=map_it->second.end(); ++vec_it) {
                cout << "instruction: ";
                cout << vec_it->keyInst << " / " << vec_it->addressInst << " / " << vec_it->opcodesInst
                     << " / " <<  vec_it->nextAddrInst.first << " / " << vec_it->nextAddrInst.second << endl;
            }
        }

        // print address of branches
        // for (vector<string>::iterator vec_it=vectorBranches.begin(); vec_it!=vectorBranches.end(); ++vec_it) {
        //     cout << *vec_it << endl;
        // }

        // close file
        ofs << "\n";
        ifs.close();
    } else {
        cout << "Unable to open objdump input file";
        exit(-1);
    }  
}

int main(int argc, char **argv) {
    if (argc != 3) {
        cout << "Usage: ./objdump2CFG input_objdump_file root_function!" << endl;
        return -1;
    }

    string fileName(argv[1]);
    string rootFunc(argv[2]);
    objdump2CFG(fileName, rootFunc);

    return 0;
}