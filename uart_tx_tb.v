 `timescale 1ns / 1ps

module uart_tx_tb();

    reg clk=0;
    reg rst;
    reg [7:0] din;
    reg enable;
    wire done;
    wire [7:0]dout;

topmod topmod(
.clk(clk),
.rst(rst),
.din(din),
.enable(enable),
.done(done),
.dout(dout)
);

 
always #5 clk<=~clk;

initial begin

rst=0;
#50
rst=1;

#50
enable=1;
din=8'b11110001;
#10;
enable=0;

@ (posedge done)
#1000;
din=8'd2;
enable=1;
#10;
enable=0;
#1000;
$finish();
end
endmodule