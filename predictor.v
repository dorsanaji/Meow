module predictor(input wire request, result, clk, taken, output reg prediction);
  reg state[1:0] = 2'b11;

always@(posedge clk) begin
     if (request)
          prediction = state[1];
     else if (result)
          if (taken && state!=2'b11)
                state = state+1;
          else if (!taken && state!=2'b00)
                 state = state-1;
end
endmodule
