`default_nettype none
module dvsdclaa_1v8(S,Cout,A,B,Cin);
    input wire [3:0]A,B;
    input wire Cin;
    wire [3:0]P,G,Car;
    output [3:0]S;
    output Cout;
    assign P[0]=A[0]^B[0];
    assign P[1]=A[1]^B[1];
    assign P[2]=A[2]^B[2];
    assign P[3]=A[3]^B[3];
    assign G[0]=A[0]&B[0];
    assign G[1]=A[1]&B[1];
    assign G[2]=A[2]&B[2];
    assign G[3]=A[3]&B[3];
    
    assign Car[0]= G[0] || (P[0]&Cin);
    assign Car[1]= G[1] || (P[1]&G[0]) || (P[1]&P[0]&Cin); 
    assign Car[2]= G[2] || (P[2]&G[1]) || (P[1]&P[2]&G[0]) || (P[2]&P[1]&P[0]&Cin); 
    assign Car[3]= G[3] || (P[3]&G[2]) || (P[3]&P[2]&G[1]) || (P[3]&P[2]&P[1]&G[0]) || (P[3]&P[2]&P[1]&P[0]&Cin);

    assign S[0]=P[0]^Cin;
    assign S[1]=P[1]^Car[0];
    assign S[2]=P[2]^Car[1];
    assign S[3]=P[3]^Car[2];
    assign Cout = Car[3];
endmodule
