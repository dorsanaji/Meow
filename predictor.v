module predictor(input wire request, result, clk, taken, output reg prediction);
reg [1:0] state = 2'b11;


always@(posedge clk) begin
if (request) begin
prediction = state[1];
end

if (result) begin
//todo
if (taken && state!=2'b11) begin
state = state+1;
end
if (!taken && state!=2'b00)begin
state = state-1;
end
end
