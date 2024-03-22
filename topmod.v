`timescale 1ns / 1ps
module topmod(
input clk,
input rst,
input [7:0] din,
input enable,
output  done,
output  [7:0] dout
);

wire rx_serial;
wire tx_serial;
    
UART_TX UART_TX(
.clk(clk),
.rst(rst),
.din(din),
.enable(enable),
.done(done),
.tx_serial(tx_serial)
);

UART_RX UART_RX(
    .clk(clk),
    .rst(rst),
    .rx_serial(rx_serial),
    .dout(dout)
);
assign rx_serial=tx_serial;

endmodule
