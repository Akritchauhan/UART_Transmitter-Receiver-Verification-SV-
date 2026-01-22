interface intf(input logic clk);
  logic start;
  logic [7:0]txin;
  logic tx;
  logic rx;
  logic [7:0] rxout;
  logic rxdone;
  logic txdone;
  
  modport DUT (
    input  clk, start, txin, rx,
    output tx, rxout, rxdone, txdone
  );

  modport TB (
    input  tx, rxout, rxdone, txdone,
    output start, txin, rx
  );
  
endinterface
