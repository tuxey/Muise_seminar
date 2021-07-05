module flag_cdc (clkA, clkB, rst, A, B);
  input  clkA, clkB, rst, A;
  output B;

  reg r0_A, r0_B, r1_B, r2_B;
  reg r_flag_CDC;

  //Proceso de registro con reloj de origen
  always @(posedge clkA)
  begin
    if(rst == 1)
      r0_A <= 0;
    else
      r0_A <= A;
  end

  //Proceso de registro con reloj destino
  always @(posedge clkB)
  begin
    if(rst == 1)
      r0_B <= 0;
    else
      r0_B <= r0_A;
    r1_B <= r0_B;
    r2_B <= r1_B;
  end

  // Proceso para detectar flanco ascendente
  always @(posedge clkB)
  begin
    if(rst == 1)
    begin
      r0_B <= 0;
    end
    else
    begin
      if (r1_B == 1 & r2_B == 0)
      begin
        r_flag_CDC <= 1;
      end
      else
      begin
        r_flag_CDC <= 0;
      end
    end
  end

  //asignación del flanco con el nuevo reloj a la salida B
  assign B = r_flag_CDC;
endmodule
