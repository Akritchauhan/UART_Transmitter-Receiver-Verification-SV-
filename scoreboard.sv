class scoreboard;
  mailbox #(transaction) mon2scb;
  
  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    transaction trans;
    forever begin
      mon2scb.get(trans);
      if (trans.txin == trans.rxout)
        $display("[SCB] PASS: %h == %h", trans.txin, trans.rxout);
      else
        $display("[SCB] FAIL: Exp %h, Got %h", trans.txin, trans.rxout);
    end
  endtask
endclass
