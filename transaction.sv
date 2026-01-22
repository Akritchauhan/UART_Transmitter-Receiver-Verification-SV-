class transaction;
  rand bit start;
  rand bit [7:0] txin;
  rand bit rx;
  bit tx;
  bit [7:0] rxout;
  bit rxdone;
  bit txdone;

  function void display(string name);
    $display("-------------------------");
    $display("- %s", name);
    $display("-------------------------");
    $display("start: %b, txin: %h, rx: %b", start, txin, rx);
    $display("tx: %b, rxout: %h", tx, rxout);
    $display("txdone: %b, rxdone: %b", txdone, rxdone);
  endfunction
endclass
