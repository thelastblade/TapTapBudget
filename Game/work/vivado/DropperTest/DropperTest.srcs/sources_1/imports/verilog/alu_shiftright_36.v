/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_shiftright_36 (
    input [15:0] a,
    input [3:0] b,
    input alufn1,
    output reg [15:0] q
  );
  
  
  
  wire [1-1:0] M_arithmeticmux_out;
  reg [1-1:0] M_arithmeticmux_a;
  reg [1-1:0] M_arithmeticmux_alufn1;
  alu_shiftright_mux_37 arithmeticmux (
    .a(M_arithmeticmux_a),
    .alufn1(M_arithmeticmux_alufn1),
    .out(M_arithmeticmux_out)
  );
  
  reg [15:0] w;
  
  reg [15:0] x;
  
  reg [15:0] y;
  
  reg p;
  
  always @* begin
    M_arithmeticmux_a = a[15+0-:1];
    M_arithmeticmux_alufn1 = alufn1;
    p = M_arithmeticmux_out;
    
    case (b[3+0-:1])
      1'h0: begin
        w = a;
      end
      1'h1: begin
        w[0+7-:8] = a[8+7-:8];
        w[8+7-:8] = {p, p, p, p, p, p, p, p};
      end
      default: begin
        w = a;
      end
    endcase
    
    case (b[2+0-:1])
      1'h0: begin
        x = w;
      end
      1'h1: begin
        x[0+11-:12] = w[4+11-:12];
        x[12+3-:4] = {p, p, p, p};
      end
      default: begin
        x = w;
      end
    endcase
    
    case (b[1+0-:1])
      1'h0: begin
        y = x;
      end
      1'h1: begin
        y[0+13-:14] = x[2+13-:14];
        y[14+1-:2] = {p, p};
      end
      default: begin
        y = x;
      end
    endcase
    
    case (b[0+0-:1])
      1'h0: begin
        q = y;
      end
      1'h1: begin
        q[0+14-:15] = y[1+14-:15];
        q[15+0-:1] = p;
      end
      default: begin
        q = y;
      end
    endcase
  end
endmodule
