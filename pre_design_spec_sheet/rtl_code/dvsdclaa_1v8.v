`default_nettype none
module dvsdclaa_1v8(S,Cout,A,B,Cin);
    input wire [3:0]A,B;
    input wire Cin;
    wire [3:0]P,G,Car;
    output [3:0]S;
    output Cout;
    assign P = A^B;
    assign G = A&B;
    
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
