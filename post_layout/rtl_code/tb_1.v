`timescale 1ns / 1ps

module tb_1;
    reg [3:0]a=0;
    reg [3:0]b=0;
    reg cin=0;
    wire [3:0]s;
    wire cout;
    
    
    cla_adder_4bit adr(.S(s),.Cout(cout),.A(a),.B(b),.Cin(cin));
    
    initial begin
    $dumpfile("tb_1.vcd");
    $dumpvars(0,tb_1);
    #150 $finish;
    end
    always #5 a=$random;
    always #10 b=$random;
    always #20 cin=$random;
endmodule
