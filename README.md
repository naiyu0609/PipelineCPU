# PipelineCPU
NTUST Computer Architecture

### Part1: R-Format

Instr[0]=>$t0($8)=358=$t1(179)+$t1(179)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/R-format-1.PNG)

Instr[1]=>$t1($9)=24=$t2(101)-$t4(77)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/R-format-2.PNG)

Instr[2]=>$t4($12)=80=$t5(320)/4
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/R-format-3.PNG)

Instr[3]=>$t6($14)=2432=$t6(152)*16
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/R-format-4.PNG)

Instr[4]=>$t3($11)=125(01111101)=$t1(00011000)XOR$t2(01100101)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/R-format-5.PNG)

Instr[5]=>$t5($13)=64(01000000)=$t4(01010000)AND$t2(01100101)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/R-format-6.PNG)

### Part2: LW、 SW

Instr[6]=>{Memdata[12],Memdata[13],Memdata[14],Memdata[15]}={8’d0,8’d0,8’b00000001,8’b01100110}(358)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/LWSW-1.PNG)

Instr[7]=>$s3($19)={Memdata[12],Memdata[13],Memdata[14],Memdata[15]}
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/LWSW-2.PNG)

Instr[8]=> {Memdata[14],Memdata[15],Memdata[16],Memdata[17]}={8’d0,8’d0,8’d0,8’b00000010}(2)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/LWSW-3.PNG)

Instr[9]=> {Memdata[103],Memdata[104],Memdata[105],Memdata[106]}={8’d0,8’d0,8’b00000001,8’b01100110}(358)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/LWSW-4.PNG)

Instr[10]=>$s4($20)={Memdata[104],Memdata[105],Memdata[106],Memdata[107]
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/LWSW-5.PNG)

### Part2: Forwarding & Hazard

Instr[11]=>$t6($14)=358=$t5(64)+$t4(80)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/Forwarding%26Hazard-1.PNG)

Instr[12]=>$t7($15)=24=$t6(144)-$t5(64)
這 部 分 會 產 生 一 個 hazard 因 為 前 一 個 值 還 沒 存 進 去 所 以 要 利 用 forwarding 做 處 理
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/Forwarding%26Hazard-2.PNG)

Instr[13]=> $t3($14)=224=$t6(144)+$t7(80)
這 部 分 一 樣 會 產 生 hazard 也 是 因 為 值 還 沒 存 進 去 所 產 生 的
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/Forwarding%26Hazard-3.PNG)

Instr[14]=>$s1($17)={Memdata[103],Memdata[104],Memdata[105],Memdata[106]
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/Forwarding%26Hazard-4.PNG)

Instr[15]=> {Memdata[66],Memdata[67],Memdata[68],Memdata[69]}={8’d0,8’d0,8’b00000001,8’b01100110}(358)
這 部 分 會 產 生 一 個 hazard 也 是 可 以 利用 forwarding 去 做 處 理， 但 是 要 注 意 的 是 這 次 hazard 比 較 特 別， 所 以 會 有 stall
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/Forwarding%26Hazard-5.PNG)

Instr[16]=>$t1($9)={Memdata[66],Memdata[67],Memdata[68],Memdata[69]}
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/Forwarding%26Hazard-6.PNG)

Instr[17]=>$t2($10)=716=$t1(358)+$t1(358)
![](https://github.com/naiyu0609/PipelineCPU/blob/main/Pipeline-CPU/Forwarding%26Hazard-7.PNG)
