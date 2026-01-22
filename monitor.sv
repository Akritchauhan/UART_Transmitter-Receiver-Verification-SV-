class monitor;
  virtual intf vif;
  mailbox #(transaction) mon2scb;

  function new(virtual intf vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction

  task main(); 
    forever begin
      transaction trans = new();
      @(posedge vif.clk);
      wait(vif.txdone == 1'b1);
      @(posedge vif.clk);
      trans.txin   = vif.txin;
      trans.rxout  = vif.rxout;
      trans.txdone = vif.txdone;
      trans.rxdone = vif.rxdone;
      mon2scb.put(trans);
      wait(vif.txdone == 1'b0);
    end
  endtask
endclass
