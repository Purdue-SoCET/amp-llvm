//===----------------------------------------------------------------------===//
// AMP extension.
//===----------------------------------------------------------------------===//

def STOREMATRIX : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<4> stride;
    bits<4> rs1;
    bits<4> rd;
    bits<12> imm;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 1;
    let mayLoad = 1;
    let mayStore = 1;
    let Inst{31-28} = rd; 
    let Inst{27-24} = rs1;
    let Inst{23-20} = stride;
    let Inst{19} = 0b0;
    let Inst{18-7} = imm;
    let Inst{6-0} = 0b1010111; /*opcode*/
    dag OutOperandList = (outs );
    dag InOperandList = (ins GPR:$rd, GPR:$rs1, GPR:$stride, GPR:$imm);
    let AsmString = "factorial\t$rd, $rs1, $stride, $imm";
}

def : Pat<(int_riscv_storematrix GPR:$rsd, GPR:$rs1, GPR:$stride, simm12:$imm), (STOREMATRIX GPR:$rsd, GPR:$rs1, GPR:$stride, simm12:$imm)>;
