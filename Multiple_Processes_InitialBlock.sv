module sample;

  int data1,data2; // data1: Adding random value
                   // data2: Will be taking the value of data1
  
  int i = 0;
  event done;
  
  // Simple Generator: Simply sends data and doesnt control when to stop the simulation
  initial begin
  // Assume user has requested to add 10 different stimuli to the DUT

    for(i=0;i<10;i++) begin
      data1 = $urandom(); // unsigned 32 bit random value
      $display("Data Sent: %0d", data1);
     #10; // Generate random values at a delay of 10ns
    end
    -> done;
  end

  // Driver: Receiving Data
  initial begin

   forever begin // Loops executes till eos
    #10;
    data2 = data1;
     $display("Data RCVD: %0d", data2);
    
   end

  end

  
  initial begin
    wait(done.triggered);
    $finish;
  end
  
endmodule
