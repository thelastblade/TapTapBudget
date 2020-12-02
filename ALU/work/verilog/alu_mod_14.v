/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_mod_14 (
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] q
  );
  
  
  
  wire [16-1:0] M_multiply_q;
  reg [16-1:0] M_multiply_a;
  reg [16-1:0] M_multiply_b;
  alu_mul_13 multiply (
    .a(M_multiply_a),
    .b(M_multiply_b),
    .q(M_multiply_q)
  );
  
  wire [16-1:0] M_adder_q;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [1-1:0] M_adder_alufn0;
  alu_adder_9 adder (
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn0(M_adder_alufn0),
    .q(M_adder_q),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  reg [15:0] floor;
  
  reg [15:0] mul;
  
  always @* begin
    q = 1'h0;
    floor = a / b;
    M_multiply_a = floor;
    M_multiply_b = b;
    mul = M_multiply_q;
    M_adder_a = a;
    M_adder_b = mul;
    M_adder_alufn0 = 1'h1;
    q = M_adder_q;
  end
endmodule
