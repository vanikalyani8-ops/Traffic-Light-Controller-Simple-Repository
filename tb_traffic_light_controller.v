`timescale 1ns/1ps
module tb_traffic_light_controller;
    reg clk=0, reset=1;
    wire red,yellow,green;
    traffic_light_controller #(.GREEN_CYCLES(3),.YELLOW_CYCLES(2),.RED_CYCLES(3)) dut
      (.clk(clk),.reset(reset),.red(red),.yellow(yellow),.green(green));
    always #5 clk=~clk;

    task check_one_hot;
      begin
        if ((red+yellow+green) !== 1)
          $fatal(1,"ERROR: outputs are not one-hot: R=%b Y=%b G=%b",red,yellow,green);
      end
    endtask

    initial begin
      $dumpfile("traffic_light.vcd");
      $dumpvars(0,tb_traffic_light_controller);
      repeat(2) @(posedge clk);
      reset=0;
      repeat(20) begin
        @(negedge clk); check_one_hot();
      end
      $display("PASS: traffic-light outputs are one-hot during the test.");
      $finish;
    end
endmodule
