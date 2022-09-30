module upcounter_testbench();
reg clk, reset;
wire [3:0] counter;

up_counter dut(clk, reset, counter);
    initial begin 
        $dumpfile("Counter.vcd"); 
        $dumpvars(0, dut);
        clk=0;
        forever #5 clk=~clk;
    end
    initial begin
        reset=1;
        #10;
        reset=0;
        #100;
        $finish;
    end
endmodule