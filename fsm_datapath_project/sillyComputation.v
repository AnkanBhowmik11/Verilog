module sillyComputation #(parameter W = 8)(
    input clk,
    input reset,
    input [W-1:0] yIn,

    output [W-1:0] x,
    output [W-1:0] y
);

wire [W-1:0] i;
wire [W-1:0] addiOut;
wire [W-1:0] addxOut;

wire yLoad, yClear;
wire xLoad, xClear;
wire iLoad, iClear;

wire xLT0;
wire iLEQ10;

register #(W) I (
    i, addiOut,
    iClear, iLoad, clk
);

register #(W) Y (
    y, yIn,
    yClear, yLoad, clk
);

register #(W) X (
    x, addxOut,
    xClear, xLoad, clk
);

adder #(W) addI (
    addiOut, {{(W-1){1'b0}}, 1'b1}, i
);

adder #(W) addX (
    addxOut, y, x
);

compareLT #(W) cmpX (
    xLT0, x, {W{1'b0}}
);

compareLEQ #(W) cmpI (
    iLEQ10, i, {{(W-4){1'b0}}, 4'd10}
);

fsm control (
    xLT0,
    iLEQ10,
    clk,
    reset,
    yLoad,
    yClear,
    xLoad,
    xClear,
    iLoad,
    iClear
);

endmodule