/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module main_fsm_6 (
    input clk,
    input rst,
    input [15:0] rd2,
    input next,
    output reg [1:0] asel,
    output reg [2:0] bsel,
    output reg [5:0] alufn,
    output reg stu,
    output reg we,
    output reg [3:0] ra,
    output reg [3:0] rb,
    output reg [3:0] rc,
    output reg [5:0] state_index
  );
  
  
  
  localparam IDLE_state = 6'd0;
  localparam INITLIFE_state = 6'd1;
  localparam INCREASECOUNT_state = 6'd2;
  localparam SHIFTBLOCK1_state = 6'd3;
  localparam SHIFTBLOCK2_state = 6'd4;
  localparam SHIFTBLOCK3_state = 6'd5;
  localparam SHIFTBLOCK4_state = 6'd6;
  localparam RANDCOL_state = 6'd7;
  localparam CHECKCOL_state = 6'd8;
  localparam BRANCHCOL_state = 6'd9;
  localparam RANDCOLOUR_state = 6'd10;
  localparam CHECKCOLOUR_state = 6'd11;
  localparam BRANCHCOLOUR_state = 6'd12;
  localparam STORERED_state = 6'd13;
  localparam STOREBLUE_state = 6'd14;
  localparam FINDCOL_state = 6'd15;
  localparam ADDCOL1_state = 6'd16;
  localparam ADDCOL2_state = 6'd17;
  localparam ADDCOL3_state = 6'd18;
  localparam ADDCOL4_state = 6'd19;
  localparam STORECOL1_state = 6'd20;
  localparam STORECOL2_state = 6'd21;
  localparam STORECOL3_state = 6'd22;
  localparam STORECOL4_state = 6'd23;
  localparam CHECKEMPTYROW_state = 6'd24;
  localparam BRANCHEMPTYROW_state = 6'd25;
  localparam CHECKPLAYERPOS_state = 6'd26;
  localparam BRANCHSCORE_state = 6'd27;
  localparam CHECKCOMBO_state = 6'd28;
  localparam BRANCHCOMBO_state = 6'd29;
  localparam ADDCOMBO_state = 6'd30;
  localparam MULCOMBO_state = 6'd31;
  localparam ADDSCORE_state = 6'd32;
  localparam RESETCOMBO_state = 6'd33;
  localparam MINUSHEALTH_state = 6'd34;
  localparam CHECKHEALTH_state = 6'd35;
  localparam BRANCHHEALTH_state = 6'd36;
  localparam COUNTERMOD_state = 6'd37;
  localparam CHECKMOD_state = 6'd38;
  localparam BRANCHMOD_state = 6'd39;
  localparam INCREASECLK_state = 6'd40;
  localparam CLKHOLD_state = 6'd41;
  localparam END_state = 6'd42;
  
  reg [5:0] M_state_d, M_state_q = IDLE_state;
  wire [1-1:0] M_slowClock_value;
  counter_20 slowClock (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock_value)
  );
  wire [1-1:0] M_slowClock1_value;
  counter_21 slowClock1 (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock1_value)
  );
  wire [1-1:0] M_slowClock2_value;
  counter_22 slowClock2 (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock2_value)
  );
  wire [1-1:0] M_slowClock3_value;
  counter_23 slowClock3 (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock3_value)
  );
  wire [1-1:0] M_slowClock4_value;
  counter_24 slowClock4 (
    .clk(clk),
    .rst(rst),
    .value(M_slowClock4_value)
  );
  wire [1-1:0] M_slowClockEdge_out;
  reg [1-1:0] M_slowClockEdge_in;
  edge_detector_12 slowClockEdge (
    .clk(clk),
    .in(M_slowClockEdge_in),
    .out(M_slowClockEdge_out)
  );
  wire [1-1:0] M_slowClockEdge1_out;
  reg [1-1:0] M_slowClockEdge1_in;
  edge_detector_12 slowClockEdge1 (
    .clk(clk),
    .in(M_slowClockEdge1_in),
    .out(M_slowClockEdge1_out)
  );
  wire [1-1:0] M_slowClockEdge2_out;
  reg [1-1:0] M_slowClockEdge2_in;
  edge_detector_12 slowClockEdge2 (
    .clk(clk),
    .in(M_slowClockEdge2_in),
    .out(M_slowClockEdge2_out)
  );
  wire [1-1:0] M_slowClockEdge3_out;
  reg [1-1:0] M_slowClockEdge3_in;
  edge_detector_12 slowClockEdge3 (
    .clk(clk),
    .in(M_slowClockEdge3_in),
    .out(M_slowClockEdge3_out)
  );
  wire [1-1:0] M_slowClockEdge4_out;
  reg [1-1:0] M_slowClockEdge4_in;
  edge_detector_12 slowClockEdge4 (
    .clk(clk),
    .in(M_slowClockEdge4_in),
    .out(M_slowClockEdge4_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    
    M_slowClockEdge_in = M_slowClock_value;
    M_slowClockEdge1_in = M_slowClock1_value;
    M_slowClockEdge2_in = M_slowClock2_value;
    M_slowClockEdge3_in = M_slowClock3_value;
    M_slowClockEdge4_in = M_slowClock4_value;
    asel = 2'h0;
    bsel = 3'h0;
    stu = 1'h0;
    we = 1'h0;
    ra = 4'h0;
    rb = 4'h0;
    rc = 4'h0;
    alufn = 6'h00;
    state_index = 1'h0;
    
    case (M_state_q)
      IDLE_state: begin
        state_index = 1'h1;
        if (next) begin
          M_state_d = INITLIFE_state;
        end else begin
          M_state_d = IDLE_state;
        end
      end
      INITLIFE_state: begin
        state_index = 2'h2;
        alufn = 6'h00;
        ra = 4'h6;
        rc = 4'h6;
        asel = 2'h0;
        bsel = 3'h3;
        we = 1'h1;
        M_state_d = INCREASECOUNT_state;
      end
      INCREASECOUNT_state: begin
        state_index = 2'h3;
        alufn = 6'h00;
        ra = 4'h7;
        rc = 4'h7;
        asel = 2'h0;
        bsel = 3'h1;
        we = 1'h1;
        M_state_d = SHIFTBLOCK1_state;
      end
      SHIFTBLOCK1_state: begin
        state_index = 3'h4;
        alufn = 6'h20;
        ra = 4'h0;
        rc = 4'h0;
        asel = 2'h0;
        bsel = 3'h2;
        we = 1'h1;
        M_state_d = SHIFTBLOCK2_state;
      end
      SHIFTBLOCK2_state: begin
        state_index = 3'h5;
        alufn = 6'h20;
        ra = 4'h1;
        rc = 4'h1;
        asel = 2'h0;
        bsel = 3'h2;
        we = 1'h1;
        M_state_d = SHIFTBLOCK3_state;
      end
      SHIFTBLOCK3_state: begin
        state_index = 3'h6;
        alufn = 6'h20;
        ra = 4'h2;
        rc = 4'h2;
        asel = 2'h0;
        bsel = 3'h2;
        we = 1'h1;
        M_state_d = SHIFTBLOCK4_state;
      end
      SHIFTBLOCK4_state: begin
        state_index = 3'h7;
        alufn = 6'h20;
        ra = 4'h3;
        rc = 4'h3;
        asel = 2'h0;
        bsel = 3'h2;
        we = 1'h1;
        M_state_d = RANDCOLOUR_state;
      end
      RANDCOLOUR_state: begin
        state_index = 4'hb;
        alufn = 6'h1a;
        asel = 2'h3;
        rc = 4'ha;
        we = 1'h1;
        M_state_d = RANDCOL_state;
      end
      RANDCOL_state: begin
        state_index = 4'h8;
        alufn = 6'h1c;
        rc = 4'h9;
        bsel = 3'h6;
        we = 1'h1;
        M_state_d = CHECKCOL_state;
      end
      CHECKCOL_state: begin
        state_index = 4'h9;
        alufn = 6'h37;
        ra = 4'h9;
        rc = 4'hb;
        asel = 2'h0;
        bsel = 3'h3;
        we = 1'h1;
        M_state_d = BRANCHCOL_state;
      end
      BRANCHCOL_state: begin
        state_index = 4'ha;
        rb = 4'hb;
        if (rd2 == 16'h0001) begin
          M_state_d = BRANCHCOLOUR_state;
        end else begin
          M_state_d = STORECOL1_state;
        end
      end
      BRANCHCOLOUR_state: begin
        state_index = 4'hc;
        rb = 4'ha;
        if (rd2 == 1'h1) begin
          M_state_d = STOREBLUE_state;
        end else begin
          M_state_d = STORERED_state;
        end
      end
      STORERED_state: begin
        state_index = 4'hd;
        alufn = 6'h1c;
        bsel = 3'h2;
        rc = 4'ha;
        we = 1'h1;
        M_state_d = FINDCOL_state;
      end
      STOREBLUE_state: begin
        state_index = 4'he;
        alufn = 6'h1c;
        bsel = 3'h1;
        rc = 4'ha;
        we = 1'h1;
        M_state_d = FINDCOL_state;
      end
      FINDCOL_state: begin
        state_index = 4'hf;
        rb = 4'h9;
        we = 1'h0;
        if (rd2 == 16'h0000) begin
          M_state_d = ADDCOL1_state;
        end else begin
          if (rd2 == 16'h0001) begin
            M_state_d = ADDCOL2_state;
          end else begin
            if (rd2 == 16'h0002) begin
              M_state_d = ADDCOL3_state;
            end else begin
              if (rd2 == 16'h0003) begin
                M_state_d = ADDCOL4_state;
              end
            end
          end
        end
      end
      ADDCOL1_state: begin
        state_index = 5'h10;
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 3'h0;
        rb = 4'ha;
        rc = 4'h0;
        ra = 4'h0;
        we = 1'h1;
        M_state_d = STORECOL1_state;
      end
      ADDCOL2_state: begin
        state_index = 5'h11;
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 3'h0;
        rb = 4'ha;
        rc = 4'h1;
        ra = 4'h1;
        we = 1'h1;
        M_state_d = STORECOL1_state;
      end
      ADDCOL3_state: begin
        state_index = 5'h12;
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 3'h0;
        rb = 4'ha;
        rc = 4'h2;
        ra = 4'h2;
        we = 1'h1;
        M_state_d = STORECOL1_state;
      end
      ADDCOL4_state: begin
        state_index = 5'h13;
        alufn = 6'h00;
        asel = 2'h0;
        bsel = 3'h0;
        rb = 4'ha;
        rc = 4'h3;
        ra = 4'h3;
        we = 1'h1;
        M_state_d = STORECOL1_state;
      end
      STORECOL1_state: begin
        state_index = 5'h14;
        alufn = 6'h38;
        asel = 2'h0;
        bsel = 3'h4;
        ra = 4'h0;
        rc = 4'h8;
        we = 1'h1;
        M_state_d = STORECOL2_state;
      end
      STORECOL2_state: begin
        state_index = 5'h15;
        alufn = 6'h39;
        asel = 2'h0;
        bsel = 3'h0;
        ra = 4'h1;
        rb = 4'h8;
        rc = 4'h8;
        we = 1'h1;
        M_state_d = STORECOL3_state;
      end
      STORECOL3_state: begin
        state_index = 5'h16;
        alufn = 6'h3a;
        asel = 2'h0;
        bsel = 3'h0;
        ra = 4'h2;
        rb = 4'h8;
        rc = 4'h8;
        we = 1'h1;
        M_state_d = STORECOL4_state;
      end
      STORECOL4_state: begin
        state_index = 5'h17;
        alufn = 6'h3b;
        asel = 2'h0;
        bsel = 3'h0;
        ra = 4'h3;
        rb = 4'h8;
        rc = 4'h8;
        we = 1'h1;
        M_state_d = CHECKEMPTYROW_state;
      end
      CHECKEMPTYROW_state: begin
        state_index = 5'h18;
        alufn = 6'h33;
        ra = 4'h8;
        rc = 4'hb;
        asel = 2'h0;
        bsel = 3'h4;
        we = 1'h1;
        M_state_d = BRANCHEMPTYROW_state;
      end
      BRANCHEMPTYROW_state: begin
        state_index = 5'h19;
        rb = 4'hb;
        we = 1'h0;
        if (rd2 == 16'h0001) begin
          M_state_d = CLKHOLD_state;
        end else begin
          M_state_d = CHECKPLAYERPOS_state;
        end
      end
      CHECKPLAYERPOS_state: begin
        state_index = 5'h1a;
        alufn = 6'h33;
        ra = 4'h8;
        rc = 4'hc;
        asel = 2'h0;
        bsel = 3'h5;
        we = 1'h1;
        M_state_d = BRANCHSCORE_state;
      end
      BRANCHSCORE_state: begin
        state_index = 5'h1b;
        rb = 4'hc;
        we = 1'h0;
        if (rd2 == 16'h0001) begin
          M_state_d = CHECKCOMBO_state;
        end else begin
          M_state_d = RESETCOMBO_state;
        end
      end
      CHECKCOMBO_state: begin
        state_index = 5'h1c;
        alufn = 6'h35;
        ra = 4'h4;
        rc = 4'hc;
        asel = 2'h0;
        bsel = 3'h3;
        we = 1'h1;
        M_state_d = BRANCHCOMBO_state;
      end
      BRANCHCOMBO_state: begin
        state_index = 5'h1d;
        rb = 4'hc;
        we = 1'h0;
        if (rd2 == 1'h0) begin
          M_state_d = MULCOMBO_state;
        end else begin
          M_state_d = ADDCOMBO_state;
        end
      end
      ADDCOMBO_state: begin
        state_index = 5'h1e;
        alufn = 6'h00;
        ra = 4'h4;
        rc = 4'h4;
        asel = 2'h0;
        bsel = 3'h1;
        we = 1'h1;
        M_state_d = MULCOMBO_state;
      end
      MULCOMBO_state: begin
        state_index = 5'h1f;
        alufn = 6'h22;
        ra = 4'h4;
        rc = 4'hd;
        asel = 2'h0;
        bsel = 3'h3;
        we = 1'h1;
        M_state_d = ADDSCORE_state;
      end
      ADDSCORE_state: begin
        state_index = 6'h20;
        alufn = 6'h00;
        ra = 4'hd;
        rb = 4'h5;
        rc = 4'h5;
        asel = 2'h0;
        bsel = 3'h0;
        we = 1'h1;
        M_state_d = CLKHOLD_state;
      end
      RESETCOMBO_state: begin
        state_index = 6'h21;
        alufn = 6'h00;
        ra = 4'h0;
        rc = 4'h4;
        asel = 2'h2;
        bsel = 3'h4;
        we = 1'h1;
        M_state_d = MINUSHEALTH_state;
      end
      MINUSHEALTH_state: begin
        state_index = 6'h22;
        alufn = 6'h01;
        ra = 4'h6;
        rc = 4'h6;
        asel = 2'h0;
        bsel = 3'h1;
        we = 1'h1;
        M_state_d = CHECKHEALTH_state;
      end
      CHECKHEALTH_state: begin
        state_index = 6'h23;
        alufn = 6'h33;
        ra = 4'h6;
        rc = 4'hd;
        asel = 2'h0;
        bsel = 3'h4;
        we = 1'h1;
        M_state_d = BRANCHHEALTH_state;
      end
      BRANCHHEALTH_state: begin
        state_index = 6'h24;
        rb = 4'hd;
        we = 1'h0;
        if (rd2 == 16'h0001) begin
          M_state_d = END_state;
        end else begin
          M_state_d = CLKHOLD_state;
        end
      end
      CLKHOLD_state: begin
        rb = 4'h7;
        if (rd2 < 5'h14) begin
          if (M_slowClockEdge_out) begin
            M_state_d = INCREASECOUNT_state;
          end else begin
            M_state_d = CLKHOLD_state;
          end
        end else begin
          if (rd2 < 8'ha0) begin
            if (M_slowClockEdge1_out) begin
              M_state_d = INCREASECOUNT_state;
            end else begin
              M_state_d = CLKHOLD_state;
            end
          end else begin
            if (rd2 < 9'h1f4) begin
              if (M_slowClockEdge2_out) begin
                M_state_d = INCREASECOUNT_state;
              end else begin
                M_state_d = CLKHOLD_state;
              end
            end else begin
              if (rd2 < 11'h5dc) begin
                if (M_slowClockEdge3_out) begin
                  M_state_d = INCREASECOUNT_state;
                end else begin
                  M_state_d = CLKHOLD_state;
                end
              end else begin
                if (M_slowClockEdge4_out) begin
                  M_state_d = INCREASECOUNT_state;
                end else begin
                  M_state_d = CLKHOLD_state;
                end
              end
            end
          end
        end
      end
      END_state: begin
        state_index = 6'h2a;
        M_state_d = END_state;
      end
      default: begin
        M_state_d = IDLE_state;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
