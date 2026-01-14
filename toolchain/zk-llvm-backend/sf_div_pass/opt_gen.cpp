#include <iostream>
#include <vector>
#include <unordered_set>
#include "llvm/Bitcode/BitcodeReader.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Pass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Constants.h"
#include "llvm/Analysis/AliasAnalysis.h"
#define built_in_func_num  (19)

using namespace llvm;
using namespace std;

class EraserFunctionInstr: public FunctionPass{
protected:

	Function* UDIV;
	Function* SDIV;
	Function* UREM;
	Function* SREM;

	Function* UDIV64;
	Function* SDIV64;
	Function* UREM64;
	Function* SREM64;

public:
    static char ID;

    EraserFunctionInstr() : FunctionPass(ID) {

    }


    bool runOnFunction(Function &F) override {
        instrLockAccess(F);
		DeleteDR(F);
        return true;
    }


    bool doInitialization(Module &M) override {
        Module::FunctionListType& functionListType = M.getFunctionList();
        for(auto func = functionListType.begin(); func!=functionListType.end();func++){
            if(func->getName().contains("SFUDIV")){
                UDIV = M.getFunction(func->getName());
            }
            if(func->getName().contains("SFUREM")){
                UREM = M.getFunction(func->getName());
            }
            if(func->getName().contains("SFSDIV")){
                SDIV = M.getFunction(func->getName());
            }
            if(func->getName().contains("SFSREM")){
                SREM = M.getFunction(func->getName());
            }
            if(func->getName().contains("SF64UDIV")){
                UDIV64 = M.getFunction(func->getName());
            }
            if(func->getName().contains("SF64UREM")){
                UREM64 = M.getFunction(func->getName());
            }
            if(func->getName().contains("SF64SDIV")){
                SDIV64 = M.getFunction(func->getName());
            }
            if(func->getName().contains("SF64SREM")){
                SREM64 = M.getFunction(func->getName());
            }
        }
        return true;
    }
	
    void DeleteDR(Function& F){
		std::vector<Instruction*> trash;
		trash.empty();
        LLVMContext & llvmContext = F.getContext();
        for (auto bb = F.begin();bb != F.end();bb++) {
            for (auto inst = bb->begin(); inst != bb->end(); inst++) {
                if(auto I = dyn_cast<BinaryOperator>(inst)){
					if (I->getOpcode() == 19) {
						if (I->getType()->getIntegerBitWidth() == 64)
							trash.push_back(I);
					} else if (I->getOpcode() == 20) {
						trash.push_back(I);
					} else if (I->getOpcode() == 22) {
						if (I->getType()->getIntegerBitWidth() == 64)
							trash.push_back(I);
					} else if (I->getOpcode() == 23) {
						trash.push_back(I);
					}
                }
            }
        }
		for (int i = 0; i < trash.size(); i++) trash[i]->eraseFromParent();
    }

    void instrLockAccess(Function& F){
        LLVMContext & llvmContext = F.getContext();
        for (auto bb = F.begin();bb != F.end();bb++) {
            for (auto inst = bb->begin(); inst != bb->end(); inst++) {
                if(auto I = dyn_cast<BinaryOperator>(inst)){
					bool check = 0;
					if (I->getOpcode() == 19) {
						// udiv
						std::cout << "UDIV!!" << std::endl;
						Value * argArr[2] = {I->getOperand(0), I->getOperand(1)};
						ArrayRef<Value*> args(argArr);
						if (I->getType()->getIntegerBitWidth() == 32)
						{
							// CallInst* tmp = CallInst::Create(UDIV, args, "", I);
							// I->replaceAllUsesWith(tmp);
						}
						else
						{
							CallInst* tmp = CallInst::Create(UDIV64, args, "", I);
							I->replaceAllUsesWith(tmp);
						}
					} else if (I->getOpcode() == 20) {
						// sdiv
						std::cout << "SDIV!!" << std::endl;
						Value * argArr[2] = {I->getOperand(0), I->getOperand(1)};
						ArrayRef<Value*> args(argArr);
						if (I->getType()->getIntegerBitWidth() == 32)
						{
							std::cout << "32" << std::endl;
							CallInst* tmp = CallInst::Create(SDIV, args, "", I);
							I->replaceAllUsesWith(tmp);
						}
						else
						{
							CallInst* tmp = CallInst::Create(SDIV64, args, "", I);
							I->replaceAllUsesWith(tmp);
						}
					} else if (I->getOpcode() == 22) {
						// urem
						std::cout << "UREM!!" << std::endl;
						Value * argArr[2] = {I->getOperand(0), I->getOperand(1)};
						ArrayRef<Value*> args(argArr);
						if (I->getType()->getIntegerBitWidth() == 32)
						{
							// CallInst* tmp = CallInst::Create(UREM, args, "", I);
							// I->replaceAllUsesWith(tmp);
						}
						else
						{
							CallInst* tmp = CallInst::Create(UREM64, args, "", I);
							I->replaceAllUsesWith(tmp);
						}							
					} else if (I->getOpcode() == 23) {
						// srem
						std::cout << "SREM!!" << std::endl;
						Value * argArr[2] = {I->getOperand(0), I->getOperand(1)};
						ArrayRef<Value*> args(argArr);
						if (I->getType()->getIntegerBitWidth() == 32)
						{
							CallInst* tmp = CallInst::Create(SREM, args, "", I);
							I->replaceAllUsesWith(tmp);
						}
						else
						{
							CallInst* tmp = CallInst::Create(SREM64, args, "", I);
							I->replaceAllUsesWith(tmp);
						}							
					}
                }
            }
        }
    }
};

char EraserFunctionInstr::ID = 0;
static cl::opt<string> InputFilename("lib_file", cl::desc("Specify input filename for mypass"), cl::value_desc("filename"));
static RegisterPass<EraserFunctionInstr> X("eraser", "Do Instr",
                                           false /* Only looks at CFG */,
                                           false /* Analysis Pass */);
