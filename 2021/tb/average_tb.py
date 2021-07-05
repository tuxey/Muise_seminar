# -*- coding: utf-8 -*-
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer
from cocotb.regression import TestFactory
from cocotb.result import TestFailure
import random

@cocotb.test()
async def run_test(dut):
    PERIOD = 10
    g_data_size = 10
    cocotb.fork(Clock(dut.clk, PERIOD, 'ns').start(start_high=False))

    dut.reset = 0
    dut.a_in = 0
    dut.b_in = 0
    dut.avg_out = 0

    await Timer(20*PERIOD, units='ns')

    for i in range (1000):
        data_a = random.randint(0, 2**g_data_size-1)
        data_b = random.randint(0, 2**g_data_size-1) 
        dut.a_in = data_a
        dut.b_in = data_b
        await Timer(5*PERIOD, units='ns')
        if abs((data_a + data_b)/2 - int(dut.avg_out))>1 and dut.reset==0:
            raise TestFailure(
            "result is incorrect: %s != %s  <-->   inputs: %s & %s  expected result: %s"  % (str(int(dut.avg_out)), (data_a + data_b)/2,str(data_a),str(data_b), (data_a + data_b)/2))
        else:
            dut._log.info("Average: %s & %s = %s" % (str(data_a), str(data_b), str(int(dut.avg_out))))

# Register the test.
factory = TestFactory(run_test)
    