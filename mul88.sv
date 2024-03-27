module mul88 (
	input logic [7:0] a, b,
	input logic cin,
	output logic [15:0] mul
);
wire [7:0] sum1, sum2, sum3, sum4, sum5, sum6, sum7;
wire [0:0] carry1, carry2, carry3, carry4, carry5, carry6, carry7;

//layer0
and (mul[0], a[0], b[0]);

//layer1
FA8b fa1 (
	.sum(sum1),
	.a0(a[1] & b[0]),
	.a1(a[2] & b[0]),
	.a2(a[3] & b[0]),
	.a3(a[4] & b[0]),
	.a4(a[5] & b[0]),
	.a5(a[6] & b[0]),
	.a6(a[7] & b[0]),
	.a7(1'b0),
	.b0(a[0] & b[1]),
	.b1(a[1] & b[1]),
	.b2(a[2] & b[1]),
	.b3(a[3] & b[1]),
	.b4(a[4] & b[1]),
	.b5(a[5] & b[1]),
	.b6(a[6] & b[1]),
	.b7(a[7] & b[1]),
	.cin(cin),
	.cout(carry1)
);
	
//layer2
FA8b fa2 (
	.sum(sum2),
	.a0(sum1[1]),
	.a1(sum1[2]),
	.a2(sum1[3]),
	.a3(sum1[4]),
	.a4(sum1[5]),
	.a5(sum1[6]),
	.a6(sum1[7]),
	.a7(carry1),
	.b0(a[0] & b[2]),
	.b1(a[1] & b[2]),
	.b2(a[2] & b[2]),
	.b3(a[3] & b[2]),
	.b4(a[4] & b[2]),
	.b5(a[5] & b[2]),
	.b6(a[6] & b[2]),
	.b7(a[7] & b[2]),
	.cin(cin),
	.cout(carry2)
);

//layer3
FA8b fa3 (
	.sum(sum3),
	.a0(sum2[1]),
	.a1(sum2[2]),
	.a2(sum2[3]),
	.a3(sum2[4]),
	.a4(sum2[5]),
	.a5(sum2[6]),
	.a6(sum2[7]),
	.a7(carry2),
	.b0(a[0] & b[3]),
	.b1(a[1] & b[3]),
	.b2(a[2] & b[3]),
	.b3(a[3] & b[3]),
	.b4(a[4] & b[3]),
	.b5(a[5] & b[3]),
	.b6(a[6] & b[3]),
	.b7(a[7] & b[3]),
	.cin(cin),
	.cout(carry3)
);

//layer4
FA8b fa4 (
	.sum(sum4),
	.a0(sum3[1]),
	.a1(sum3[2]),
	.a2(sum3[3]),
	.a3(sum3[4]),
	.a4(sum3[5]),
	.a5(sum3[6]),
	.a6(sum3[7]),
	.a7(carry3),
	.b0(a[0] & b[4]),
	.b1(a[1] & b[4]),
	.b2(a[2] & b[4]),
	.b3(a[3] & b[4]),
	.b4(a[4] & b[4]),
	.b5(a[5] & b[4]),
	.b6(a[6] & b[4]),
	.b7(a[7] & b[4]),
	.cin(cin),
	.cout(carry4)
);

//layer5
FA8b fa5 (
	.sum(sum5),
	.a0(sum4[1]),
	.a1(sum4[2]),
	.a2(sum4[3]),
	.a3(sum4[4]),
	.a4(sum4[5]),
	.a5(sum4[6]),
	.a6(sum4[7]),
	.a7(carry4),
	.b0(a[0] & b[5]),
	.b1(a[1] & b[5]),
	.b2(a[2] & b[5]),
	.b3(a[3] & b[5]),
	.b4(a[4] & b[5]),
	.b5(a[5] & b[5]),
	.b6(a[6] & b[5]),
	.b7(a[7] & b[5]),
	.cin(cin),
	.cout(carry5)
);

//layer6
FA8b fa6 (
	.sum(sum6),
	.a0(sum5[1]),
	.a1(sum5[2]),
	.a2(sum5[3]),
	.a3(sum5[4]),
	.a4(sum5[5]),
	.a5(sum5[6]),
	.a6(sum5[7]),
	.a7(carry5),
	.b0(a[0] & b[6]),
	.b1(a[1] & b[6]),
	.b2(a[2] & b[6]),
	.b3(a[3] & b[6]),
	.b4(a[4] & b[6]),
	.b5(a[5] & b[6]),
	.b6(a[6] & b[6]),
	.b7(a[7] & b[6]),
	.cin(cin),
	.cout(carry6)
);

//layer7
FA8b fa7 (
	.sum(sum7),
	.a0(sum6[1]),
	.a1(sum6[2]),
	.a2(sum6[3]),
	.a3(sum6[4]),
	.a4(sum6[5]),
	.a5(sum6[6]),
	.a6(sum6[7]),
	.a7(carry6),
	.b0(a[0] & b[7]),
	.b1(a[1] & b[7]),
	.b2(a[2] & b[7]),
	.b3(a[3] & b[7]),
	.b4(a[4] & b[7]),
	.b5(a[5] & b[7]),
	.b6(a[6] & b[7]),
	.b7(a[7] & b[7]),
	.cin(cin),
	.cout(carry7)
);

assign mul[15:1] = {carry7, sum7[7:0], sum6[0], sum5[0], sum4[0], sum3[0], sum2[0], sum1[0]};

endmodule