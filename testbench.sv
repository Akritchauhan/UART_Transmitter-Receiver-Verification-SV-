`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module testbench();
  logic clk;
  initial clk = 0;
  always #5000 clk = ~clk; 
  intf intff(clk);
  test tst(intff);
  uart_dut dut(
    .clk(intff.clk),
    .start(intff.start),
    .txin(intff.txin),
    .tx(intff.tx),
    .rx(intff.rx),
    .rxout(intff.rxout),
    .rxdone(intff.rxdone),
    .txdone(intff.txdone)
  );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
