module fsm(
    input LT,
    input LEQ,
    input clk,
    input reset,

    output reg yLoad,
    output reg yClear,
    output reg xLoad,
    output reg xClear,
    output reg iLoad,
    output reg iClear
);

reg [2:0] cState, nState;

always @(posedge clk or posedge reset) begin
    if (reset)
        cState <= 0;
    else
        cState <= nState;
end

always @(*) begin
    yLoad  = 0;
    yClear = 0;
    xLoad  = 0;
    xClear = 0;
    iLoad  = 0;
    iClear = 0;
    nState = 3'b000;

    case(cState)

    3'b000: begin
        xClear = 1;
        iClear = 1;
        nState = 3'b001;
    end

    3'b001: begin
        yLoad = 1;
        xLoad = 1;
        iLoad = 1;
        nState = 3'b010;
    end

    3'b010: begin
        if (LEQ)
            nState = 3'b001;
        else if (LT)
            nState = 3'b011;
        else
            nState = 3'b100;
    end

    default: begin
        nState = 3'b000;
    end

    endcase
end

endmodule