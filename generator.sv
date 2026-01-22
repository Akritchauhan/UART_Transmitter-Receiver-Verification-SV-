class generator;
  transaction trans;
  mailbox #(transaction) gen2drv;
  event ended;

  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv; 
  endfunction
  
  task main();
    repeat(3) begin
      trans = new();
      if (!trans.randomize()) $fatal(1); 
      gen2drv.put(trans);
    end
    -> ended;
  endtask
endclass
