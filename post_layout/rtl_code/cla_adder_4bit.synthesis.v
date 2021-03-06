/* Generated by Yosys 0.9+4052 (git sha1 d061b0e, gcc 8.3.1 -fPIC -Os) */
`include "primitives.v"
`include "sky130_fd_sc_hd.v"
module cla_adder_4bit(S, Cout, A, B, Cin);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  input [3:0] A;
  input [3:0] B;
  input Cin;
  output Cout;
  output [3:0] S;
  sky130_fd_sc_hd__inv_2 _20_ (
    .A(B[3]),
    .Y(_00_)
  );
  sky130_fd_sc_hd__inv_2 _21_ (
    .A(A[3]),
    .Y(_01_)
  );
  sky130_fd_sc_hd__inv_2 _22_ (
    .A(B[1]),
    .Y(_02_)
  );
  sky130_fd_sc_hd__inv_2 _23_ (
    .A(A[1]),
    .Y(_03_)
  );
  sky130_fd_sc_hd__inv_2 _24_ (
    .A(Cin),
    .Y(_04_)
  );
  sky130_fd_sc_hd__nor2_2 _25_ (
    .A(B[0]),
    .B(A[0]),
    .Y(_05_)
  );
  sky130_fd_sc_hd__o2bb2a_4 _26_ (
    .A1_N(B[0]),
    .A2_N(A[0]),
    .B1(_04_),
    .B2(_05_),
    .X(_06_)
  );
  sky130_fd_sc_hd__a21o_2 _27_ (
    .A1(_02_),
    .A2(_03_),
    .B1(_06_),
    .X(_07_)
  );
  sky130_fd_sc_hd__inv_2 _28_ (
    .A(B[2]),
    .Y(_08_)
  );
  sky130_fd_sc_hd__inv_2 _29_ (
    .A(A[2]),
    .Y(_09_)
  );
  sky130_fd_sc_hd__o22a_2 _30_ (
    .A1(_08_),
    .A2(_09_),
    .B1(_02_),
    .B2(_03_),
    .X(_10_)
  );
  sky130_fd_sc_hd__or2_2 _31_ (
    .A(B[2]),
    .B(A[2]),
    .X(_11_)
  );
  sky130_fd_sc_hd__inv_2 _32_ (
    .A(_11_),
    .Y(_12_)
  );
  sky130_fd_sc_hd__a221o_2 _33_ (
    .A1(_00_),
    .A2(_01_),
    .B1(_07_),
    .B2(_10_),
    .C1(_12_),
    .X(_13_)
  );
  sky130_fd_sc_hd__o21ai_2 _34_ (
    .A1(_00_),
    .A2(_01_),
    .B1(_13_),
    .Y(Cout)
  );
  sky130_fd_sc_hd__a21oi_2 _35_ (
    .A1(B[0]),
    .A2(A[0]),
    .B1(_05_),
    .Y(_14_)
  );
  sky130_fd_sc_hd__o2bb2a_2 _36_ (
    .A1_N(Cin),
    .A2_N(_14_),
    .B1(Cin),
    .B2(_14_),
    .X(S[0])
  );
  sky130_fd_sc_hd__a22o_4 _37_ (
    .A1(_02_),
    .A2(_03_),
    .B1(B[1]),
    .B2(A[1]),
    .X(_15_)
  );
  sky130_fd_sc_hd__o2bb2a_2 _38_ (
    .A1_N(_06_),
    .A2_N(_15_),
    .B1(_06_),
    .B2(_15_),
    .X(S[1])
  );
  sky130_fd_sc_hd__o21ai_2 _39_ (
    .A1(_08_),
    .A2(_09_),
    .B1(_11_),
    .Y(_16_)
  );
  sky130_fd_sc_hd__o21a_2 _40_ (
    .A1(_02_),
    .A2(_03_),
    .B1(_07_),
    .X(_17_)
  );
  sky130_fd_sc_hd__a2bb2oi_2 _41_ (
    .A1_N(_16_),
    .A2_N(_17_),
    .B1(_16_),
    .B2(_17_),
    .Y(S[2])
  );
  sky130_fd_sc_hd__a22o_2 _42_ (
    .A1(B[3]),
    .A2(A[3]),
    .B1(_00_),
    .B2(_01_),
    .X(_18_)
  );
  sky130_fd_sc_hd__o32a_4 _43_ (
    .A1(_15_),
    .A2(_16_),
    .A3(_06_),
    .B1(_10_),
    .B2(_12_),
    .X(_19_)
  );
  sky130_fd_sc_hd__a2bb2oi_4 _44_ (
    .A1_N(_18_),
    .A2_N(_19_),
    .B1(_18_),
    .B2(_19_),
    .Y(S[3])
  );
endmodule
