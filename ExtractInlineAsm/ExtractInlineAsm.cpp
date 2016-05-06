//===- InlineAsm.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "Hello World" pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "ExtractInlineAsm"
#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h" 
#include <vector>
#include <string>
#include <iostream>
using namespace llvm;
using namespace std;

namespace {
    struct ExtractInlineAsm : public ModulePass {
        static char ID; // Pass identification, replacement for typeid
        ExtractInlineAsm() : ModulePass(ID) {}

        virtual bool runOnModule(Module &mod) {
            LLVMContext& m_context = getGlobalContext();
            
            FunctionType *functype_sum = FunctionType::get(IntegerType::get(m_context, 64), std::vector<llvm::Type*>(6, IntegerType::get(m_context, 64)), false); 
            Function *func_sum = Function::Create(functype_sum, Function::PrivateLinkage, "manh_dung", &mod);
            BasicBlock *basicBlock = BasicBlock::Create(m_context, "entry", func_sum);
            IRBuilder<> builder(basicBlock);
            builder.SetInsertPoint(basicBlock);
            // AllocaInst* ptr_input_addr = new AllocaInst(IntegerType::get(m_context, 32), "retVal", basicBlock);
            // ptr_input_addr->setAlignment(4);
            // StoreInst* void_15 = new StoreInst(int32_input, ptr_input_addr, false, basicBlock);
            // void_15->setAlignment(4);
            // LoadInst* int32_16 = new LoadInst(ptr_input_addr, "", false, basicBlock);
            // int32_16->setAlignment(4);
            // Value *two = ConstantInt::get(Type::getInt32Ty(m_context), 2);
            // Value *three = ConstantInt::get(Type::getInt32Ty(m_context), 3);
            // Instruction *add = BinaryOperator::Create(Instruction::Add, two, three, "retVal");
            // basicBlock->getInstList().push_back(add);
            // basicBlock->getInstList().push_back(mod.getFunction("main")->begin()->getTerminator());
            // ReturnInst::Create(m_context, BasicBlock);
            builder.CreateRet(ConstantInt::get(IntegerType::get(m_context, 64), 0));
            // basicBlock->getInstList().push_back(ret);

            Function *func_main = mod.getFunction("main");
            // errs() << "func_main: " << *func_main << "\n";
            // errs() << "func_sum: " << *func_sum << "\n";
            // for(Module::iterator func_main = mod.begin(), fe = mod.end(); func_main != fe; ++func_main) {
                // for(Function::iterator bb = func_main->begin(), be = func_main->end(); bb != be; ++bb) {
                //     // bb->getInstList().pop_back();
                //     Value *two = ConstantInt::get(Type::getInt32Ty(m_context), 2);
                //     Value *three = ConstantInt::get(Type::getInt32Ty(m_context), 3);
                //     Instruction *add = BinaryOperator::Create(Instruction::Add, two, three, "retval");
                //     bb->getInstList().insert(bb->getTerminator(), add);
                //     errs() << "bb: " << *bb << "\n";
                //     for(BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                //         errs() << "instruction: " << *i << "\n";
                //     }
                // }
            // }
            // vector<Instruction*> listInst;
            // for(Function::iterator bb = func_main->begin(), be = func_main->end(); bb != be; ++bb) {
            //     for(BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
            //         listInst.push_back(*i);
            //     }
            // }

            for(Function::iterator bb = func_main->begin(), be = func_main->end(); bb != be; ++bb) {
                TerminatorInst *terminator_inst = bb->getTerminator();
                errs() << "terminator_inst:" << *terminator_inst << "\n";
                Value *param1 = nullptr;
                Value *param2 = nullptr;
                // Value *param3 = nullptr;
                // Value *param4 = nullptr;
                // Value *param5 = nullptr;
                // Value *param6 = nullptr;
                CallInst *ci_asm = nullptr;
                for(BasicBlock::iterator i = bb->begin(), e = bb->end(); i != e; ++i) {
                    // if (isa<AllocaInst>(i) && i->getName() == "ret") {
                    //     i->eraseFromParent();
                    // }
                    if (isa<CallInst>(i)) {
                        ci_asm = dyn_cast<CallInst>(i);
                        if (ci_asm->isInlineAsm()){
                            errs() << "inline asm function: " << *ci_asm << "\n";
                            errs() << "getNumArgOperands: " << ci_asm->getNumArgOperands() << "\n";
                            param1 = ci_asm->getArgOperand(0);
                            errs() << "param1: " << *param1 << "\n";
                            param2 = ci_asm->getArgOperand(1);
                            errs() << "param2: " << *param2 << "\n";
                            Value *calledValue = ci_asm->getCalledValue();
                            errs() << "calledValue: " << *calledValue << "\n";
                            InlineAsm *iasm = dyn_cast<InlineAsm>(calledValue);

                            errs() << "getAsmString : " << iasm->getAsmString() << "\n";
                            errs() << "hasSideEffects : " << iasm->hasSideEffects() << "\n";
                            errs() << "getConstraintString : " << iasm->getConstraintString() << "\n";

                            InlineAsm::ConstraintInfoVector constraintInfo = iasm->ParseConstraints();
                            for(vector<InlineAsm::ConstraintInfo>::iterator vi = constraintInfo.begin(); vi != constraintInfo.end(); ++vi) {
                                // ConstraintPrefix: isInput: 0, isOutput: 1, isClobber: 2
                                errs() << "Type: " << vi->Type << "\n";
                                // errs() << "MatchingInput: " << vi->MatchingInput << "\n";
                                InlineAsm::ConstraintCodeVector codes = vi->Codes;
                                for(vector<string>::iterator vicode = codes.begin(); vicode != codes.end(); ++vicode) {
                                    errs() << "Codes: " << *vicode << "\n";
                                }
                            }
                        }
                    }
                }

                // AllocaInst* alloca_param3 = new AllocaInst(IntegerType::get(m_context, 64), "param3");
                // alloca_param3->setAlignment(8);  
                std::vector<Value*> lifted_params;
                lifted_params.push_back(param1);
                lifted_params.push_back(param2);
                lifted_params.push_back(param1);
                lifted_params.push_back(param1);
                lifted_params.push_back(param1);
                lifted_params.push_back(param1);
                // AllocaInst* alloca_retSum = new AllocaInst(IntegerType::get(m_context, 32), "retSum", bb);
                // alloca_retSum->setAlignment(4);   
                // errs() << "alloca_retSum:" << *alloca_retSum << "\n"; 
                // LoadInst* load_retSum = new LoadInst(alloca_retSum, "", false, bb);
                // load_retSum->setAlignment(4);
                // errs() << "load_retSum:" << *load_retSum << "\n"; 
                CallInst *newCall = CallInst::Create(func_sum, lifted_params, "aaa");
                errs() << "new call:" << *newCall << "\n";
                errs() << "name:" << ci_asm->getName() << "\n";
                // StoreInst* store_retSum = new StoreInst(newCall, alloca_retSum, false, bb);
                // store_retSum->setAlignment(4);
                // errs() << "store_retSum:" << *store_retSum << "\n";
                // // bb->getInstList().push_back(alloca_retSum);
                // // bb->getInstList().push_back(load_retSum);
                // // bb->getInstList().push_back(newCall);
                // // bb->getInstList().push_back(store_retSum);
                // IRBuilder<> bb_builder(bb);
                // bb_builder.CreateRet(ConstantInt::get(IntegerType::get(m_context, 32), 0));
                // bb->getInstList().push_back(terminator_inst);
                BasicBlock::iterator ii(ci_asm);
                ReplaceInstWithInst(bb->getInstList(), ii, newCall);
            }
            return true;
        }   
    };
}

char ExtractInlineAsm::ID = 0;
static RegisterPass<ExtractInlineAsm> X("extractinlineasm", "ExtractInlineAsm Pass");