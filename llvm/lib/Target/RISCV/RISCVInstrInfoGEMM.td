//===----------------------------------------------------------------------===//
// AMP extension.
//===----------------------------------------------------------------------===//

def GEMM : Instruction {
    bits<32> Inst;
    bits<32> SoftFail = 0;
    bits<4> rb;
    bits<4> rx;
    bits<4> ra;
    bits<4> ry;
    let Namespace = "RISCV";
    let Size = 4;
    let hasSideEffects = 1;
    let mayLoad = 0;
    let mayStore = 0;
    let Inst{31-28} = ry;
    let Inst{27-24} = ra;
    let Inst{23-20} = rx;
    let Inst{19-16} = rb;
    let Inst{15-7} = 0b000000000;
    let Inst{6-0} = 0b1110111; /*opcode*/
    dag OutOperandList = (outs );
    dag InOperandList = (ins GPR:$ry, GPR:$ra, GPR:$rx, GPR:$rb);
    let AsmString = "gemm\t$ry, $ra, $rx, $rb";
}

def : Pat<(int_riscv_gemm GPR:$ry, GPR:$ra, GPR:$rx, GPR:$rb), (GEMM GPR:$ry, GPR:$ra, GPR:$rx, GPR:$rb)>;
