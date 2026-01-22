class driver;
  virtual intf vif;
  mailbox #(transaction) gen2drv;

  function new(virtual intf vif, mailbox #(transaction) gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction

  task main();
  vif.start <= 1'b0;
  forever begin 
    transaction trans;
    gen2drv.get(trans);
    
    @(posedge vif.clk);
    vif.start <= 1'b1; 
    vif.txin  <= trans.txin;

    @(posedge vif.clk);
    vif.start <= 1'b0; 
    wait(vif.txdone == 1'b1);
    @(posedge vif.clk);
  end
endtask
endclass
