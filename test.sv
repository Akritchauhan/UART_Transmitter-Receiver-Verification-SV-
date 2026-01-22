program test(intf intff);
  environment env;
  initial begin
    env = new(intff);
    env.test_run(); 
    wait(env.gen.ended.triggered);
    #5000000;
    $finish;
  end
endprogram
